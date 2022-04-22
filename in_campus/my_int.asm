
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;my_int.c,7 :: 		void interrupt()
;my_int.c,10 :: 		if (INTCON.INTF == 1)
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;my_int.c,13 :: 		if (data_output < 0xFF)
	MOVLW      255
	SUBWF      _data_output+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt1
;my_int.c,15 :: 		data_output++;       // increment data_output by 1
	INCF       _data_output+0, 1
;my_int.c,16 :: 		INTCON.INTF = 0;     // disable INTF flag
	BCF        INTCON+0, 1
;my_int.c,17 :: 		}
L_interrupt1:
;my_int.c,19 :: 		PORTC = data_output;    // output data_output to PORTC
	MOVF       _data_output+0, 0
	MOVWF      PORTC+0
;my_int.c,20 :: 		}
L_interrupt0:
;my_int.c,21 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_init_ports:

;my_int.c,23 :: 		void init_ports()
;my_int.c,25 :: 		TRISC = 0x00;              // PORTC is configured as an output port
	CLRF       TRISC+0
;my_int.c,26 :: 		TRISB.B0 = 1;              // RB0 is configured as an input port
	BSF        TRISB+0, 0
;my_int.c,28 :: 		PORTC = data_output;       // set the initial output of PORTC using
	MOVF       _data_output+0, 0
	MOVWF      PORTC+0
;my_int.c,30 :: 		}
L_end_init_ports:
	RETURN
; end of _init_ports

_init_interrupt:

;my_int.c,32 :: 		void init_interrupt()
;my_int.c,34 :: 		INTCON.INTF = 0;           // disable INTF flag
	BCF        INTCON+0, 1
;my_int.c,35 :: 		INTCON.INTE = 1;           // locally enable INTE interrupt through
	BSF        INTCON+0, 4
;my_int.c,37 :: 		INTCON.GIE = 1;            // globally enable INTE
	BSF        INTCON+0, 7
;my_int.c,38 :: 		}
L_end_init_interrupt:
	RETURN
; end of _init_interrupt

_main:

;my_int.c,40 :: 		void main()
;my_int.c,42 :: 		init_ports();              // initialize the ports
	CALL       _init_ports+0
;my_int.c,43 :: 		init_interrupt();          // initialize the interrupt
	CALL       _init_interrupt+0
;my_int.c,45 :: 		while (1);                 // endless loop
L_main2:
	GOTO       L_main2
;my_int.c,46 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
