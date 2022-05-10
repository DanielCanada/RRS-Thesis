
_suart:

;PIC18_GPS_UART.c,21 :: 		void suart()
;PIC18_GPS_UART.c,23 :: 		error = Soft_UART_Init(&PORTD, 7, 6, 9600, 0); // Initialize Soft UART at 9600 bps
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
;PIC18_GPS_UART.c,24 :: 		if (error > 0) {
	MOVF        R0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_suart0
;PIC18_GPS_UART.c,25 :: 		UART1_Write_Text("FAIL!\x0D");
	MOVLW       ?lstr1_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,26 :: 		UART1_Write(error);                          // Signalize Init error
	MOVF        _error+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,28 :: 		}
L_suart0:
;PIC18_GPS_UART.c,29 :: 		Delay_ms(100);
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
;PIC18_GPS_UART.c,30 :: 		Delay_ms(1000);
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
;PIC18_GPS_UART.c,31 :: 		}
L_end_suart:
	RETURN      0
; end of _suart

_parse:

;PIC18_GPS_UART.c,33 :: 		void parse()
;PIC18_GPS_UART.c,51 :: 		RcvdConf = 2;
	MOVLW       2
	MOVWF       _RcvdConf+0 
	MOVLW       0
	MOVWF       _RcvdConf+1 
;PIC18_GPS_UART.c,54 :: 		UART1_Write_Text("New Admin Number: ");
	MOVLW       ?lstr2_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,55 :: 		for(x = 6;x < 19;x++)
	MOVLW       6
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
	GOTO        L__parse24
	MOVLW       19
	SUBWF       _x+0, 0 
L__parse24:
	BTFSC       STATUS+0, 0 
	GOTO        L_parse5
;PIC18_GPS_UART.c,57 :: 		if(RcvdMsg[5]='w')  // MsgMob default
	MOVLW       119
	MOVWF       _RcvdMsg+5 
;PIC18_GPS_UART.c,59 :: 		MsgMob[x-6] = RcvdMsg[x];
	MOVLW       6
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
;PIC18_GPS_UART.c,60 :: 		UART1_Write(MsgMob[x-6]);
	MOVLW       6
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
;PIC18_GPS_UART.c,55 :: 		for(x = 6;x < 19;x++)
	INFSNZ      _x+0, 1 
	INCF        _x+1, 1 
;PIC18_GPS_UART.c,62 :: 		}
	GOTO        L_parse4
L_parse5:
;PIC18_GPS_UART.c,63 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,64 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,71 :: 		ClearBuffers();
	CALL        _ClearBuffers+0, 0
;PIC18_GPS_UART.c,73 :: 		}
L_end_parse:
	RETURN      0
; end of _parse

_main:

;PIC18_GPS_UART.c,75 :: 		void main() {
;PIC18_GPS_UART.c,76 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;PIC18_GPS_UART.c,77 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
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
;PIC18_GPS_UART.c,78 :: 		suart();
	CALL        _suart+0, 0
;PIC18_GPS_UART.c,79 :: 		IncData = 0;
	CLRF        _IncData+0 
;PIC18_GPS_UART.c,81 :: 		UART1_Write_Text("Received!");
	MOVLW       ?lstr3_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,82 :: 		UART1_Write_Text("\x0D");
	MOVLW       ?lstr4_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,84 :: 		while(RcvdConf != 2)
L_main9:
	MOVLW       0
	XORWF       _RcvdConf+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main26
	MOVLW       2
	XORWF       _RcvdConf+0, 0 
L__main26:
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;PIC18_GPS_UART.c,86 :: 		byte_read = Soft_UART_Read(&error);
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _byte_read+0 
;PIC18_GPS_UART.c,88 :: 		if (error)
	MOVF        _error+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
;PIC18_GPS_UART.c,90 :: 		UART1_Write_Text("Error");
	MOVLW       ?lstr5_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,91 :: 		}
	GOTO        L_main12
L_main11:
;PIC18_GPS_UART.c,94 :: 		RcvdMsg[IncData] = byte_read;
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
;PIC18_GPS_UART.c,95 :: 		IncData++;
	INCF        _IncData+0, 1 
;PIC18_GPS_UART.c,96 :: 		if(byte_read == '\r')
	MOVF        _byte_read+0, 0 
	XORLW       13
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;PIC18_GPS_UART.c,98 :: 		IncData = 0;
	CLRF        _IncData+0 
;PIC18_GPS_UART.c,99 :: 		UART1_Write(RcvdMsg[46]);
	MOVF        _RcvdMsg+46, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,100 :: 		parse();
	CALL        _parse+0, 0
;PIC18_GPS_UART.c,101 :: 		strcpy(RcvdMsg,"");
	MOVLW       _RcvdMsg+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_RcvdMsg+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr6_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr6_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,103 :: 		}
L_main13:
;PIC18_GPS_UART.c,104 :: 		}
L_main12:
;PIC18_GPS_UART.c,105 :: 		}
	GOTO        L_main9
L_main10:
;PIC18_GPS_UART.c,106 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_send:

;PIC18_GPS_UART.c,108 :: 		void send()
;PIC18_GPS_UART.c,110 :: 		if(isSend == 2)
	MOVLW       0
	XORWF       _isSend+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__send28
	MOVLW       2
	XORWF       _isSend+0, 0 
L__send28:
	BTFSS       STATUS+0, 2 
	GOTO        L_send14
;PIC18_GPS_UART.c,123 :: 		UART1_Write_Text("AT+CMGF=1");
	MOVLW       ?lstr7_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,124 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,125 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,126 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_send15:
	DECFSZ      R13, 1, 1
	BRA         L_send15
	DECFSZ      R12, 1, 1
	BRA         L_send15
	DECFSZ      R11, 1, 1
	BRA         L_send15
	NOP
	NOP
;PIC18_GPS_UART.c,127 :: 		UART1_Write_Text("AT+CMGS=\"");
	MOVLW       ?lstr8_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,129 :: 		UART1_Write(MsgMob[0]);
	MOVF        _MsgMob+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,130 :: 		UART1_Write(MsgMob[1]);
	MOVF        _MsgMob+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,131 :: 		UART1_Write(MsgMob[2]);
	MOVF        _MsgMob+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,132 :: 		UART1_Write(MsgMob[3]);
	MOVF        _MsgMob+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,133 :: 		UART1_Write(MsgMob[4]);
	MOVF        _MsgMob+4, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,134 :: 		UART1_Write(MsgMob[5]);
	MOVF        _MsgMob+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,135 :: 		UART1_Write(MsgMob[6]);
	MOVF        _MsgMob+6, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,136 :: 		UART1_Write(MsgMob[7]);
	MOVF        _MsgMob+7, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,137 :: 		UART1_Write(MsgMob[8]);
	MOVF        _MsgMob+8, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,138 :: 		UART1_Write(MsgMob[9]);
	MOVF        _MsgMob+9, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,139 :: 		UART1_Write(MsgMob[10]);
	MOVF        _MsgMob+10, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,140 :: 		UART1_Write(MsgMob[11]);
	MOVF        _MsgMob+11, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,141 :: 		UART1_Write_Text("\"\x0D");
	MOVLW       ?lstr9_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,142 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,143 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,144 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_send16:
	DECFSZ      R13, 1, 1
	BRA         L_send16
	DECFSZ      R12, 1, 1
	BRA         L_send16
	DECFSZ      R11, 1, 1
	BRA         L_send16
	NOP
	NOP
;PIC18_GPS_UART.c,145 :: 		UART1_Write_Text("Hello from sim800L");
	MOVLW       ?lstr10_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,146 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,147 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,148 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_send17:
	DECFSZ      R13, 1, 1
	BRA         L_send17
	DECFSZ      R12, 1, 1
	BRA         L_send17
	DECFSZ      R11, 1, 1
	BRA         L_send17
	NOP
	NOP
;PIC18_GPS_UART.c,149 :: 		UART1_Write(26);
	MOVLW       26
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;PIC18_GPS_UART.c,150 :: 		delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_send18:
	DECFSZ      R13, 1, 1
	BRA         L_send18
	DECFSZ      R12, 1, 1
	BRA         L_send18
	DECFSZ      R11, 1, 1
	BRA         L_send18
	NOP
;PIC18_GPS_UART.c,151 :: 		isSend = 0;
	CLRF        _isSend+0 
	CLRF        _isSend+1 
;PIC18_GPS_UART.c,152 :: 		}
L_send14:
;PIC18_GPS_UART.c,153 :: 		}
L_end_send:
	RETURN      0
; end of _send

_ClearBuffers:

;PIC18_GPS_UART.c,156 :: 		void ClearBuffers()
;PIC18_GPS_UART.c,158 :: 		strcpy(RcvdMsg,"");
	MOVLW       _RcvdMsg+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_RcvdMsg+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr11_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr11_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,159 :: 		RcvdCheck = 0;
	CLRF        _RcvdCheck+0 
	CLRF        _RcvdCheck+1 
;PIC18_GPS_UART.c,160 :: 		RcvdConf = 0;
	CLRF        _RcvdConf+0 
	CLRF        _RcvdConf+1 
;PIC18_GPS_UART.c,161 :: 		index = 0;
	CLRF        _index+0 
	CLRF        _index+1 
;PIC18_GPS_UART.c,162 :: 		RcvdEnd = 0;
	CLRF        _RcvdEnd+0 
	CLRF        _RcvdEnd+1 
;PIC18_GPS_UART.c,163 :: 		strcpy(MsgMob,"");
	MOVLW       _MsgMob+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_MsgMob+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr12_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr12_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,164 :: 		strcpy(MsgTxt,"");
	MOVLW       _MsgTxt+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_MsgTxt+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr13_PIC18_GPS_UART+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr13_PIC18_GPS_UART+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;PIC18_GPS_UART.c,165 :: 		MsgLength = 0;
	CLRF        _MsgLength+0 
	CLRF        _MsgLength+1 
;PIC18_GPS_UART.c,166 :: 		}
L_end_ClearBuffers:
	RETURN      0
; end of _ClearBuffers

_Config:

;PIC18_GPS_UART.c,168 :: 		void Config()
;PIC18_GPS_UART.c,170 :: 		UART1_Write_Text("AT\x0D");
	MOVLW       ?lstr14_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,171 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config19:
	DECFSZ      R13, 1, 1
	BRA         L_Config19
	DECFSZ      R12, 1, 1
	BRA         L_Config19
	DECFSZ      R11, 1, 1
	BRA         L_Config19
	NOP
	NOP
;PIC18_GPS_UART.c,172 :: 		UART1_Write_Text("AT+CMGF=1\x0D");
	MOVLW       ?lstr15_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,173 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config20:
	DECFSZ      R13, 1, 1
	BRA         L_Config20
	DECFSZ      R12, 1, 1
	BRA         L_Config20
	DECFSZ      R11, 1, 1
	BRA         L_Config20
	NOP
	NOP
;PIC18_GPS_UART.c,174 :: 		UART1_Write_Text("AT+CNMI=1,2,0,0,0\x0D");
	MOVLW       ?lstr16_PIC18_GPS_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr16_PIC18_GPS_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;PIC18_GPS_UART.c,175 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Config21:
	DECFSZ      R13, 1, 1
	BRA         L_Config21
	DECFSZ      R12, 1, 1
	BRA         L_Config21
	DECFSZ      R11, 1, 1
	BRA         L_Config21
	NOP
	NOP
;PIC18_GPS_UART.c,176 :: 		}
L_end_Config:
	RETURN      0
; end of _Config
