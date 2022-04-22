
_interrupt:

;Testv2.c,6 :: 		void interrupt()
;Testv2.c,9 :: 		if (INTCON.INT0IF==1)
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;Testv2.c,12 :: 		if (data_output < 0xFF)
	MOVLW       255
	SUBWF       _data_output+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt1
;Testv2.c,14 :: 		data_output++;       // increment data_output by 1
	INCF        _data_output+0, 1 
;Testv2.c,15 :: 		INTCON.INT0IF = 0;     // disable INTF flag
	BCF         INTCON+0, 1 
;Testv2.c,16 :: 		}
L_interrupt1:
;Testv2.c,18 :: 		PORTC = data_output;    // output data_output to PORTC
	MOVF        _data_output+0, 0 
	MOVWF       PORTC+0 
;Testv2.c,19 :: 		}
L_interrupt0:
;Testv2.c,20 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_init_ports:

;Testv2.c,22 :: 		void init_ports()
;Testv2.c,24 :: 		TRISC = 0x00;              // PORTC is configured as an output port
	CLRF        TRISC+0 
;Testv2.c,25 :: 		TRISB.RB0 = 1;              // RB0 is configured as an input port
	BSF         TRISB+0, 0 
;Testv2.c,27 :: 		PORTC = data_output;       // set the initial output of PORTC using
	MOVF        _data_output+0, 0 
	MOVWF       PORTC+0 
;Testv2.c,29 :: 		}
L_end_init_ports:
	RETURN      0
; end of _init_ports

_init_interrupt:

;Testv2.c,31 :: 		void init_interrupt()
;Testv2.c,33 :: 		INTCON.GIE = 1;            // globally enable INTE
	BSF         INTCON+0, 7 
;Testv2.c,34 :: 		INTCON.INT0IE = 1;           // locally enable INTE interrupt through
	BSF         INTCON+0, 4 
;Testv2.c,35 :: 		INTCON.INT0IF = 0;           // disable INTF flag
	BCF         INTCON+0, 1 
;Testv2.c,39 :: 		}
L_end_init_interrupt:
	RETURN      0
; end of _init_interrupt

_main:

;Testv2.c,41 :: 		void main()
;Testv2.c,43 :: 		init_ports();              // initialize the ports
	CALL        _init_ports+0, 0
;Testv2.c,44 :: 		init_interrupt();          // initialize the interrupt
	CALL        _init_interrupt+0, 0
;Testv2.c,46 :: 		while (1);                 // endless loop
L_main2:
	GOTO        L_main2
;Testv2.c,47 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
