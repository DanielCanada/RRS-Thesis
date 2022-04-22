void main() {

     TRISB.F0 = 0;
     TRISD.F1 = 0;
     TRISD.F2 = 0;
     while(1)
     {
             PORTB.F0 = 1;
             Delay_ms(100);
             PORTB.F0 = 0;
             PORTD.F1 = 1;
             Delay_ms(100);
             PORTD.F1 = 0;
             PORTD.F2 = 1;
             Delay_ms(100);
             PORTD.F2 = 0;
     }
}