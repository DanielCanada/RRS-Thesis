unsigned char IncData;
int x =  0;

char RcvdMsg[60] = "";
int RcvdCheck = 0;
int RcvdConf = 0;
int index = 0;
int RcvdEnd = 0;
char MsgMob[15];
char MsgTxt[10];
int MsgLength = 0;

void RecSMS();
void ClearBuffers();
void Config();

char q, error, byte_read;

void suart()
{
  error = Soft_UART_Init(&PORTC, 7, 6, 9600, 0); // Initialize Soft UART at 14400 bps
  if (error > 0) {
    PORTD.B0 = 1;
    UART1_Write_Text("FAIL!\x0D");
    UART1_Write(error);                          // Signalize Init error
   // while(1) ;                            // Stop program
  }
  Delay_ms(100);
  Delay_ms(1000);

  for (q = 'z'; q >= 'A'; q--) {          // Send bytes from 'z' downto 'A'
    Soft_UART_Write(q);
    Delay_ms(100);
  }
  Delay_ms(1000);
}

void main() {
  suart();
  //UART1_Init(9600);               // Initialize UART module at 9600 bps
  Delay_ms(100);                  // Wait for UART module to stabilize
  Soft_UART_Write(10);
  Soft_UART_Write(13);
  //Config();

  while(1)
  {      
        IncData = Soft_UART_Read(&error);
        if (error)
        {                            // If error was detected
           Soft_UART_Write('e');
           Soft_UART_Write('r');
           Soft_UART_Write('r');
           Soft_UART_Write('o');
           Soft_UART_Write('r');
        }
        else
        {
            Soft_UART_Write(IncData);
            /*if(IncData == '+'){RcvdCheck = 1;}
            if((IncData == 'C') && (RcvdCheck == 1)){RcvdCheck = 2;}
            if((IncData == 'M') && (RcvdCheck == 2)){RcvdCheck = 3;}
            if((IncData == 'T') && (RcvdCheck == 3)){RcvdCheck = 4;}
            if(RcvdCheck == 4){index = 0;RcvdConf = 1; RcvdCheck = 0;}

            if(RcvdConf == 1)
            {
                if(IncData == '\n'){RcvdEnd++;}
                if(RcvdEnd == 3){RcvdEnd = 0;}
                RcvdMsg[index] = IncData;

                index++;
                if(RcvdEnd == 2){RcvdConf = 0;MsgLength = index-2;index = 0;}
                if(RcvdConf == 0)
                {
                    Soft_UART_Write('-');
                    for(x = 4;x < 17;x++)
                    {
                        MsgMob[x-4] = RcvdMsg[x];
                        Soft_UART_Write(MsgMob[x-4]);
                    }
                   Soft_UART_Write(10);
                   Soft_UART_Write(13);
                   Soft_UART_Write('-');
                    for(x = 46;x < MsgLength;x++)
                    {
                        MsgTxt[x-46] = RcvdMsg[x];
                        Soft_UART_Write(MsgTxt[x-46]);
                    }
                    ClearBuffers();
                }
            } */
        }
  }

}


void ClearBuffers()
{
    strcpy(RcvdMsg,"");
    RcvdCheck = 0;
    RcvdConf = 0;
    index = 0;
    RcvdEnd = 0;
    strcpy(MsgMob,"");
    strcpy(MsgTxt,"");
    MsgLength = 0;
}

void Config()
{
    Delay_ms(2000);
    UART1_Write_Text("ATE0\r\n");
    Delay_ms(1000);
    UART1_Write_Text("AT\r\n");
    Delay_ms(1000);
    UART1_Write_Text("AT+CMGF=1\r\n");
    Delay_ms(1000);
    UART1_Write_Text("AT+CNMI=1,2,0,0,0\r\n");
    Delay_ms(1000);
}