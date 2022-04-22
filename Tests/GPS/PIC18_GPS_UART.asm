
_suart:

;PIC18_GPS_UART.c,19 :: 		void suart()
;PIC18_GPS_UART.c,21 :: 		error = Soft_UART_Init(&PORTD, 7, 6, 9600, 0); // Initialize Soft UART at 14400 bps
	MOVLW       PORTD+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTD+0)
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
;PIC18_GPS_UART.c,23 :: 		UART1_Write_Text("FAIL!\x0D");
	MOVLW       ?lstr1_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,24 :: 		UART1_Write(error);                          // Signalize Init error
	MOVF        _error+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,26 :: 		}
L_suart0:
;PIC18_GPS_UART.c,27 :: 		Delay_ms(100);
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
;PIC18_GPS_UART.c,28 :: 		Delay_ms(1000);
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
;PIC18_GPS_UART.c,36 :: 		}
L_end_suart:
	RETURN      0
; end of _suart

_main:

;PIC18_GPS_UART.c,38 :: 		void main() {
;PIC18_GPS_UART.c,39 :: 		suart();
	CALL        _suart+0, 0
;PIC18_GPS_UART.c,40 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;PIC18_GPS_UART.c,41 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
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
;PIC18_GPS_UART.c,42 :: 		Soft_UART_Write(10);
	MOVLW       10
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,43 :: 		Soft_UART_Write(13);
	MOVLW       13
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,44 :: 		IncData = 0;
	CLRF        _IncData+0 
;PIC18_GPS_UART.c,47 :: 		while(1)
L_main4:
;PIC18_GPS_UART.c,49 :: 		byte_read = Soft_UART_Read(&error);
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _byte_read+0 
;PIC18_GPS_UART.c,50 :: 		if (error)
	MOVF        _error+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;PIC18_GPS_UART.c,52 :: 		Soft_UART_Write('&');
	MOVLW       38
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;PIC18_GPS_UART.c,53 :: 		}
	GOTO        L_main7
L_main6:
;PIC18_GPS_UART.c,56 :: 		MsgTxt[IncData] = byte_read;
	MOVLW       _MsgTxt+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_MsgTxt+0)
	MOVWF       FSR1L+1 
	MOVF        _IncData+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _byte_read+0, 0 
	MOVWF       POSTINC1+0 
;PIC18_GPS_UART.c,57 :: 		IncData++;
	INCF        _IncData+0, 1 
;PIC18_GPS_UART.c,58 :: 		if(byte_read == '.')
	MOVF        _byte_read+0, 0 
	XORLW       46
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;PIC18_GPS_UART.c,60 :: 		IncData = 0;
	CLRF        _IncData+0 
;PIC18_GPS_UART.c,61 :: 		UART1_Write_Text(MsgTxt);
	MOVLW       _MsgTxt+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_MsgTxt+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,62 :: 		}
L_main8:
;PIC18_GPS_UART.c,96 :: 		}
L_main7:
;PIC18_GPS_UART.c,97 :: 		}
	GOTO        L_main4
;PIC18_GPS_UART.c,99 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_ClearBuffers:

;PIC18_GPS_UART.c,102 :: 		void ClearBuffers()
;PIC18_GPS_UART.c,104 :: 		strcpy(RcvdMsg,"");
	MOVLW       _RcvdMsg+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_RcvdMsg+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr2_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr2_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,105 :: 		RcvdCheck = 0;
	CLRF        _RcvdCheck+0 
	CLRF        _RcvdCheck+1 
;PIC18_GPS_UART.c,106 :: 		RcvdConf = 0;
	CLRF        _RcvdConf+0 
	CLRF        _RcvdConf+1 
;PIC18_GPS_UART.c,107 :: 		index = 0;
	CLRF        _index+0 
	CLRF        _index+1 
;PIC18_GPS_UART.c,108 :: 		RcvdEnd = 0;
	CLRF        _RcvdEnd+0 
	CLRF        _RcvdEnd+1 
;PIC18_GPS_UART.c,109 :: 		strcpy(MsgMob,"");
	MOVLW       _MsgMob+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_MsgMob+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr3_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr3_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,110 :: 		strcpy(MsgTxt,"");
	MOVLW       _MsgTxt+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_MsgTxt+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr4_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr4_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,111 :: 		MsgLength = 0;
	CLRF        _MsgLength+0 
	CLRF        _MsgLength+1 
;PIC18_GPS_UART.c,112 :: 		}
L_end_ClearBuffers:
	RETURN      0
; end of _ClearBuffers

_Config:

;PIC18_GPS_UART.c,114 :: 		void Config()
;PIC18_GPS_UART.c,116 :: 		Delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Config9:
	DECFSZ      R13, 1, 1
	BRA         L_Config9
	DECFSZ      R12, 1, 1
	BRA         L_Config9
	DECFSZ      R11, 1, 1
	BRA         L_Config9
	NOP
;PIC18_GPS_UART.c,117 :: 		UART1_Write_Text("ATE0\r\n");
	MOVLW       ?lstr5_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,118 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config10:
	DECFSZ      R13, 1, 1
	BRA         L_Config10
	DECFSZ      R12, 1, 1
	BRA         L_Config10
	DECFSZ      R11, 1, 1
	BRA         L_Config10
	NOP
	NOP
;PIC18_GPS_UART.c,119 :: 		UART1_Write_Text("AT\r\n");
	MOVLW       ?lstr6_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,120 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config11:
	DECFSZ      R13, 1, 1
	BRA         L_Config11
	DECFSZ      R12, 1, 1
	BRA         L_Config11
	DECFSZ      R11, 1, 1
	BRA         L_Config11
	NOP
	NOP
;PIC18_GPS_UART.c,121 :: 		UART1_Write_Text("AT+CMGF=1\r\n");
	MOVLW       ?lstr7_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,122 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config12:
	DECFSZ      R13, 1, 1
	BRA         L_Config12
	DECFSZ      R12, 1, 1
	BRA         L_Config12
	DECFSZ      R11, 1, 1
	BRA         L_Config12
	NOP
	NOP
;PIC18_GPS_UART.c,123 :: 		UART1_Write_Text("AT+CNMI=1,2,0,0,0\r\n");
	MOVLW       ?lstr8_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,124 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config13:
	DECFSZ      R13, 1, 1
	BRA         L_Config13
	DECFSZ      R12, 1, 1
	BRA         L_Config13
	DECFSZ      R11, 1, 1
	BRA         L_Config13
	NOP
	NOP
;PIC18_GPS_UART.c,125 :: 		}
L_end_Config:
	RETURN      0
; end of _Config
