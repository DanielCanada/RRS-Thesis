
_suart:

;PIC18_GPS_UART.c,19 :: 		void suart()
;PIC18_GPS_UART.c,21 :: 		error = Soft_UART_Init(&PORTC, 7, 6, 9600, 0); // Initialize Soft UART at 14400 bps
	MOVLW       PORTC+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       7
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       6
	MOVWF       FARG_Soft_UART_Init_tx_pin+0 
	MOVLW       128
	MOVWF       FARG_Soft_UART_Init_baud_rate+0 
	MOVLW       37
	MOVWF       FARG_Soft_UART_Init_baud_rate+1 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Init_baud_rate+2 
	MOVWF       FARG_Soft_UART_Init_baud_rate+3 
	CLRF        FARG_Soft_UART_Init_inverted+0 
	CALL        _Soft_UART_Init+0, 0
	MOVF        R0, 0 
	MOVWF       _error+0 
;PIC18_GPS_UART.c,22 :: 		if (error > 0) {
	MOVF        R0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_suart0
;PIC18_GPS_UART.c,23 :: 		PORTD.B0 = 1;
	BSF         PORTD+0, 0 
;PIC18_GPS_UART.c,24 :: 		UART1_Write_Text("FAIL!\x0D");
	MOVLW       ?lstr1_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,25 :: 		UART1_Write(error);                          // Signalize Init error
	MOVF        _error+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,27 :: 		}
L_suart0:
;PIC18_GPS_UART.c,28 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_suart1:
	DECFSZ      R13, 1, 1
	BRA         L_suart1
	DECFSZ      R12, 1, 1
	BRA         L_suart1
	DECFSZ      R11, 1, 1
	BRA         L_suart1
	NOP
;PIC18_GPS_UART.c,29 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_suart2:
	DECFSZ      R13, 1, 1
	BRA         L_suart2
	DECFSZ      R12, 1, 1
	BRA         L_suart2
	DECFSZ      R11, 1, 1
	BRA         L_suart2
	NOP
	NOP
;PIC18_GPS_UART.c,31 :: 		for (q = 'z'; q >= 'A'; q--) {          // Send bytes from 'z' downto 'A'
	MOVLW       122
	MOVWF       _q+0 
L_suart3:
	MOVLW       65
	SUBWF       _q+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_suart4
;PIC18_GPS_UART.c,32 :: 		Soft_UART_Write(q);
	MOVF        _q+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,33 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_suart6:
	DECFSZ      R13, 1, 1
	BRA         L_suart6
	DECFSZ      R12, 1, 1
	BRA         L_suart6
	DECFSZ      R11, 1, 1
	BRA         L_suart6
	NOP
;PIC18_GPS_UART.c,31 :: 		for (q = 'z'; q >= 'A'; q--) {          // Send bytes from 'z' downto 'A'
	DECF        _q+0, 1 
;PIC18_GPS_UART.c,34 :: 		}
	GOTO        L_suart3
L_suart4:
;PIC18_GPS_UART.c,35 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_suart7:
	DECFSZ      R13, 1, 1
	BRA         L_suart7
	DECFSZ      R12, 1, 1
	BRA         L_suart7
	DECFSZ      R11, 1, 1
	BRA         L_suart7
	NOP
	NOP
;PIC18_GPS_UART.c,36 :: 		}
L_end_suart:
	RETURN      0
; end of _suart

_main:

;PIC18_GPS_UART.c,38 :: 		void main() {
;PIC18_GPS_UART.c,39 :: 		suart();
	CALL        _suart+0, 0
;PIC18_GPS_UART.c,41 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
;PIC18_GPS_UART.c,42 :: 		Soft_UART_Write(10);
	MOVLW       10
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,43 :: 		Soft_UART_Write(13);
	MOVLW       13
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,46 :: 		while(1)
L_main9:
;PIC18_GPS_UART.c,48 :: 		IncData = Soft_UART_Read(&error);
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _IncData+0 
;PIC18_GPS_UART.c,49 :: 		if (error)
	MOVF        _error+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
;PIC18_GPS_UART.c,51 :: 		Soft_UART_Write('e');
	MOVLW       101
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,52 :: 		Soft_UART_Write('r');
	MOVLW       114
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,53 :: 		Soft_UART_Write('r');
	MOVLW       114
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,54 :: 		Soft_UART_Write('o');
	MOVLW       111
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,55 :: 		Soft_UART_Write('r');
	MOVLW       114
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,56 :: 		}
	GOTO        L_main12
L_main11:
;PIC18_GPS_UART.c,59 :: 		Soft_UART_Write(IncData);
	MOVF        _IncData+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,93 :: 		}
L_main12:
;PIC18_GPS_UART.c,94 :: 		}
	GOTO        L_main9
;PIC18_GPS_UART.c,96 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_ClearBuffers:

;PIC18_GPS_UART.c,99 :: 		void ClearBuffers()
;PIC18_GPS_UART.c,101 :: 		strcpy(RcvdMsg,"");
	MOVLW       _RcvdMsg+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_RcvdMsg+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr2_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr2_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,102 :: 		RcvdCheck = 0;
	CLRF        _RcvdCheck+0 
	CLRF        _RcvdCheck+1 
;PIC18_GPS_UART.c,103 :: 		RcvdConf = 0;
	CLRF        _RcvdConf+0 
	CLRF        _RcvdConf+1 
;PIC18_GPS_UART.c,104 :: 		index = 0;
	CLRF        _index+0 
	CLRF        _index+1 
;PIC18_GPS_UART.c,105 :: 		RcvdEnd = 0;
	CLRF        _RcvdEnd+0 
	CLRF        _RcvdEnd+1 
;PIC18_GPS_UART.c,106 :: 		strcpy(MsgMob,"");
	MOVLW       _MsgMob+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_MsgMob+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr3_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr3_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,107 :: 		strcpy(MsgTxt,"");
	MOVLW       _MsgTxt+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_MsgTxt+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr4_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr4_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,108 :: 		MsgLength = 0;
	CLRF        _MsgLength+0 
	CLRF        _MsgLength+1 
;PIC18_GPS_UART.c,109 :: 		}
L_end_ClearBuffers:
	RETURN      0
; end of _ClearBuffers

_Config:

;PIC18_GPS_UART.c,111 :: 		void Config()
;PIC18_GPS_UART.c,113 :: 		Delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Config13:
	DECFSZ      R13, 1, 1
	BRA         L_Config13
	DECFSZ      R12, 1, 1
	BRA         L_Config13
	DECFSZ      R11, 1, 1
	BRA         L_Config13
	NOP
;PIC18_GPS_UART.c,114 :: 		UART1_Write_Text("ATE0\r\n");
	MOVLW       ?lstr5_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,115 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config14:
	DECFSZ      R13, 1, 1
	BRA         L_Config14
	DECFSZ      R12, 1, 1
	BRA         L_Config14
	DECFSZ      R11, 1, 1
	BRA         L_Config14
	NOP
	NOP
;PIC18_GPS_UART.c,116 :: 		UART1_Write_Text("AT\r\n");
	MOVLW       ?lstr6_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,117 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config15:
	DECFSZ      R13, 1, 1
	BRA         L_Config15
	DECFSZ      R12, 1, 1
	BRA         L_Config15
	DECFSZ      R11, 1, 1
	BRA         L_Config15
	NOP
	NOP
;PIC18_GPS_UART.c,118 :: 		UART1_Write_Text("AT+CMGF=1\r\n");
	MOVLW       ?lstr7_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,119 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config16:
	DECFSZ      R13, 1, 1
	BRA         L_Config16
	DECFSZ      R12, 1, 1
	BRA         L_Config16
	DECFSZ      R11, 1, 1
	BRA         L_Config16
	NOP
	NOP
;PIC18_GPS_UART.c,120 :: 		UART1_Write_Text("AT+CNMI=1,2,0,0,0\r\n");
	MOVLW       ?lstr8_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,121 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config17:
	DECFSZ      R13, 1, 1
	BRA         L_Config17
	DECFSZ      R12, 1, 1
	BRA         L_Config17
	DECFSZ      R11, 1, 1
	BRA         L_Config17
	NOP
	NOP
;PIC18_GPS_UART.c,122 :: 		}
L_end_Config:
	RETURN      0
; end of _Config
