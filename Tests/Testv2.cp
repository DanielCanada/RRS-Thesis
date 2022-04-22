#line 1 "C:/Users/User/Documents/Thesis/Tests/Testv2.c"
char data_output = 0x00;
#line 6 "C:/Users/User/Documents/Thesis/Tests/Testv2.c"
void interrupt()
{

 if (INTCON.INT0IF==1)
 {

 if (data_output < 0xFF)
 {
 data_output++;
 INTCON.INT0IF = 0;
 }

 PORTC = data_output;
 }
}

void init_ports()
{
 TRISC = 0x00;
 TRISB.RB0 = 1;

 PORTC = data_output;

}

void init_interrupt()
{
 INTCON.GIE = 1;
 INTCON.INT0IE = 1;
 INTCON.INT0IF = 0;



}

void main()
{
 init_ports();
 init_interrupt();

 while (1);
}
