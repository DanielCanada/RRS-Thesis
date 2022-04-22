#define FREQ 12000000
#define baud 4800
#define spbrg_value (((FREQ/64)/baud)-1)

unsigned char rx_data();
unsigned char data;
unsigned char value=0;
unsigned int i=0,pos;
unsigned char longi_data[12];
unsigned char lati_data[12];
unsigned char knot_data[12];
const int lengthA;


/* i.e. uint8_t <variable_name>; */

/****PROTOTYPES****/

void initialise(void)
{
    SPBRG = spbrg_value; //set baud rate
    RCSTAbits.SPEN = 1; //activate serial port
    RCSTAbits.CREN = 1; // enable continuous reception
    INTCON2bits.RBPU = 0; //enable weak pull-ups on port B

    //set PORTB bits for speed setting
    TRISBbits.RB0 = 1;
    TRISBbits.RB2 = 1;
    TRISBbits.RB3 = 1;
    TRISBbits.RB7 = 1;
    TRISBbits.RB5 = 1;
    TRISBbits.RB6 = 1;
    TRISBbits.RB4 = 1; //set RB1 and RB4 for USART
    TRISBbits.RB1 = 1;
}
void GPRMCdecode(void)
{
    data = rx_data(); //check the strip '$GPRMC'
    if(data =='$')
    {
        data = rx_data();
        if(data == 'G')
        {
            data = rx_data();
            if(data == 'P')
            {
                data = rx_data();
                if(data == 'R')
                {
                    data = rx_data();
                    if(data == 'M')
                    {
                        data = rx_data();
                        if(data == 'C')
                        {
                          data = rx_data();
                          if(data == ',')
                          {
                               data = rx_data();
                               while(data != ',') //skip time
                               data = rx_data();
                               if(data == 'A')
                              {
                                  data = rx_data();
                                  if(data == ',')
                                  {
                                      for(i=0;data!='N'||'S';i++)
                                      {
                                          data=rx_data();
                                          lati_data[i]=data; //store the latitude data
                                      }
                                  }
                                  data = rx_data();
                                  if(data == ',')
                                  {
                                      for(i=0;data!='E'||'W';i++)
                                      {
                                          data=rx_data();
                                          longi_data[i]=data; //store longitude data
                                      }
                                   }
                                  data = rx_data();
                                  if(data == ',')
                                  {
                                      for(i=0;data!='.';i++)
                                      {
                                          data=rx_data();
                                          knot_data[i]=data;
                                      }
                                      data=rx_data();
                                      knot_data[i+1]=data; //store speed in knots
                                  }
                               }

                            }


                        }
                     }
                }

            }
        }
    }
}
void DECODESpeed(void)
{
    knot = 0;
    const int lengthA = sizeof(knot_data) / sizeof(*knot_data);

    for(i=0;i<lengthA;i++) //store array as int into knot
    {
        knot += knot_data[i];
        if(i<lengthA-1)
        {
            int digits = (int)ceil(log10((double)knot_data[i+1]));
            knot *= (int)pow(10, digits); //turn knot from an array to an integer?
        }

    }
    mph = knot * 1.15078;
}

/******************************************************************************/
/* Main Program */
/******************************************************************************/


void main(void)
{
    /* Initialize I/O and Peripherals for application */
    initialise();
    //Setspeed();



    /* TODO <INSERT USER APPLICATION CODE HERE> */

    while(1)
    {
        GPRMCdecode();
        DECODESpeed();

    }

}

unsigned char rx_data(void)
{
    while(PIR1bits.RCIF==0); //wait until RCIF gets low (EUSART buffer is empty)
    return RCREG;
}