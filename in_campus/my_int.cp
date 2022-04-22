#line 1 "C:/Users/User/Documents/Thesis/in_campus/my_int.c"
char data_output = 0x00;
#line 7 "C:/Users/User/Documents/Thesis/in_campus/my_int.c"
void interrupt()
{

 if (INTCON.INTF == 1)
 {

 if (data_output < 0xFF)
 {
 data_output++;
 INTCON.INTF = 0;
 }

 PORTC = data_output;
 }
}

void init_ports()
{
 TRISC = 0x00;
 TRISB.B0 = 1;

 PORTC = data_output;

}

void init_interrupt()
{
 INTCON.INTF = 0;
 INTCON.INTE = 1;

 INTCON.GIE = 1;
}

void main()
{
 init_ports();
 init_interrupt();

 while (1);
}
