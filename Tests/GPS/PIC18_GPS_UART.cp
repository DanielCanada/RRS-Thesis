#line 1 "C:/Users/User/Documents/Thesis/Tests/GPS/PIC18_GPS_UART.c"
char IncData;
int x = 0;

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
 error = Soft_UART_Init(&PORTD, 7, 6, 4800, 0);
 if (error > 0) {
 UART1_Write_Text("FAIL!\x0D");
 UART1_Write(error);

 }
 Delay_ms(100);
 Delay_ms(1000);
}

void parse()
{
#line 49 "C:/Users/User/Documents/Thesis/Tests/GPS/PIC18_GPS_UART.c"
 RcvdConf = 2;
 if(RcvdConf == 2)
 {
 UART1_Write_Text("Number: ");
 for(x = 7;x < 20;x++)
 {
 MsgMob[x-7] = RcvdMsg[x];
 UART1_Write(MsgMob[x-7]);
 }
 UART1_Write(10);
 UART1_Write(13);
 UART1_Write_Text("Message: ");
 for(x = 47;x < 58;x++)
 {
 MsgTxt[x-47] = RcvdMsg[x];
 UART1_Write(MsgTxt[x-47]);
 }
 ClearBuffers();
 }
}

void main() {
 UART1_Init(4800);
 Delay_ms(100);
 suart();
 IncData = 0;

 UART1_Write_Text("Received!");
 UART1_Write_Text("\x0D");

 while(RcvdConf != 2)
 {
 byte_read = Soft_UART_Read(&error);

 if (error)
 {
 UART1_Write_Text("Error");
 }
 else
 {
 RcvdMsg[IncData] = byte_read;
 IncData++;
 if(byte_read == '.')
 {
 IncData = 0;
 UART1_Write(RcvdMsg[46]);
 parse();
 strcpy(RcvdMsg,"");
 }

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
 UART1_Write_Text("AT\x0D");
 Delay_ms(1000);
 UART1_Write_Text("AT+CMGF=1\x0D");
 Delay_ms(1000);
 UART1_Write_Text("AT+CNMI=1,2,0,0,0\x0D");
 Delay_ms(1000);
}
