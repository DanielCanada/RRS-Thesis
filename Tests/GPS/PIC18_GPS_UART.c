char IncData;
int x =  0;

char RcvdMsg[60] = "";
int RcvdCheck = 0;
int RcvdConf = 0;
int index = 0;
int RcvdEnd = 0;
char MsgMob[15];
char MsgTxt[10];
char NewAdmin[11];
int MsgLength = 0;
int isSend = 0;

void RecSMS();
void ClearBuffers();
void Config();

char q, error, byte_read;

void suart()
{
  error = Soft_UART_Init(&PORTD, 7, 6, 9600, 0); // Initialize Soft UART at 9600 bps
  if (error > 0) {
    UART1_Write_Text("FAIL!\x0D");
    UART1_Write(error);                          // Signalize Init error
   // while(1) ;                            // Stop program
  }
  Delay_ms(100);
  Delay_ms(1000);
}

void parse()
{
  /*
  if(IncData == '+'){RcvdCheck = 1;}
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
      if(RcvdEnd == 2){RcvdConf = 2;MsgLength = index-2;index = 0;}
  } */
  RcvdConf = 2;
  if(RcvdConf == 2)
  {
      UART1_Write_Text("New Admin Number: ");
      for(x = 6;x < 19;x++)
      {
          if(RcvdMsg[5]='w')  // MsgMob default
          {
            MsgMob[x-6] = RcvdMsg[x];
            UART1_Write(MsgMob[x-6]);
          }
      }
      UART1_Write(10);
      UART1_Write(13);
      //UART1_Write_Text("Message: ");
      /*for(x = 47;x < 58;x++) // default MsgLength
      {
          MsgTxt[x-47] = RcvdMsg[x];
          UART1_Write(MsgTxt[x-47]);
      }*/
      ClearBuffers();
  }
}

void main() {
  UART1_Init(9600);               // Initialize UART module at 9600 bps
  Delay_ms(100);                  // Wait for UART module to stabilize
  suart();
  IncData = 0;
  //Config();
  UART1_Write_Text("Received!");
  UART1_Write_Text("\x0D");

  while(RcvdConf != 2)
  {      
        byte_read = Soft_UART_Read(&error);
        //IncData = Soft_UART_Read(&error);
        if (error)
        {                            // If error was detected
           UART1_Write_Text("Error");
        }
        else
        {
            RcvdMsg[IncData] = byte_read;
            IncData++;
            if(byte_read == '\r')
            {
              IncData = 0;
              UART1_Write(RcvdMsg[46]);
              parse();
              strcpy(RcvdMsg,"");
              //isSend++;
            }
        }
  }
}

void send()
{
    if(isSend == 2)
    {
      /*NewAdmin[10] = MsgMob[6];
      NewAdmin[9] = MsgMob[7];
      NewAdmin[8] = MsgMob[8];
      NewAdmin[7] = MsgMob[9];
      NewAdmin[6] = MsgMob[10];
      NewAdmin[5] = MsgMob[11];
      NewAdmin[4] = MsgMob[12];
      NewAdmin[3] = MsgMob[13];
      NewAdmin[2] = MsgMob[14];
      NewAdmin[1] = MsgMob[15];
      NewAdmin[0] = MsgMob[16];*/
      UART1_Write_Text("AT+CMGF=1");
      UART1_Write(10);
      UART1_Write(13);
      delay_ms(1000);
      UART1_Write_Text("AT+CMGS=\"");
      //UART1_Write_Text(NewAdmin);
      UART1_Write(MsgMob[0]);
      UART1_Write(MsgMob[1]);
      UART1_Write(MsgMob[2]);
      UART1_Write(MsgMob[3]);
      UART1_Write(MsgMob[4]);
      UART1_Write(MsgMob[5]);
      UART1_Write(MsgMob[6]);
      UART1_Write(MsgMob[7]);
      UART1_Write(MsgMob[8]);
      UART1_Write(MsgMob[9]);
      UART1_Write(MsgMob[10]);
      UART1_Write(MsgMob[11]);
      UART1_Write_Text("\"\x0D");
      UART1_Write(10);
      UART1_Write(13);
      delay_ms(1000);
      UART1_Write_Text("Hello from sim800L");
      UART1_Write(10);
      UART1_Write(13);
      delay_ms(500);
      UART1_Write(26);
      delay_ms(3000);
      isSend = 0;
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
    UART1_Write_Text("AT\x0D");
    Delay_ms(1000);
    UART1_Write_Text("AT+CMGF=1\x0D");
    Delay_ms(1000);
    UART1_Write_Text("AT+CNMI=1,2,0,0,0\x0D");
    Delay_ms(1000);
}