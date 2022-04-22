
_main:

;testblinking.c,1 :: 		void main() {
;testblinking.c,3 :: 		TRISB.F0 = 0;
	BCF         TRISB+0, 0 
;testblinking.c,4 :: 		TRISD.F1 = 0;
	BCF         TRISD+0, 1 
;testblinking.c,5 :: 		TRISD.F2 = 0;
	BCF         TRISD+0, 2 
;testblinking.c,6 :: 		while(1)
L_main0:
;testblinking.c,8 :: 		PORTB.F0 = 1;
	BSF         PORTB+0, 0 
;testblinking.c,9 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;testblinking.c,10 :: 		PORTB.F0 = 0;
	BCF         PORTB+0, 0 
;testblinking.c,11 :: 		PORTD.F1 = 1;
	BSF         PORTD+0, 1 
;testblinking.c,12 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;testblinking.c,13 :: 		PORTD.F1 = 0;
	BCF         PORTD+0, 1 
;testblinking.c,14 :: 		PORTD.F2 = 1;
	BSF         PORTD+0, 2 
;testblinking.c,15 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;testblinking.c,16 :: 		PORTD.F2 = 0;
	BCF         PORTD+0, 2 
;testblinking.c,17 :: 		}
	GOTO        L_main0
;testblinking.c,18 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
