#line 1 "C:/Users/User/Documents/Thesis/Tests/GPS_kawat/GPS_parse_program_1.c"




unsigned char rx_data();
unsigned char data;
unsigned char value=0;
unsigned int i=0,pos;
unsigned char longi_data[12];
unsigned char lati_data[12];
unsigned char knot_data[12];
const int lengthA;






void initialise(void)
{
 SPBRG =  ((( 12000000 /64)/ 4800 )-1) ;
 RCSTAbits.SPEN = 1;
 RCSTAbits.CREN = 1;
 INTCON2bits.RBPU = 0;


 TRISBbits.RB0 = 1;
 TRISBbits.RB2 = 1;
 TRISBbits.RB3 = 1;
 TRISBbits.RB7 = 1;
 TRISBbits.RB5 = 1;
 TRISBbits.RB6 = 1;
 TRISBbits.RB4 = 1;
 TRISBbits.RB1 = 1;
}
void GPRMCdecode(void)
{
 data = rx_data();
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
 while(data != ',')
 data = rx_data();
 if(data == 'A')
 {
 data = rx_data();
 if(data == ',')
 {
 for(i=0;data!='N'||'S';i++)
 {
 data=rx_data();
 lati_data[i]=data;
 }
 }
 data = rx_data();
 if(data == ',')
 {
 for(i=0;data!='E'||'W';i++)
 {
 data=rx_data();
 longi_data[i]=data;
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
 knot_data[i+1]=data;
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

 for(i=0;i<lengthA;i++)
 {
 knot += knot_data[i];
 if(i<lengthA-1)
 {
 int digits = (int)ceil(log10((double)knot_data[i+1]));
 knot *= (int)pow(10, digits);
 }

 }
 mph = knot * 1.15078;
}






void main(void)
{

 initialise();






 while(1)
 {
 GPRMCdecode();
 DECODESpeed();

 }

}

unsigned char rx_data(void)
{
 while(PIR1bits.RCIF==0);
 return RCREG;
}
