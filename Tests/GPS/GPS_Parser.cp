#line 1 "C:/Users/User/Documents/Thesis/Tests/GPS/GPS_Parser.c"

char GPGGA_Data[90];
char phoneNumber[50] = "+639954385428";
char Send_Ready = 0;
char Is_duplicate = 0;
char Normal = 0;
char Auto = 0;
char Confirm = 0;
char cooldown = 0;
char gps_taken = 0;


char lat_first[3];
char lat_second_s[7];
int lat_second_i = 0;
float lat_second_f;

char long_first[4];
char long_second_s[7];
char long_second_s2[7];
int long_second_i = 0;
float long_second_f;

void check_button1()
{
 if(PORTB.B7 = 1)
 {
 Delay_ms(100);
 if(PORTB.B7 = 0)
 {
 Send_Ready = 1;
 Is_Duplicate = 0;
 Normal = 1;
 }else
 {
 Is_Duplicate = 1;
 }
 }else
 {

 }
}
void check_button2()
{
 if(PORTB.B6 = 1)
 {
 Delay_ms(100);
 if(PORTB.B6 = 0)
 {
 Send_Ready = 1;
 Is_Duplicate = 0;
 Auto = 1;
 }else
 {
 Is_Duplicate = 1;
 }
 }else
 {

 }
}

void check_button3()
{
 if(PORTB.B5 = 1)
 {
 Delay_ms(100);
 if(PORTB.B5 = 0)
 {

 Is_Duplicate = 0;
 Confirm = 1;
 }else
 {
 Is_Duplicate = 1;
 }
 }else
 {

 }
}

void swap_raw_data()
{


 lat_second_s[0] = GPGGA_Data[13];
 lat_second_s[1] = GPGGA_Data[14];
 lat_second_s[2] = GPGGA_Data[16];
 lat_second_s[3] = GPGGA_Data[17];
 lat_second_s[4] = GPGGA_Data[18];
 lat_second_s[5] = GPGGA_Data[19];
 lat_second_s[6] = GPGGA_Data[20];

 lat_first[2] = GPGGA_Data[11];
 lat_first[1] = GPGGA_Data[12];
 lat_first[0] = GPGGA_Data[15];

 lat_second_i = ((lat_second_s[0] - '0') * 1000) + ((lat_second_s[1] - '0') * 100) + ((lat_second_s[2] - '0') * 10) + (lat_second_s[3] - '0');

 long_first[3] = GPGGA_Data[24];
 long_first[2] = GPGGA_Data[25];
 long_first[1] = GPGGA_Data[26];
 long_first[0] = GPGGA_Data[29];
 long_second_s[0] = GPGGA_Data[27];
 long_second_s[1] = GPGGA_Data[28];
 long_second_s[2] = GPGGA_Data[30];
 long_second_s[3] = GPGGA_Data[31];
 long_second_s[4] = GPGGA_Data[32];
 long_second_s[5] = GPGGA_Data[33];
 long_second_s[6] = GPGGA_Data[34];

 long_second_i = ((long_second_s[0] - '0') * 1000) + ((long_second_s[1] - '0') * 100) + ((long_second_s[2] - '0') * 10) + (long_second_s[3] - '0');
}


void GPS_GetData(){
 unsigned char Temp = 0, Index = 0, rIndex = 9;
 char clk[15], clk2[15];
 while (!UART1_Data_Ready());
 Temp = UART1_Read();
 if (Temp == '$') {
 while (!UART1_Data_Ready());
 Temp = UART1_Read();
 if (Temp == 'G') {
 while (!UART1_Data_Ready());
 Temp = UART1_Read();
 if (Temp == 'P') {
 while (!UART1_Data_Ready());
 Temp = UART1_Read();
 if (Temp == 'G') {
 while (!UART1_Data_Ready());
 Temp = UART1_Read();
 if (Temp == 'G') {
 while (!UART1_Data_Ready());
 Temp = UART1_Read();
 if (Temp == 'A') {
 while (!UART1_Data_Ready());
 Temp = UART1_Read();
 while (Temp != '\n') {
 GPGGA_Data[Index] = Temp;

 while (!UART1_Data_Ready());
 Temp = UART1_Read();
 Index++;
 rIndex--;
 }
 Index = 0;
 cooldown++;
 swap_raw_data();

 sprinti(clk, "%8u", lat_second_i);

 lat_second_f = (lat_second_i + 0.25) / 0.6;
 sprintf(lat_second_s, "%8f", lat_second_f);

 sprinti(clk2, "%8u", long_second_i);
 long_second_f = (long_second_i + 0.125) / 0.6;
 if(long_second_f < 1000)
 {
 sprintf(long_second_s2, "%8f", long_second_f);
 long_second_s[1] = long_second_s2[0];
 long_second_s[2] = long_second_s2[1];
 long_second_s[3] = long_second_s2[2];
 long_second_s[4] = long_second_s2[3];
 long_second_s[5] = long_second_s2[4];
 long_second_s[6] = long_second_s2[5];
 long_second_s[0] = '0';
 }else
 {
 sprintf(long_second_s, "%8f", long_second_f);
 }
 lat_second_f = 0;
 if(cooldown > 4)
 {
 gps_taken = 1;
 }
 }
 }
 }
 }
 }
 }
}



void Usend(char* cmd)
{
 UART1_Write_Text(cmd);
 UART1_Write_Text("\x0D");
}


void init_pins()
{
 TRISB.B7 = 1;
 TRISB.B6 = 1;
 TRISB.B5 = 1;
 TRISD.F0 = 0;
 TRISD.F1 = 0;
 TRISD.F2 = 0;
 TRISD.F3 = 1;
 Send_Ready = 0;
 Auto = 0;
 Normal = 0;
}

void initGSM()
{
 Usend("AT");
 DELAY_MS(2000);
 Usend("AT+IPR=9600");
 delay_ms(2000);
}

void sendStartSMS()
{
 Usend("AT+CMGF=1");
 delay_ms(1000);
 UART1_WRITE_TEXT("AT+CMGS=\"+639153013461\"\x0D");
 delay_ms(1000);
 UART1_WRITE_TEXT("SYSTEM READY || ");
 UART1_WRITE_TEXT("ALERT! Transmitter no: ");
 UART1_WRITE_TEXT(phoneNumber);
 UART1_WRITE_TEXT(" to save to server and see location, use: https://rrs-receiver-website.herokuapp.com/transmitters/newtransmitter?latitude=");
 UART1_Write(lat_first[2]);
 UART1_Write(lat_first[1]);
 UART1_Write(lat_first[0]);
 UART1_Write(lat_second_s[0]);
 UART1_Write(lat_second_s[1]);
 UART1_Write(lat_second_s[2]);
 UART1_Write(lat_second_s[3]);
 UART1_Write(lat_second_s[5]);
 UART1_Write(lat_second_s[6]);
 UART1_Write_Text("&longitude=");
 UART1_Write(long_first[3]);
 UART1_Write(long_first[2]);
 UART1_Write(long_first[1]);
 UART1_Write(long_first[0]);
 UART1_Write(long_second_s[0]);
 UART1_Write(long_second_s[1]);
 UART1_Write(long_second_s[2]);
 UART1_Write(long_second_s[3]);
 UART1_Write(long_second_s[5]);
 UART1_Write(long_second_s[6]);
 UART1_Write_Text("&phoneNumber=");
 UART1_WRITE_TEXT(phoneNumber);
 delay_ms(500);
 UART1_WRITE(26);
 delay_ms(5000);
 delay_ms(3000);
 UART1_WRITE_TEXT("AT+CMGS=\"+639233205775\"\x0D");
 delay_ms(1000);
 UART1_WRITE_TEXT("HELP! I am in danger, seek authorities/barangay officials. Coordinates: ");
 UART1_Write_Text(" Latitude: ");
 UART1_Write(lat_first[2]);
 UART1_Write(lat_first[1]);
 UART1_Write(lat_first[0]);
 UART1_Write(lat_second_s[0]);
 UART1_Write(lat_second_s[1]);
 UART1_Write(lat_second_s[2]);
 UART1_Write(lat_second_s[3]);
 UART1_Write(lat_second_s[5]);
 UART1_Write(lat_second_s[6]);
 UART1_Write_Text(" Longitude: ");
 UART1_Write(long_first[3]);
 UART1_Write(long_first[2]);
 UART1_Write(long_first[1]);
 UART1_Write(long_first[0]);
 UART1_Write(long_second_s[0]);
 UART1_Write(long_second_s[1]);
 UART1_Write(long_second_s[2]);
 UART1_Write(long_second_s[3]);
 UART1_Write(long_second_s[5]);
 UART1_Write(long_second_s[6]);
 delay_ms(500);
 UART1_WRITE(26);
 delay_ms(5000);
}

void vibrate()
{
 PORTD.F1 = 1;
 delay_ms(5000);
#line 293 "C:/Users/User/Documents/Thesis/Tests/GPS/GPS_Parser.c"
 PORTD.F1 = 0;
}


void main() {
 init_pins();
 UART1_Init(9600);
 Delay_ms(100);

 while (1) {
 check_button1();

 if(Send_Ready == 1 && Is_Duplicate == 1)
 {
 if(Normal == 1)
 {

 if(Confirm == 0)
 {
 while(gps_taken == 0)
 {
 GPS_GetData();
 }
 cooldown = 0;
 gps_taken = 0;
 initGSM();
 sendStartSMS();
#line 331 "C:/Users/User/Documents/Thesis/Tests/GPS/GPS_Parser.c"
 }else
 {

 }
 delay_ms(2000);
 Send_Ready = 0;
 Auto = 0;
 Normal = 0;
 }else if(Auto == 1)
 {

 PORTD.F2 = 1;


 while(PORTD.F3 = 0);
 Confirm = 0;
 if(PORTD.F3 = 1)
 {
 while(gps_taken == 0)
 {
 GPS_GetData();
 }
 cooldown = 0;
 gps_taken = 0;
 initGSM();
 sendStartSMS();


 PORTD.F0 = 1;
 while(confirm == 0)
 {
 check_button3();
 if(confirm == 1)
 {
 PORTD.F0 == 0;
 }
 }
 }
 delay_ms(2000);
 Send_Ready = 0;
 Auto = 0;
 Confirm = 0;
 }else
 {


 }
 }else
 {

 }
 Is_Duplicate = 1;
 }
}
