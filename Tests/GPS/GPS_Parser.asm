
_check_button1:

;GPS_Parser.c,24 :: 		void check_button1()
;GPS_Parser.c,26 :: 		if(PORTB.B7 = 1)
	BSF         PORTB+0, 7 
	BTFSS       PORTB+0, 7 
	GOTO        L_check_button10
;GPS_Parser.c,28 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_check_button11:
	DECFSZ      R13, 1, 1
	BRA         L_check_button11
	DECFSZ      R12, 1, 1
	BRA         L_check_button11
	DECFSZ      R11, 1, 1
	BRA         L_check_button11
	NOP
;GPS_Parser.c,29 :: 		if(PORTB.B7 = 0)
	BCF         PORTB+0, 7 
	BTFSS       PORTB+0, 7 
	GOTO        L_check_button12
;GPS_Parser.c,31 :: 		Send_Ready = 1;
	MOVLW       1
	MOVWF       _Send_Ready+0 
;GPS_Parser.c,32 :: 		Is_Duplicate = 0;
	CLRF        _Is_duplicate+0 
;GPS_Parser.c,33 :: 		Normal = 1;
	MOVLW       1
	MOVWF       _Normal+0 
;GPS_Parser.c,34 :: 		}else
	GOTO        L_check_button13
L_check_button12:
;GPS_Parser.c,36 :: 		Is_Duplicate = 1;
	MOVLW       1
	MOVWF       _Is_duplicate+0 
;GPS_Parser.c,37 :: 		}
L_check_button13:
;GPS_Parser.c,38 :: 		}else
	GOTO        L_check_button14
L_check_button10:
;GPS_Parser.c,41 :: 		}
L_check_button14:
;GPS_Parser.c,42 :: 		}
L_end_check_button1:
	RETURN      0
; end of _check_button1

_check_button2:

;GPS_Parser.c,43 :: 		void check_button2()
;GPS_Parser.c,45 :: 		if(PORTB.B6 = 1)
	BSF         PORTB+0, 6 
	BTFSS       PORTB+0, 6 
	GOTO        L_check_button25
;GPS_Parser.c,47 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_check_button26:
	DECFSZ      R13, 1, 1
	BRA         L_check_button26
	DECFSZ      R12, 1, 1
	BRA         L_check_button26
	DECFSZ      R11, 1, 1
	BRA         L_check_button26
	NOP
;GPS_Parser.c,48 :: 		if(PORTB.B6 = 0)
	BCF         PORTB+0, 6 
	BTFSS       PORTB+0, 6 
	GOTO        L_check_button27
;GPS_Parser.c,50 :: 		Send_Ready = 1;
	MOVLW       1
	MOVWF       _Send_Ready+0 
;GPS_Parser.c,51 :: 		Is_Duplicate = 0;
	CLRF        _Is_duplicate+0 
;GPS_Parser.c,52 :: 		Auto = 1;
	MOVLW       1
	MOVWF       _Auto+0 
;GPS_Parser.c,53 :: 		}else
	GOTO        L_check_button28
L_check_button27:
;GPS_Parser.c,55 :: 		Is_Duplicate = 1;
	MOVLW       1
	MOVWF       _Is_duplicate+0 
;GPS_Parser.c,56 :: 		}
L_check_button28:
;GPS_Parser.c,57 :: 		}else
	GOTO        L_check_button29
L_check_button25:
;GPS_Parser.c,60 :: 		}
L_check_button29:
;GPS_Parser.c,61 :: 		}
L_end_check_button2:
	RETURN      0
; end of _check_button2

_check_button3:

;GPS_Parser.c,63 :: 		void check_button3()
;GPS_Parser.c,65 :: 		if(PORTB.B5 = 1)
	BSF         PORTB+0, 5 
	BTFSS       PORTB+0, 5 
	GOTO        L_check_button310
;GPS_Parser.c,67 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_check_button311:
	DECFSZ      R13, 1, 1
	BRA         L_check_button311
	DECFSZ      R12, 1, 1
	BRA         L_check_button311
	DECFSZ      R11, 1, 1
	BRA         L_check_button311
	NOP
;GPS_Parser.c,68 :: 		if(PORTB.B5 = 0)
	BCF         PORTB+0, 5 
	BTFSS       PORTB+0, 5 
	GOTO        L_check_button312
;GPS_Parser.c,71 :: 		Is_Duplicate = 0;
	CLRF        _Is_duplicate+0 
;GPS_Parser.c,72 :: 		Confirm = 1;
	MOVLW       1
	MOVWF       _Confirm+0 
;GPS_Parser.c,73 :: 		}else
	GOTO        L_check_button313
L_check_button312:
;GPS_Parser.c,75 :: 		Is_Duplicate = 1;
	MOVLW       1
	MOVWF       _Is_duplicate+0 
;GPS_Parser.c,76 :: 		}
L_check_button313:
;GPS_Parser.c,77 :: 		}else
	GOTO        L_check_button314
L_check_button310:
;GPS_Parser.c,80 :: 		}
L_check_button314:
;GPS_Parser.c,81 :: 		}
L_end_check_button3:
	RETURN      0
; end of _check_button3

_swap_raw_data:

;GPS_Parser.c,83 :: 		void swap_raw_data()
;GPS_Parser.c,87 :: 		lat_second_s[0] = GPGGA_Data[13];
	MOVF        _GPGGA_Data+13, 0 
	MOVWF       _lat_second_s+0 
;GPS_Parser.c,88 :: 		lat_second_s[1] = GPGGA_Data[14];
	MOVF        _GPGGA_Data+14, 0 
	MOVWF       _lat_second_s+1 
;GPS_Parser.c,89 :: 		lat_second_s[2] = GPGGA_Data[16];
	MOVF        _GPGGA_Data+16, 0 
	MOVWF       _lat_second_s+2 
;GPS_Parser.c,90 :: 		lat_second_s[3] = GPGGA_Data[17];
	MOVF        _GPGGA_Data+17, 0 
	MOVWF       _lat_second_s+3 
;GPS_Parser.c,91 :: 		lat_second_s[4] = GPGGA_Data[18];
	MOVF        _GPGGA_Data+18, 0 
	MOVWF       _lat_second_s+4 
;GPS_Parser.c,92 :: 		lat_second_s[5] = GPGGA_Data[19];
	MOVF        _GPGGA_Data+19, 0 
	MOVWF       _lat_second_s+5 
;GPS_Parser.c,93 :: 		lat_second_s[6] = GPGGA_Data[20];
	MOVF        _GPGGA_Data+20, 0 
	MOVWF       _lat_second_s+6 
;GPS_Parser.c,95 :: 		lat_first[2] = GPGGA_Data[11];
	MOVF        _GPGGA_Data+11, 0 
	MOVWF       _lat_first+2 
;GPS_Parser.c,96 :: 		lat_first[1] = GPGGA_Data[12];
	MOVF        _GPGGA_Data+12, 0 
	MOVWF       _lat_first+1 
;GPS_Parser.c,97 :: 		lat_first[0] = GPGGA_Data[15];
	MOVF        _GPGGA_Data+15, 0 
	MOVWF       _lat_first+0 
;GPS_Parser.c,99 :: 		lat_second_i = ((lat_second_s[0] - '0') * 1000) + ((lat_second_s[1] - '0') * 100) + ((lat_second_s[2] - '0') * 10) + (lat_second_s[3] - '0');
	MOVLW       48
	SUBWF       _lat_second_s+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__swap_raw_data+0 
	MOVF        R1, 0 
	MOVWF       FLOC__swap_raw_data+1 
	MOVLW       48
	SUBWF       _lat_second_s+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__swap_raw_data+0, 0 
	MOVWF       _lat_second_i+0 
	MOVF        R1, 0 
	ADDWFC      FLOC__swap_raw_data+1, 0 
	MOVWF       _lat_second_i+1 
	MOVLW       48
	SUBWF       _lat_second_s+2, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       _lat_second_i+0, 1 
	MOVF        R1, 0 
	ADDWFC      _lat_second_i+1, 1 
	MOVLW       48
	SUBWF       _lat_second_s+3, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	ADDWF       _lat_second_i+0, 1 
	MOVF        R1, 0 
	ADDWFC      _lat_second_i+1, 1 
;GPS_Parser.c,101 :: 		long_first[3] = GPGGA_Data[24];
	MOVF        _GPGGA_Data+24, 0 
	MOVWF       _long_first+3 
;GPS_Parser.c,102 :: 		long_first[2] = GPGGA_Data[25];
	MOVF        _GPGGA_Data+25, 0 
	MOVWF       _long_first+2 
;GPS_Parser.c,103 :: 		long_first[1] = GPGGA_Data[26];
	MOVF        _GPGGA_Data+26, 0 
	MOVWF       _long_first+1 
;GPS_Parser.c,104 :: 		long_first[0] = GPGGA_Data[29];
	MOVF        _GPGGA_Data+29, 0 
	MOVWF       _long_first+0 
;GPS_Parser.c,105 :: 		long_second_s[0] = GPGGA_Data[27];
	MOVF        _GPGGA_Data+27, 0 
	MOVWF       _long_second_s+0 
;GPS_Parser.c,106 :: 		long_second_s[1] = GPGGA_Data[28];
	MOVF        _GPGGA_Data+28, 0 
	MOVWF       _long_second_s+1 
;GPS_Parser.c,107 :: 		long_second_s[2] = GPGGA_Data[30];
	MOVF        _GPGGA_Data+30, 0 
	MOVWF       _long_second_s+2 
;GPS_Parser.c,108 :: 		long_second_s[3] = GPGGA_Data[31];
	MOVF        _GPGGA_Data+31, 0 
	MOVWF       _long_second_s+3 
;GPS_Parser.c,109 :: 		long_second_s[4] = GPGGA_Data[32];
	MOVF        _GPGGA_Data+32, 0 
	MOVWF       _long_second_s+4 
;GPS_Parser.c,110 :: 		long_second_s[5] = GPGGA_Data[33];
	MOVF        _GPGGA_Data+33, 0 
	MOVWF       _long_second_s+5 
;GPS_Parser.c,111 :: 		long_second_s[6] = GPGGA_Data[34];
	MOVF        _GPGGA_Data+34, 0 
	MOVWF       _long_second_s+6 
;GPS_Parser.c,113 :: 		long_second_i = ((long_second_s[0] - '0') * 1000) + ((long_second_s[1] - '0') * 100) + ((long_second_s[2] - '0') * 10) + (long_second_s[3] - '0');
	MOVLW       48
	SUBWF       _long_second_s+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__swap_raw_data+0 
	MOVF        R1, 0 
	MOVWF       FLOC__swap_raw_data+1 
	MOVLW       48
	SUBWF       _long_second_s+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__swap_raw_data+0, 0 
	MOVWF       _long_second_i+0 
	MOVF        R1, 0 
	ADDWFC      FLOC__swap_raw_data+1, 0 
	MOVWF       _long_second_i+1 
	MOVLW       48
	SUBWF       _long_second_s+2, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       _long_second_i+0, 1 
	MOVF        R1, 0 
	ADDWFC      _long_second_i+1, 1 
	MOVLW       48
	SUBWF       _long_second_s+3, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	ADDWF       _long_second_i+0, 1 
	MOVF        R1, 0 
	ADDWFC      _long_second_i+1, 1 
;GPS_Parser.c,114 :: 		}
L_end_swap_raw_data:
	RETURN      0
; end of _swap_raw_data

_GPS_GetData:

;GPS_Parser.c,117 :: 		void GPS_GetData(){
;GPS_Parser.c,118 :: 		unsigned char Temp = 0, Index = 0, rIndex = 9;
	CLRF        GPS_GetData_Temp_L0+0 
	CLRF        GPS_GetData_Index_L0+0 
;GPS_Parser.c,120 :: 		while (!UART1_Data_Ready());
L_GPS_GetData15:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData16
	GOTO        L_GPS_GetData15
L_GPS_GetData16:
;GPS_Parser.c,121 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,122 :: 		if (Temp == '$') {
	MOVF        R0, 0 
	XORLW       36
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData17
;GPS_Parser.c,123 :: 		while (!UART1_Data_Ready());
L_GPS_GetData18:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData19
	GOTO        L_GPS_GetData18
L_GPS_GetData19:
;GPS_Parser.c,124 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,125 :: 		if (Temp == 'G') {
	MOVF        R0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData20
;GPS_Parser.c,126 :: 		while (!UART1_Data_Ready());
L_GPS_GetData21:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData22
	GOTO        L_GPS_GetData21
L_GPS_GetData22:
;GPS_Parser.c,127 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,128 :: 		if (Temp == 'P') {
	MOVF        R0, 0 
	XORLW       80
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData23
;GPS_Parser.c,129 :: 		while (!UART1_Data_Ready());
L_GPS_GetData24:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData25
	GOTO        L_GPS_GetData24
L_GPS_GetData25:
;GPS_Parser.c,130 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,131 :: 		if (Temp == 'G') {
	MOVF        R0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData26
;GPS_Parser.c,132 :: 		while (!UART1_Data_Ready());
L_GPS_GetData27:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData28
	GOTO        L_GPS_GetData27
L_GPS_GetData28:
;GPS_Parser.c,133 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,134 :: 		if (Temp == 'G') {
	MOVF        R0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData29
;GPS_Parser.c,135 :: 		while (!UART1_Data_Ready());
L_GPS_GetData30:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData31
	GOTO        L_GPS_GetData30
L_GPS_GetData31:
;GPS_Parser.c,136 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,137 :: 		if (Temp == 'A') {
	MOVF        R0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData32
;GPS_Parser.c,138 :: 		while (!UART1_Data_Ready());
L_GPS_GetData33:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData34
	GOTO        L_GPS_GetData33
L_GPS_GetData34:
;GPS_Parser.c,139 :: 		Temp = UART1_Read(); //
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,140 :: 		while (Temp != '\n') {
L_GPS_GetData35:
	MOVF        GPS_GetData_Temp_L0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_GPS_GetData36
;GPS_Parser.c,141 :: 		GPGGA_Data[Index] = Temp;
	MOVLW       _GPGGA_Data+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_GPGGA_Data+0)
	MOVWF       FSR1L+1 
	MOVF        GPS_GetData_Index_L0+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	MOVF        GPS_GetData_Temp_L0+0, 0 
	MOVWF       POSTINC1+0 
;GPS_Parser.c,143 :: 		while (!UART1_Data_Ready());
L_GPS_GetData37:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData38
	GOTO        L_GPS_GetData37
L_GPS_GetData38:
;GPS_Parser.c,144 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,145 :: 		Index++;
	INCF        GPS_GetData_Index_L0+0, 1 
;GPS_Parser.c,147 :: 		}
	GOTO        L_GPS_GetData35
L_GPS_GetData36:
;GPS_Parser.c,148 :: 		Index = 0;
	CLRF        GPS_GetData_Index_L0+0 
;GPS_Parser.c,149 :: 		cooldown++;
	INCF        _cooldown+0, 1 
;GPS_Parser.c,150 :: 		swap_raw_data();
	CALL        _swap_raw_data+0, 0
;GPS_Parser.c,152 :: 		sprinti(clk, "%8u", lat_second_i);
	MOVLW       GPS_GetData_clk_L0+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(GPS_GetData_clk_L0+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_1_GPS_Parser+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_1_GPS_Parser+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_1_GPS_Parser+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        _lat_second_i+0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        _lat_second_i+1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;GPS_Parser.c,154 :: 		lat_second_f = (lat_second_i + 0.25) / 0.6;
	MOVF        _lat_second_i+0, 0 
	MOVWF       R0 
	MOVF        _lat_second_i+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       25
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _lat_second_f+0 
	MOVF        R1, 0 
	MOVWF       _lat_second_f+1 
	MOVF        R2, 0 
	MOVWF       _lat_second_f+2 
	MOVF        R3, 0 
	MOVWF       _lat_second_f+3 
;GPS_Parser.c,155 :: 		sprintf(lat_second_s, "%8f", lat_second_f);
	MOVLW       _lat_second_s+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_lat_second_s+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_2_GPS_Parser+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_2_GPS_Parser+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_2_GPS_Parser+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        R2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        R3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;GPS_Parser.c,157 :: 		sprinti(clk2, "%8u", long_second_i);
	MOVLW       GPS_GetData_clk2_L0+0
	MOVWF       FARG_sprinti_wh+0 
	MOVLW       hi_addr(GPS_GetData_clk2_L0+0)
	MOVWF       FARG_sprinti_wh+1 
	MOVLW       ?lstr_3_GPS_Parser+0
	MOVWF       FARG_sprinti_f+0 
	MOVLW       hi_addr(?lstr_3_GPS_Parser+0)
	MOVWF       FARG_sprinti_f+1 
	MOVLW       higher_addr(?lstr_3_GPS_Parser+0)
	MOVWF       FARG_sprinti_f+2 
	MOVF        _long_second_i+0, 0 
	MOVWF       FARG_sprinti_wh+5 
	MOVF        _long_second_i+1, 0 
	MOVWF       FARG_sprinti_wh+6 
	CALL        _sprinti+0, 0
;GPS_Parser.c,158 :: 		long_second_f = (long_second_i + 0.125) / 0.6;
	MOVF        _long_second_i+0, 0 
	MOVWF       R0 
	MOVF        _long_second_i+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       25
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _long_second_f+0 
	MOVF        R1, 0 
	MOVWF       _long_second_f+1 
	MOVF        R2, 0 
	MOVWF       _long_second_f+2 
	MOVF        R3, 0 
	MOVWF       _long_second_f+3 
;GPS_Parser.c,159 :: 		if(long_second_f < 1000)
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GPS_GetData39
;GPS_Parser.c,161 :: 		sprintf(long_second_s2, "%8f", long_second_f);
	MOVLW       _long_second_s2+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_long_second_s2+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_4_GPS_Parser+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_4_GPS_Parser+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_4_GPS_Parser+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _long_second_f+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _long_second_f+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _long_second_f+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _long_second_f+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;GPS_Parser.c,162 :: 		long_second_s[1] = long_second_s2[0];
	MOVF        _long_second_s2+0, 0 
	MOVWF       _long_second_s+1 
;GPS_Parser.c,163 :: 		long_second_s[2] = long_second_s2[1];
	MOVF        _long_second_s2+1, 0 
	MOVWF       _long_second_s+2 
;GPS_Parser.c,164 :: 		long_second_s[3] = long_second_s2[2];
	MOVF        _long_second_s2+2, 0 
	MOVWF       _long_second_s+3 
;GPS_Parser.c,165 :: 		long_second_s[4] = long_second_s2[3];
	MOVF        _long_second_s2+3, 0 
	MOVWF       _long_second_s+4 
;GPS_Parser.c,166 :: 		long_second_s[5] = long_second_s2[4];
	MOVF        _long_second_s2+4, 0 
	MOVWF       _long_second_s+5 
;GPS_Parser.c,167 :: 		long_second_s[6] = long_second_s2[5];
	MOVF        _long_second_s2+5, 0 
	MOVWF       _long_second_s+6 
;GPS_Parser.c,168 :: 		long_second_s[0] = '0';
	MOVLW       48
	MOVWF       _long_second_s+0 
;GPS_Parser.c,169 :: 		}else
	GOTO        L_GPS_GetData40
L_GPS_GetData39:
;GPS_Parser.c,171 :: 		sprintf(long_second_s, "%8f", long_second_f);
	MOVLW       _long_second_s+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_long_second_s+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_5_GPS_Parser+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_5_GPS_Parser+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_5_GPS_Parser+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _long_second_f+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _long_second_f+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _long_second_f+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _long_second_f+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;GPS_Parser.c,172 :: 		}
L_GPS_GetData40:
;GPS_Parser.c,173 :: 		lat_second_f = 0;
	CLRF        _lat_second_f+0 
	CLRF        _lat_second_f+1 
	CLRF        _lat_second_f+2 
	CLRF        _lat_second_f+3 
;GPS_Parser.c,174 :: 		if(cooldown > 4)
	MOVF        _cooldown+0, 0 
	SUBLW       4
	BTFSC       STATUS+0, 0 
	GOTO        L_GPS_GetData41
;GPS_Parser.c,176 :: 		gps_taken = 1;
	MOVLW       1
	MOVWF       _gps_taken+0 
;GPS_Parser.c,177 :: 		}
L_GPS_GetData41:
;GPS_Parser.c,178 :: 		}
L_GPS_GetData32:
;GPS_Parser.c,179 :: 		}
L_GPS_GetData29:
;GPS_Parser.c,180 :: 		}
L_GPS_GetData26:
;GPS_Parser.c,181 :: 		}
L_GPS_GetData23:
;GPS_Parser.c,182 :: 		}
L_GPS_GetData20:
;GPS_Parser.c,183 :: 		}
L_GPS_GetData17:
;GPS_Parser.c,184 :: 		}
L_end_GPS_GetData:
	RETURN      0
; end of _GPS_GetData

_Usend:

;GPS_Parser.c,188 :: 		void Usend(char* cmd)
;GPS_Parser.c,190 :: 		UART1_Write_Text(cmd);
	MOVF        FARG_Usend_cmd+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_Usend_cmd+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,191 :: 		UART1_Write_Text("\x0D");
	MOVLW       ?lstr6_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,192 :: 		}
L_end_Usend:
	RETURN      0
; end of _Usend

_init_pins:

;GPS_Parser.c,195 :: 		void init_pins()
;GPS_Parser.c,197 :: 		TRISB.B7 = 1; // input
	BSF         TRISB+0, 7 
;GPS_Parser.c,198 :: 		TRISB.B6 = 1; // input
	BSF         TRISB+0, 6 
;GPS_Parser.c,199 :: 		TRISB.B5 = 1; // input
	BSF         TRISB+0, 5 
;GPS_Parser.c,200 :: 		TRISD.F0 = 0; // Output Comm with ESP
	BCF         TRISD+0, 0 
;GPS_Parser.c,201 :: 		TRISD.F1 = 0; // Output Vibration Motor
	BCF         TRISD+0, 1 
;GPS_Parser.c,202 :: 		TRISD.F2 = 0; // Output Heart Rate Sensor
	BCF         TRISD+0, 2 
;GPS_Parser.c,203 :: 		TRISD.F3 = 1; // input - acceptable BPM?
	BSF         TRISD+0, 3 
;GPS_Parser.c,204 :: 		Send_Ready = 0;
	CLRF        _Send_Ready+0 
;GPS_Parser.c,205 :: 		Auto = 0;
	CLRF        _Auto+0 
;GPS_Parser.c,206 :: 		Normal = 0;
	CLRF        _Normal+0 
;GPS_Parser.c,207 :: 		}
L_end_init_pins:
	RETURN      0
; end of _init_pins

_initGSM:

;GPS_Parser.c,209 :: 		void initGSM()
;GPS_Parser.c,211 :: 		Usend("AT");
	MOVLW       ?lstr7_GPS_Parser+0
	MOVWF       FARG_Usend_cmd+0 
	MOVLW       hi_addr(?lstr7_GPS_Parser+0)
	MOVWF       FARG_Usend_cmd+1 
	CALL        _Usend+0, 0
;GPS_Parser.c,212 :: 		DELAY_MS(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_initGSM42:
	DECFSZ      R13, 1, 1
	BRA         L_initGSM42
	DECFSZ      R12, 1, 1
	BRA         L_initGSM42
	DECFSZ      R11, 1, 1
	BRA         L_initGSM42
	NOP
;GPS_Parser.c,213 :: 		Usend("AT+IPR=9600");
	MOVLW       ?lstr8_GPS_Parser+0
	MOVWF       FARG_Usend_cmd+0 
	MOVLW       hi_addr(?lstr8_GPS_Parser+0)
	MOVWF       FARG_Usend_cmd+1 
	CALL        _Usend+0, 0
;GPS_Parser.c,214 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_initGSM43:
	DECFSZ      R13, 1, 1
	BRA         L_initGSM43
	DECFSZ      R12, 1, 1
	BRA         L_initGSM43
	DECFSZ      R11, 1, 1
	BRA         L_initGSM43
	NOP
;GPS_Parser.c,215 :: 		}
L_end_initGSM:
	RETURN      0
; end of _initGSM

_sendStartSMS:

;GPS_Parser.c,217 :: 		void sendStartSMS()
;GPS_Parser.c,219 :: 		Usend("AT+CMGF=1");
	MOVLW       ?lstr9_GPS_Parser+0
	MOVWF       FARG_Usend_cmd+0 
	MOVLW       hi_addr(?lstr9_GPS_Parser+0)
	MOVWF       FARG_Usend_cmd+1 
	CALL        _Usend+0, 0
;GPS_Parser.c,220 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_sendStartSMS44:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS44
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS44
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS44
	NOP
	NOP
;GPS_Parser.c,221 :: 		UART1_WRITE_TEXT("AT+CMGS=\"+639153013461\"\x0D");  // replace this with your phone number
	MOVLW       ?lstr10_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,222 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_sendStartSMS45:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS45
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS45
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS45
	NOP
	NOP
;GPS_Parser.c,223 :: 		UART1_WRITE_TEXT("SYSTEM READY || ");
	MOVLW       ?lstr11_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,224 :: 		UART1_WRITE_TEXT("ALERT! Transmitter no: ");
	MOVLW       ?lstr12_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,225 :: 		UART1_WRITE_TEXT(phoneNumber);
	MOVLW       _phoneNumber+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_phoneNumber+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,226 :: 		UART1_WRITE_TEXT(" to save to server and see location, use: https://rrs-receiver-website.herokuapp.com/transmitters/newtransmitter?latitude=");
	MOVLW       ?lstr13_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,227 :: 		UART1_Write(lat_first[2]);
	MOVF        _lat_first+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,228 :: 		UART1_Write(lat_first[1]);
	MOVF        _lat_first+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,229 :: 		UART1_Write(lat_first[0]);
	MOVF        _lat_first+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,230 :: 		UART1_Write(lat_second_s[0]);
	MOVF        _lat_second_s+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,231 :: 		UART1_Write(lat_second_s[1]);
	MOVF        _lat_second_s+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,232 :: 		UART1_Write(lat_second_s[2]);
	MOVF        _lat_second_s+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,233 :: 		UART1_Write(lat_second_s[3]);
	MOVF        _lat_second_s+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,234 :: 		UART1_Write(lat_second_s[5]);
	MOVF        _lat_second_s+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,235 :: 		UART1_Write(lat_second_s[6]);
	MOVF        _lat_second_s+6, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,236 :: 		UART1_Write_Text("&longitude=");
	MOVLW       ?lstr14_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,237 :: 		UART1_Write(long_first[3]);
	MOVF        _long_first+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,238 :: 		UART1_Write(long_first[2]);
	MOVF        _long_first+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,239 :: 		UART1_Write(long_first[1]);
	MOVF        _long_first+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,240 :: 		UART1_Write(long_first[0]);
	MOVF        _long_first+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,241 :: 		UART1_Write(long_second_s[0]);
	MOVF        _long_second_s+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,242 :: 		UART1_Write(long_second_s[1]);
	MOVF        _long_second_s+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,243 :: 		UART1_Write(long_second_s[2]);
	MOVF        _long_second_s+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,244 :: 		UART1_Write(long_second_s[3]);
	MOVF        _long_second_s+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,245 :: 		UART1_Write(long_second_s[5]);
	MOVF        _long_second_s+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,246 :: 		UART1_Write(long_second_s[6]);
	MOVF        _long_second_s+6, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,247 :: 		UART1_Write_Text("&phoneNumber=");
	MOVLW       ?lstr15_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,248 :: 		UART1_WRITE_TEXT(phoneNumber);
	MOVLW       _phoneNumber+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_phoneNumber+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,249 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_sendStartSMS46:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS46
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS46
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS46
	NOP
	NOP
;GPS_Parser.c,250 :: 		UART1_WRITE(26);
	MOVLW       26
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,251 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_sendStartSMS47:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS47
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS47
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS47
	NOP
	NOP
;GPS_Parser.c,252 :: 		delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_sendStartSMS48:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS48
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS48
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS48
	NOP
;GPS_Parser.c,253 :: 		UART1_WRITE_TEXT("AT+CMGS=\"+639233205775\"\x0D");  // replace this with your phone number
	MOVLW       ?lstr16_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr16_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,254 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_sendStartSMS49:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS49
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS49
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS49
	NOP
	NOP
;GPS_Parser.c,255 :: 		UART1_WRITE_TEXT("HELP! I am in danger, seek authorities/barangay officials. Coordinates: ");
	MOVLW       ?lstr17_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr17_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,256 :: 		UART1_Write_Text(" Latitude: ");
	MOVLW       ?lstr18_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr18_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,257 :: 		UART1_Write(lat_first[2]);
	MOVF        _lat_first+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,258 :: 		UART1_Write(lat_first[1]);
	MOVF        _lat_first+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,259 :: 		UART1_Write(lat_first[0]);
	MOVF        _lat_first+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,260 :: 		UART1_Write(lat_second_s[0]);
	MOVF        _lat_second_s+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,261 :: 		UART1_Write(lat_second_s[1]);
	MOVF        _lat_second_s+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,262 :: 		UART1_Write(lat_second_s[2]);
	MOVF        _lat_second_s+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,263 :: 		UART1_Write(lat_second_s[3]);
	MOVF        _lat_second_s+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,264 :: 		UART1_Write(lat_second_s[5]);
	MOVF        _lat_second_s+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,265 :: 		UART1_Write(lat_second_s[6]);
	MOVF        _lat_second_s+6, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,266 :: 		UART1_Write_Text(" Longitude: ");
	MOVLW       ?lstr19_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr19_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,267 :: 		UART1_Write(long_first[3]);
	MOVF        _long_first+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,268 :: 		UART1_Write(long_first[2]);
	MOVF        _long_first+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,269 :: 		UART1_Write(long_first[1]);
	MOVF        _long_first+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,270 :: 		UART1_Write(long_first[0]);
	MOVF        _long_first+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,271 :: 		UART1_Write(long_second_s[0]);
	MOVF        _long_second_s+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,272 :: 		UART1_Write(long_second_s[1]);
	MOVF        _long_second_s+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,273 :: 		UART1_Write(long_second_s[2]);
	MOVF        _long_second_s+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,274 :: 		UART1_Write(long_second_s[3]);
	MOVF        _long_second_s+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,275 :: 		UART1_Write(long_second_s[5]);
	MOVF        _long_second_s+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,276 :: 		UART1_Write(long_second_s[6]);
	MOVF        _long_second_s+6, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,277 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_sendStartSMS50:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS50
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS50
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS50
	NOP
	NOP
;GPS_Parser.c,278 :: 		UART1_WRITE(26);
	MOVLW       26
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,279 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_sendStartSMS51:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS51
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS51
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS51
	NOP
	NOP
;GPS_Parser.c,280 :: 		}
L_end_sendStartSMS:
	RETURN      0
; end of _sendStartSMS

_vibrate:

;GPS_Parser.c,282 :: 		void vibrate()
;GPS_Parser.c,284 :: 		PORTD.F1 = 1;
	BSF         PORTD+0, 1 
;GPS_Parser.c,285 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_vibrate52:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate52
	DECFSZ      R12, 1, 1
	BRA         L_vibrate52
	DECFSZ      R11, 1, 1
	BRA         L_vibrate52
	NOP
	NOP
;GPS_Parser.c,293 :: 		PORTD.F1 = 0;
	BCF         PORTD+0, 1 
;GPS_Parser.c,294 :: 		}
L_end_vibrate:
	RETURN      0
; end of _vibrate

_main:

;GPS_Parser.c,297 :: 		void main() {
;GPS_Parser.c,298 :: 		init_pins();
	CALL        _init_pins+0, 0
;GPS_Parser.c,299 :: 		UART1_Init(9600); // Initialize UART module at 9600 bps
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;GPS_Parser.c,300 :: 		Delay_ms(100); // Wait for UART module to stabilize
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	DECFSZ      R11, 1, 1
	BRA         L_main53
	NOP
;GPS_Parser.c,302 :: 		while (1) {
L_main54:
;GPS_Parser.c,303 :: 		check_button1();
	CALL        _check_button1+0, 0
;GPS_Parser.c,305 :: 		if(Send_Ready == 1 && Is_Duplicate == 1)
	MOVF        _Send_Ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main58
	MOVF        _Is_duplicate+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main58
L__main78:
;GPS_Parser.c,307 :: 		if(Normal == 1)
	MOVF        _Normal+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main59
;GPS_Parser.c,310 :: 		if(Confirm == 0)
	MOVF        _Confirm+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main60
;GPS_Parser.c,312 :: 		while(gps_taken == 0)
L_main61:
	MOVF        _gps_taken+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main62
;GPS_Parser.c,314 :: 		GPS_GetData();
	CALL        _GPS_GetData+0, 0
;GPS_Parser.c,315 :: 		}
	GOTO        L_main61
L_main62:
;GPS_Parser.c,316 :: 		cooldown = 0;
	CLRF        _cooldown+0 
;GPS_Parser.c,317 :: 		gps_taken = 0;
	CLRF        _gps_taken+0 
;GPS_Parser.c,318 :: 		initGSM();     // AT init with baud rate config
	CALL        _initGSM+0, 0
;GPS_Parser.c,319 :: 		sendStartSMS();  // Send SMS
	CALL        _sendStartSMS+0, 0
;GPS_Parser.c,331 :: 		}else
	GOTO        L_main63
L_main60:
;GPS_Parser.c,334 :: 		}
L_main63:
;GPS_Parser.c,335 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main64:
	DECFSZ      R13, 1, 1
	BRA         L_main64
	DECFSZ      R12, 1, 1
	BRA         L_main64
	DECFSZ      R11, 1, 1
	BRA         L_main64
	NOP
;GPS_Parser.c,336 :: 		Send_Ready = 0;
	CLRF        _Send_Ready+0 
;GPS_Parser.c,337 :: 		Auto = 0;
	CLRF        _Auto+0 
;GPS_Parser.c,338 :: 		Normal = 0;
	CLRF        _Normal+0 
;GPS_Parser.c,339 :: 		}else if(Auto == 1)
	GOTO        L_main65
L_main59:
	MOVF        _Auto+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main66
;GPS_Parser.c,342 :: 		PORTD.F2 = 1;
	BSF         PORTD+0, 2 
;GPS_Parser.c,345 :: 		while(PORTD.F3 = 0); // never ending lul
L_main67:
	BCF         PORTD+0, 3 
	BTFSS       PORTD+0, 3 
	GOTO        L_main68
	GOTO        L_main67
L_main68:
;GPS_Parser.c,346 :: 		Confirm = 0;
	CLRF        _Confirm+0 
;GPS_Parser.c,347 :: 		if(PORTD.F3 = 1)
	BSF         PORTD+0, 3 
	BTFSS       PORTD+0, 3 
	GOTO        L_main69
;GPS_Parser.c,349 :: 		while(gps_taken == 0)
L_main70:
	MOVF        _gps_taken+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main71
;GPS_Parser.c,351 :: 		GPS_GetData();
	CALL        _GPS_GetData+0, 0
;GPS_Parser.c,352 :: 		}
	GOTO        L_main70
L_main71:
;GPS_Parser.c,353 :: 		cooldown = 0;
	CLRF        _cooldown+0 
;GPS_Parser.c,354 :: 		gps_taken = 0;
	CLRF        _gps_taken+0 
;GPS_Parser.c,355 :: 		initGSM();
	CALL        _initGSM+0, 0
;GPS_Parser.c,356 :: 		sendStartSMS();
	CALL        _sendStartSMS+0, 0
;GPS_Parser.c,359 :: 		PORTD.F0 = 1;
	BSF         PORTD+0, 0 
;GPS_Parser.c,360 :: 		while(confirm == 0)
L_main72:
	MOVF        _Confirm+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main73
;GPS_Parser.c,362 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,363 :: 		if(confirm == 1)
	MOVF        _Confirm+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main74
;GPS_Parser.c,366 :: 		}
L_main74:
;GPS_Parser.c,367 :: 		}
	GOTO        L_main72
L_main73:
;GPS_Parser.c,368 :: 		}
L_main69:
;GPS_Parser.c,369 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main75:
	DECFSZ      R13, 1, 1
	BRA         L_main75
	DECFSZ      R12, 1, 1
	BRA         L_main75
	DECFSZ      R11, 1, 1
	BRA         L_main75
	NOP
;GPS_Parser.c,370 :: 		Send_Ready = 0;
	CLRF        _Send_Ready+0 
;GPS_Parser.c,371 :: 		Auto = 0;
	CLRF        _Auto+0 
;GPS_Parser.c,372 :: 		Confirm = 0;
	CLRF        _Confirm+0 
;GPS_Parser.c,373 :: 		}else
	GOTO        L_main76
L_main66:
;GPS_Parser.c,377 :: 		}
L_main76:
L_main65:
;GPS_Parser.c,378 :: 		}else
	GOTO        L_main77
L_main58:
;GPS_Parser.c,381 :: 		}
L_main77:
;GPS_Parser.c,382 :: 		Is_Duplicate = 1;
	MOVLW       1
	MOVWF       _Is_duplicate+0 
;GPS_Parser.c,383 :: 		}
	GOTO        L_main54
;GPS_Parser.c,384 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
