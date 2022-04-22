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
 error = Soft_UART_Init(&PORTD, 7, 6, 9600, 0);
 if (error > 0) {
 UART1_Write_Text("FAIL!\x0D");
 UART1_Write(error);

 }
 Delay_ms(100);
 Delay_ms(1000);
#line 36 "C:/Users/User/Documents/Thesis/Tests/GPS/PIC18_GPS_UART.c"
}

void main() {
 suart();
 UART1_Init(9600);
 Delay_ms(100);
 Soft_UART_Write(10);
 Soft_UART_Write(13);
 IncData = 0;


 while(1)
 {
 byte_read = Soft_UART_Read(&error);
 if (error)
 {
 Soft_UART_Write('&');
 }
 else
 {
 MsgTxt[IncData] = byte_read;
 IncData++;
 if(byte_read == '.')
 {
 IncData = 0;
 UART1_Write_Text(MsgTxt);
 }
#line 96 "C:/Users/User/Documents/Thesis/Tests/GPS/PIC18_GPS_UART.c"
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
