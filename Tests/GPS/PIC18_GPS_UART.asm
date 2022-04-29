
_suart:

;PIC18_GPS_UART.c,19 :: 		void suart()
;PIC18_GPS_UART.c,21 :: 		error = Soft_UART_Init(&PORTD, 7, 6, 4800, 0); // Initialize Soft UART at 9600 bps
	MOVLW       PORTD+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       7
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       6
	MOVWF       FARG_Soft_UART_Init_tx_pin+0 
	MOVLW       192
	MOVWF       FARG_Soft_UART_Init_baud_rate+0 
	MOVLW       18
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
;PIC18_GPS_UART.c,29 :: 		}
L_end_suart:
	RETURN      0
; end of _suart

_parse:

;PIC18_GPS_UART.c,31 :: 		void parse()
;PIC18_GPS_UART.c,49 :: 		RcvdConf = 2;
	MOVLW       2
	MOVWF       _RcvdConf+0 
	MOVLW       0
	MOVWF       _RcvdConf+1 
;PIC18_GPS_UART.c,52 :: 		UART1_Write_Text("Number: ");
	MOVLW       ?lstr2_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,53 :: 		for(x = 7;x < 20;x++)
	MOVLW       7
	MOVWF       _x+0 
	MOVLW       0
	MOVWF       _x+1 
L_parse4:
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__parse21
	MOVLW       20
	SUBWF       _x+0, 0 
L__parse21:
	BTFSC       STATUS+0, 0 
	GOTO        L_parse5
;PIC18_GPS_UART.c,55 :: 		MsgMob[x-7] = RcvdMsg[x];
	MOVLW       7
	SUBWF       _x+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _x+1, 0 
	MOVWF       R1 
	MOVLW       _MsgMob+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_MsgMob+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVLW       _RcvdMsg+0
	ADDWF       _x+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_RcvdMsg+0)
	ADDWFC      _x+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;PIC18_GPS_UART.c,56 :: 		UART1_Write(MsgMob[x-7]);
	MOVLW       7
	SUBWF       _x+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _x+1, 0 
	MOVWF       R1 
	MOVLW       _MsgMob+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_MsgMob+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,53 :: 		for(x = 7;x < 20;x++)
	INFSNZ      _x+0, 1 
	INCF        _x+1, 1 
;PIC18_GPS_UART.c,57 :: 		}
	GOTO        L_parse4
L_parse5:
;PIC18_GPS_UART.c,58 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,59 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,60 :: 		UART1_Write_Text("Message: ");
	MOVLW       ?lstr3_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,61 :: 		for(x = 47;x < 58;x++) // default MsgLength
	MOVLW       47
	MOVWF       _x+0 
	MOVLW       0
	MOVWF       _x+1 
L_parse7:
	MOVLW       128
	XORWF       _x+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__parse22
	MOVLW       58
	SUBWF       _x+0, 0 
L__parse22:
	BTFSC       STATUS+0, 0 
	GOTO        L_parse8
;PIC18_GPS_UART.c,63 :: 		MsgTxt[x-47] = RcvdMsg[x];
	MOVLW       47
	SUBWF       _x+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _x+1, 0 
	MOVWF       R1 
	MOVLW       _MsgTxt+0
	ADDWF       R0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_MsgTxt+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1L+1 
	MOVLW       _RcvdMsg+0
	ADDWF       _x+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_RcvdMsg+0)
	ADDWFC      _x+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;PIC18_GPS_UART.c,64 :: 		UART1_Write(MsgTxt[x-47]);
	MOVLW       47
	SUBWF       _x+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      _x+1, 0 
	MOVWF       R1 
	MOVLW       _MsgTxt+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_MsgTxt+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,61 :: 		for(x = 47;x < 58;x++) // default MsgLength
	INFSNZ      _x+0, 1 
	INCF        _x+1, 1 
;PIC18_GPS_UART.c,65 :: 		}
	GOTO        L_parse7
L_parse8:
;PIC18_GPS_UART.c,66 :: 		ClearBuffers();
	CALL        _ClearBuffers+0, 0
;PIC18_GPS_UART.c,68 :: 		}
L_end_parse:
	RETURN      0
; end of _parse

_main:

;PIC18_GPS_UART.c,70 :: 		void main() {
;PIC18_GPS_UART.c,71 :: 		UART1_Init(4800);               // Initialize UART module at 9600 bps
	BSF         BAUDCON+0, 3, 0
	MOVLW       1
	MOVWF       SPBRGH+0 
	MOVLW       160
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;PIC18_GPS_UART.c,72 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;PIC18_GPS_UART.c,73 :: 		suart();
	CALL        _suart+0, 0
;PIC18_GPS_UART.c,74 :: 		IncData = 0;
	CLRF        _IncData+0 
;PIC18_GPS_UART.c,76 :: 		UART1_Write_Text("Received!");
	MOVLW       ?lstr4_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,77 :: 		UART1_Write_Text("\x0D");
	MOVLW       ?lstr5_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,79 :: 		while(RcvdConf != 2)
L_main11:
	MOVLW       0
	XORWF       _RcvdConf+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVLW       2
	XORWF       _RcvdConf+0, 0 
L__main24:
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
;PIC18_GPS_UART.c,81 :: 		byte_read = Soft_UART_Read(&error);
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _byte_read+0 
;PIC18_GPS_UART.c,83 :: 		if (error)
	MOVF        _error+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
;PIC18_GPS_UART.c,85 :: 		UART1_Write_Text("Error");
	MOVLW       ?lstr6_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,86 :: 		}
	GOTO        L_main14
L_main13:
;PIC18_GPS_UART.c,89 :: 		RcvdMsg[IncData] = byte_read;
	MOVLW       _RcvdMsg+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_RcvdMsg+0)
	MOVWF       FSR1L+1 
	MOVF        _IncData+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        _byte_read+0, 0 
	MOVWF       POSTINC1+0 
;PIC18_GPS_UART.c,90 :: 		IncData++;
	INCF        _IncData+0, 1 
;PIC18_GPS_UART.c,91 :: 		if(byte_read == '.')
	MOVF        _byte_read+0, 0 
	XORLW       46
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;PIC18_GPS_UART.c,93 :: 		IncData = 0;
	CLRF        _IncData+0 
;PIC18_GPS_UART.c,94 :: 		UART1_Write(RcvdMsg[46]);
	MOVF        _RcvdMsg+46, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,95 :: 		parse();
	CALL        _parse+0, 0
;PIC18_GPS_UART.c,96 :: 		strcpy(RcvdMsg,"");
	MOVLW       _RcvdMsg+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_RcvdMsg+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr7_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr7_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,97 :: 		}
L_main15:
;PIC18_GPS_UART.c,99 :: 		}
L_main14:
;PIC18_GPS_UART.c,100 :: 		}
	GOTO        L_main11
L_main12:
;PIC18_GPS_UART.c,101 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_ClearBuffers:

;PIC18_GPS_UART.c,104 :: 		void ClearBuffers()
;PIC18_GPS_UART.c,106 :: 		strcpy(RcvdMsg,"");
	MOVLW       _RcvdMsg+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_RcvdMsg+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr8_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr8_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,107 :: 		RcvdCheck = 0;
	CLRF        _RcvdCheck+0 
	CLRF        _RcvdCheck+1 
;PIC18_GPS_UART.c,108 :: 		RcvdConf = 0;
	CLRF        _RcvdConf+0 
	CLRF        _RcvdConf+1 
;PIC18_GPS_UART.c,109 :: 		index = 0;
	CLRF        _index+0 
	CLRF        _index+1 
;PIC18_GPS_UART.c,110 :: 		RcvdEnd = 0;
	CLRF        _RcvdEnd+0 
	CLRF        _RcvdEnd+1 
;PIC18_GPS_UART.c,111 :: 		strcpy(MsgMob,"");
	MOVLW       _MsgMob+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_MsgMob+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr9_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr9_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,112 :: 		strcpy(MsgTxt,"");
	MOVLW       _MsgTxt+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_MsgTxt+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr10_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr10_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,113 :: 		MsgLength = 0;
	CLRF        _MsgLength+0 
	CLRF        _MsgLength+1 
;PIC18_GPS_UART.c,114 :: 		}
L_end_ClearBuffers:
	RETURN      0
; end of _ClearBuffers

_Config:

;PIC18_GPS_UART.c,116 :: 		void Config()
;PIC18_GPS_UART.c,118 :: 		UART1_Write_Text("AT\x0D");
	MOVLW       ?lstr11_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_PIC18_GPS_UART+0)
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
;PIC18_GPS_UART.c,120 :: 		UART1_Write_Text("AT+CMGF=1\x0D");
	MOVLW       ?lstr12_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_PIC18_GPS_UART+0)
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
;PIC18_GPS_UART.c,122 :: 		UART1_Write_Text("AT+CNMI=1,2,0,0,0\x0D");
	MOVLW       ?lstr13_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,123 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config18:
	DECFSZ      R13, 1, 1
	BRA         L_Config18
	DECFSZ      R12, 1, 1
	BRA         L_Config18
	DECFSZ      R11, 1, 1
	BRA         L_Config18
	NOP
	NOP
;PIC18_GPS_UART.c,124 :: 		}
L_end_Config:
	RETURN      0
; end of _Config
