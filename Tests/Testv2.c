char data_output = 0x00;
/*
   If an interrupt was requested, the program will automatically call the
   function interrupt()
*/
void interrupt()
{
   // check if RB0/INT requested an interrupt
   if (INTCON.INT0IF==1)
   {
      // check if data_output is less than FF
      if (data_output < 0xFF)
      {
         data_output++;       // increment data_output by 1
         INTCON.INT0IF = 0;     // disable INTF flag
      }

      PORTC = data_output;    // output data_output to PORTC
   }
}

void init_ports()
{
   TRISC = 0x00;              // PORTC is configured as an output port
   TRISB.RB0 = 1;              // RB0 is configured as an input port

   PORTC = data_output;       // set the initial output of PORTC using
// data_output
}

void init_interrupt()
{
   INTCON.GIE = 1;            // globally enable INTE
   INTCON.INT0IE = 1;           // locally enable INTE interrupt through
   INTCON.INT0IF = 0;           // disable INTF flag

// RB0/INT pin

}

void main()
{
   init_ports();              // initialize the ports
   init_interrupt();          // initialize the interrupt

   while (1);                 // endless loop
}