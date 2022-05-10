
_check_button1:

;GPS_Parser.c,26 :: 		void check_button1()
;GPS_Parser.c,28 :: 		if(PORTB.B7 == 1)
	BTFSS       PORTB+0, 7 
	GOTO        L_check_button10
;GPS_Parser.c,30 :: 		Delay_ms(100);
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
;GPS_Parser.c,31 :: 		if(PORTB.B7 == 0)
	BTFSC       PORTB+0, 7 
	GOTO        L_check_button12
;GPS_Parser.c,33 :: 		Send_Ready = 1;
	MOVLW       1
	MOVWF       _Send_Ready+0 
;GPS_Parser.c,34 :: 		Is_Duplicate = 0;
	CLRF        _Is_duplicate+0 
;GPS_Parser.c,35 :: 		Normal = 1;
	MOVLW       1
	MOVWF       _Normal+0 
;GPS_Parser.c,36 :: 		}else
	GOTO        L_check_button13
L_check_button12:
;GPS_Parser.c,38 :: 		Is_Duplicate = 1;
	MOVLW       1
	MOVWF       _Is_duplicate+0 
;GPS_Parser.c,39 :: 		}
L_check_button13:
;GPS_Parser.c,40 :: 		}else
	GOTO        L_check_button14
L_check_button10:
;GPS_Parser.c,43 :: 		}
L_check_button14:
;GPS_Parser.c,44 :: 		}
L_end_check_button1:
	RETURN      0
; end of _check_button1

_check_button2:

;GPS_Parser.c,45 :: 		void check_button2()
;GPS_Parser.c,47 :: 		if(PORTB.B6 == 1)
	BTFSS       PORTB+0, 6 
	GOTO        L_check_button25
;GPS_Parser.c,49 :: 		Delay_ms(100);
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
;GPS_Parser.c,50 :: 		if(PORTB.B6 == 0)
	BTFSC       PORTB+0, 6 
	GOTO        L_check_button27
;GPS_Parser.c,52 :: 		Send_Ready = 1;
	MOVLW       1
	MOVWF       _Send_Ready+0 
;GPS_Parser.c,53 :: 		Is_Duplicate = 0;
	CLRF        _Is_duplicate+0 
;GPS_Parser.c,54 :: 		Auto = 1;
	MOVLW       1
	MOVWF       _Auto+0 
;GPS_Parser.c,55 :: 		}else
	GOTO        L_check_button28
L_check_button27:
;GPS_Parser.c,57 :: 		Is_Duplicate = 1;
	MOVLW       1
	MOVWF       _Is_duplicate+0 
;GPS_Parser.c,58 :: 		}
L_check_button28:
;GPS_Parser.c,59 :: 		}else
	GOTO        L_check_button29
L_check_button25:
;GPS_Parser.c,62 :: 		}
L_check_button29:
;GPS_Parser.c,63 :: 		}
L_end_check_button2:
	RETURN      0
; end of _check_button2

_check_button3:

;GPS_Parser.c,65 :: 		void check_button3()
;GPS_Parser.c,67 :: 		if(PORTB.B5 == 1)
	BTFSS       PORTB+0, 5 
	GOTO        L_check_button310
;GPS_Parser.c,69 :: 		Delay_ms(100);
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
;GPS_Parser.c,70 :: 		if(PORTB.B5 == 0)
	BTFSC       PORTB+0, 5 
	GOTO        L_check_button312
;GPS_Parser.c,73 :: 		Is_Duplicate = 0;
	CLRF        _Is_duplicate+0 
;GPS_Parser.c,74 :: 		Confirm = 1;
	MOVLW       1
	MOVWF       _Confirm+0 
;GPS_Parser.c,75 :: 		}else
	GOTO        L_check_button313
L_check_button312:
;GPS_Parser.c,77 :: 		Is_Duplicate = 1;
	MOVLW       1
	MOVWF       _Is_duplicate+0 
;GPS_Parser.c,78 :: 		}
L_check_button313:
;GPS_Parser.c,79 :: 		}else
	GOTO        L_check_button314
L_check_button310:
;GPS_Parser.c,82 :: 		}
L_check_button314:
;GPS_Parser.c,83 :: 		}
L_end_check_button3:
	RETURN      0
; end of _check_button3

_act_sensor:

;GPS_Parser.c,85 :: 		void act_sensor()
;GPS_Parser.c,87 :: 		PORTD.B2 = 1;
	BSF         PORTD+0, 2 
;GPS_Parser.c,88 :: 		while(isComplete == 0)
L_act_sensor15:
	MOVF        _isComplete+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_act_sensor16
;GPS_Parser.c,90 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,91 :: 		if(Confirm == 1)
	MOVF        _Confirm+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_act_sensor17
;GPS_Parser.c,93 :: 		isComplete = 1;
	MOVLW       1
	MOVWF       _isComplete+0 
;GPS_Parser.c,95 :: 		PORTD.B2 = 0;
	BCF         PORTD+0, 2 
;GPS_Parser.c,96 :: 		}else if(PORTD.B3 == 1)
	GOTO        L_act_sensor18
L_act_sensor17:
	BTFSS       PORTD+0, 3 
	GOTO        L_act_sensor19
;GPS_Parser.c,98 :: 		isComplete = 1;
	MOVLW       1
	MOVWF       _isComplete+0 
;GPS_Parser.c,100 :: 		PORTD.B2 = 0;
	BCF         PORTD+0, 2 
;GPS_Parser.c,101 :: 		}else
	GOTO        L_act_sensor20
L_act_sensor19:
;GPS_Parser.c,104 :: 		isComplete = 0;
	CLRF        _isComplete+0 
;GPS_Parser.c,105 :: 		}
L_act_sensor20:
L_act_sensor18:
;GPS_Parser.c,106 :: 		}
	GOTO        L_act_sensor15
L_act_sensor16:
;GPS_Parser.c,107 :: 		}
L_end_act_sensor:
	RETURN      0
; end of _act_sensor

_swap_raw_data:

;GPS_Parser.c,109 :: 		void swap_raw_data()
;GPS_Parser.c,113 :: 		lat_second_s[0] = GPGGA_Data[13];
	MOVF        _GPGGA_Data+13, 0 
	MOVWF       _lat_second_s+0 
;GPS_Parser.c,114 :: 		lat_second_s[1] = GPGGA_Data[14];
	MOVF        _GPGGA_Data+14, 0 
	MOVWF       _lat_second_s+1 
;GPS_Parser.c,115 :: 		lat_second_s[2] = GPGGA_Data[16];
	MOVF        _GPGGA_Data+16, 0 
	MOVWF       _lat_second_s+2 
;GPS_Parser.c,116 :: 		lat_second_s[3] = GPGGA_Data[17];
	MOVF        _GPGGA_Data+17, 0 
	MOVWF       _lat_second_s+3 
;GPS_Parser.c,117 :: 		lat_second_s[4] = GPGGA_Data[18];
	MOVF        _GPGGA_Data+18, 0 
	MOVWF       _lat_second_s+4 
;GPS_Parser.c,118 :: 		lat_second_s[5] = GPGGA_Data[19];
	MOVF        _GPGGA_Data+19, 0 
	MOVWF       _lat_second_s+5 
;GPS_Parser.c,119 :: 		lat_second_s[6] = GPGGA_Data[20];
	MOVF        _GPGGA_Data+20, 0 
	MOVWF       _lat_second_s+6 
;GPS_Parser.c,121 :: 		lat_first[2] = GPGGA_Data[11];
	MOVF        _GPGGA_Data+11, 0 
	MOVWF       _lat_first+2 
;GPS_Parser.c,122 :: 		lat_first[1] = GPGGA_Data[12];
	MOVF        _GPGGA_Data+12, 0 
	MOVWF       _lat_first+1 
;GPS_Parser.c,123 :: 		lat_first[0] = '.';           //GPGGA_Data[15];
	MOVLW       46
	MOVWF       _lat_first+0 
;GPS_Parser.c,125 :: 		lat_second_i = ((lat_second_s[0] - '0') * 1000) + ((lat_second_s[1] - '0') * 100) + ((lat_second_s[2] - '0') * 10) + (lat_second_s[3] - '0');
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
;GPS_Parser.c,127 :: 		long_first[3] = GPGGA_Data[24];
	MOVF        _GPGGA_Data+24, 0 
	MOVWF       _long_first+3 
;GPS_Parser.c,128 :: 		long_first[2] = GPGGA_Data[25];
	MOVF        _GPGGA_Data+25, 0 
	MOVWF       _long_first+2 
;GPS_Parser.c,129 :: 		long_first[1] = GPGGA_Data[26];
	MOVF        _GPGGA_Data+26, 0 
	MOVWF       _long_first+1 
;GPS_Parser.c,130 :: 		long_first[0] = '.';          //GPGGA_Data[29];
	MOVLW       46
	MOVWF       _long_first+0 
;GPS_Parser.c,131 :: 		long_second_s[0] = GPGGA_Data[27];
	MOVF        _GPGGA_Data+27, 0 
	MOVWF       _long_second_s+0 
;GPS_Parser.c,132 :: 		long_second_s[1] = GPGGA_Data[28];
	MOVF        _GPGGA_Data+28, 0 
	MOVWF       _long_second_s+1 
;GPS_Parser.c,133 :: 		long_second_s[2] = GPGGA_Data[30];
	MOVF        _GPGGA_Data+30, 0 
	MOVWF       _long_second_s+2 
;GPS_Parser.c,134 :: 		long_second_s[3] = GPGGA_Data[31];
	MOVF        _GPGGA_Data+31, 0 
	MOVWF       _long_second_s+3 
;GPS_Parser.c,135 :: 		long_second_s[4] = GPGGA_Data[32];
	MOVF        _GPGGA_Data+32, 0 
	MOVWF       _long_second_s+4 
;GPS_Parser.c,136 :: 		long_second_s[5] = GPGGA_Data[33];
	MOVF        _GPGGA_Data+33, 0 
	MOVWF       _long_second_s+5 
;GPS_Parser.c,137 :: 		long_second_s[6] = GPGGA_Data[34];
	MOVF        _GPGGA_Data+34, 0 
	MOVWF       _long_second_s+6 
;GPS_Parser.c,139 :: 		long_second_i = ((long_second_s[0] - '0') * 1000) + ((long_second_s[1] - '0') * 100) + ((long_second_s[2] - '0') * 10) + (long_second_s[3] - '0');
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
;GPS_Parser.c,140 :: 		}
L_end_swap_raw_data:
	RETURN      0
; end of _swap_raw_data

_GPS_GetData:

;GPS_Parser.c,143 :: 		void GPS_GetData(){
;GPS_Parser.c,144 :: 		unsigned char Temp = 0, Index = 0, rIndex = 9;
	CLRF        GPS_GetData_Temp_L0+0 
	CLRF        GPS_GetData_Index_L0+0 
;GPS_Parser.c,146 :: 		while (!UART1_Data_Ready());
L_GPS_GetData21:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData22
	GOTO        L_GPS_GetData21
L_GPS_GetData22:
;GPS_Parser.c,147 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,148 :: 		if (Temp == '$') {
	MOVF        R0, 0 
	XORLW       36
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData23
;GPS_Parser.c,149 :: 		while (!UART1_Data_Ready());
L_GPS_GetData24:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData25
	GOTO        L_GPS_GetData24
L_GPS_GetData25:
;GPS_Parser.c,150 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,151 :: 		if (Temp == 'G') {
	MOVF        R0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData26
;GPS_Parser.c,152 :: 		while (!UART1_Data_Ready());
L_GPS_GetData27:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData28
	GOTO        L_GPS_GetData27
L_GPS_GetData28:
;GPS_Parser.c,153 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,154 :: 		if (Temp == 'P') {
	MOVF        R0, 0 
	XORLW       80
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData29
;GPS_Parser.c,155 :: 		while (!UART1_Data_Ready());
L_GPS_GetData30:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData31
	GOTO        L_GPS_GetData30
L_GPS_GetData31:
;GPS_Parser.c,156 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,157 :: 		if (Temp == 'G') {
	MOVF        R0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData32
;GPS_Parser.c,158 :: 		while (!UART1_Data_Ready());
L_GPS_GetData33:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData34
	GOTO        L_GPS_GetData33
L_GPS_GetData34:
;GPS_Parser.c,159 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,160 :: 		if (Temp == 'G') {
	MOVF        R0, 0 
	XORLW       71
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData35
;GPS_Parser.c,161 :: 		while (!UART1_Data_Ready());
L_GPS_GetData36:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData37
	GOTO        L_GPS_GetData36
L_GPS_GetData37:
;GPS_Parser.c,162 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,163 :: 		if (Temp == 'A') {
	MOVF        R0, 0 
	XORLW       65
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData38
;GPS_Parser.c,164 :: 		while (!UART1_Data_Ready());
L_GPS_GetData39:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData40
	GOTO        L_GPS_GetData39
L_GPS_GetData40:
;GPS_Parser.c,165 :: 		Temp = UART1_Read(); //
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,166 :: 		while (Temp != '\n') {
L_GPS_GetData41:
	MOVF        GPS_GetData_Temp_L0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_GPS_GetData42
;GPS_Parser.c,167 :: 		GPGGA_Data[Index] = Temp;
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
;GPS_Parser.c,169 :: 		while (!UART1_Data_Ready());
L_GPS_GetData43:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_GPS_GetData44
	GOTO        L_GPS_GetData43
L_GPS_GetData44:
;GPS_Parser.c,170 :: 		Temp = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       GPS_GetData_Temp_L0+0 
;GPS_Parser.c,171 :: 		Index++;
	INCF        GPS_GetData_Index_L0+0, 1 
;GPS_Parser.c,173 :: 		}
	GOTO        L_GPS_GetData41
L_GPS_GetData42:
;GPS_Parser.c,174 :: 		Index = 0;
	CLRF        GPS_GetData_Index_L0+0 
;GPS_Parser.c,175 :: 		cooldown++;
	INCF        _cooldown+0, 1 
;GPS_Parser.c,176 :: 		swap_raw_data();
	CALL        _swap_raw_data+0, 0
;GPS_Parser.c,178 :: 		sprinti(clk, "%8u", lat_second_i);
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
;GPS_Parser.c,180 :: 		lat_second_f = (lat_second_i + 0.115) / 0.6;   // 0.25 default on concepcion
	MOVF        _lat_second_i+0, 0 
	MOVWF       R0 
	MOVF        _lat_second_i+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       31
	MOVWF       R4 
	MOVLW       133
	MOVWF       R5 
	MOVLW       107
	MOVWF       R6 
	MOVLW       123
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
;GPS_Parser.c,181 :: 		sprintf(lat_second_s, "%8f", lat_second_f);
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
;GPS_Parser.c,183 :: 		sprinti(clk2, "%8u", long_second_i);
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
;GPS_Parser.c,184 :: 		long_second_f = (long_second_i + 0.117) / 0.6; // 0.125 default
	MOVF        _long_second_i+0, 0 
	MOVWF       R0 
	MOVF        _long_second_i+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVLW       178
	MOVWF       R4 
	MOVLW       157
	MOVWF       R5 
	MOVLW       111
	MOVWF       R6 
	MOVLW       123
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
;GPS_Parser.c,185 :: 		if(long_second_f < 1000)
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
	GOTO        L_GPS_GetData45
;GPS_Parser.c,187 :: 		sprintf(long_second_s2, "%8f", long_second_f);
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
;GPS_Parser.c,188 :: 		long_second_s[1] = long_second_s2[0];
	MOVF        _long_second_s2+0, 0 
	MOVWF       _long_second_s+1 
;GPS_Parser.c,189 :: 		long_second_s[2] = long_second_s2[1];
	MOVF        _long_second_s2+1, 0 
	MOVWF       _long_second_s+2 
;GPS_Parser.c,190 :: 		long_second_s[3] = long_second_s2[2];
	MOVF        _long_second_s2+2, 0 
	MOVWF       _long_second_s+3 
;GPS_Parser.c,191 :: 		long_second_s[4] = long_second_s2[3];
	MOVF        _long_second_s2+3, 0 
	MOVWF       _long_second_s+4 
;GPS_Parser.c,192 :: 		long_second_s[5] = long_second_s2[4];
	MOVF        _long_second_s2+4, 0 
	MOVWF       _long_second_s+5 
;GPS_Parser.c,193 :: 		long_second_s[6] = long_second_s2[5];
	MOVF        _long_second_s2+5, 0 
	MOVWF       _long_second_s+6 
;GPS_Parser.c,194 :: 		long_second_s[0] = '0';
	MOVLW       48
	MOVWF       _long_second_s+0 
;GPS_Parser.c,195 :: 		}else
	GOTO        L_GPS_GetData46
L_GPS_GetData45:
;GPS_Parser.c,197 :: 		sprintf(long_second_s, "%8f", long_second_f);
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
;GPS_Parser.c,198 :: 		}
L_GPS_GetData46:
;GPS_Parser.c,199 :: 		lat_second_f = 0;
	CLRF        _lat_second_f+0 
	CLRF        _lat_second_f+1 
	CLRF        _lat_second_f+2 
	CLRF        _lat_second_f+3 
;GPS_Parser.c,200 :: 		if(cooldown > 4)
	MOVF        _cooldown+0, 0 
	SUBLW       4
	BTFSC       STATUS+0, 0 
	GOTO        L_GPS_GetData47
;GPS_Parser.c,202 :: 		gps_taken = 1;
	MOVLW       1
	MOVWF       _gps_taken+0 
;GPS_Parser.c,203 :: 		}
L_GPS_GetData47:
;GPS_Parser.c,204 :: 		}
L_GPS_GetData38:
;GPS_Parser.c,205 :: 		}
L_GPS_GetData35:
;GPS_Parser.c,206 :: 		}
L_GPS_GetData32:
;GPS_Parser.c,207 :: 		}
L_GPS_GetData29:
;GPS_Parser.c,208 :: 		}
L_GPS_GetData26:
;GPS_Parser.c,209 :: 		}
L_GPS_GetData23:
;GPS_Parser.c,210 :: 		}
L_end_GPS_GetData:
	RETURN      0
; end of _GPS_GetData

_Usend:

;GPS_Parser.c,214 :: 		void Usend(char* cmd)
;GPS_Parser.c,216 :: 		UART1_Write_Text(cmd);
	MOVF        FARG_Usend_cmd+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_Usend_cmd+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,217 :: 		UART1_Write_Text("\x0D");
	MOVLW       ?lstr6_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,218 :: 		}
L_end_Usend:
	RETURN      0
; end of _Usend

_init_pins:

;GPS_Parser.c,221 :: 		void init_pins()
;GPS_Parser.c,223 :: 		TRISB.B7 = 1; // input
	BSF         TRISB+0, 7 
;GPS_Parser.c,224 :: 		TRISB.B6 = 1; // input
	BSF         TRISB+0, 6 
;GPS_Parser.c,225 :: 		TRISB.B5 = 1; // input
	BSF         TRISB+0, 5 
;GPS_Parser.c,226 :: 		TRISD.B0 = 0; // Output Comm with ESP
	BCF         TRISD+0, 0 
;GPS_Parser.c,227 :: 		TRISD.B1 = 0; // Output Vibration Motor
	BCF         TRISD+0, 1 
;GPS_Parser.c,228 :: 		TRISD.B2 = 0; // Output Heart Rate Sensor
	BCF         TRISD+0, 2 
;GPS_Parser.c,229 :: 		TRISD.B3 = 1; // input - acceptable BPM?
	BSF         TRISD+0, 3 
;GPS_Parser.c,230 :: 		Send_Ready = 0;
	CLRF        _Send_Ready+0 
;GPS_Parser.c,231 :: 		Auto = 0;
	CLRF        _Auto+0 
;GPS_Parser.c,232 :: 		Normal = 0;
	CLRF        _Normal+0 
;GPS_Parser.c,233 :: 		}
L_end_init_pins:
	RETURN      0
; end of _init_pins

_initGSM:

;GPS_Parser.c,235 :: 		void initGSM()
;GPS_Parser.c,237 :: 		Usend("AT");
	MOVLW       ?lstr7_GPS_Parser+0
	MOVWF       FARG_Usend_cmd+0 
	MOVLW       hi_addr(?lstr7_GPS_Parser+0)
	MOVWF       FARG_Usend_cmd+1 
	CALL        _Usend+0, 0
;GPS_Parser.c,238 :: 		DELAY_MS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_initGSM48:
	DECFSZ      R13, 1, 1
	BRA         L_initGSM48
	DECFSZ      R12, 1, 1
	BRA         L_initGSM48
	DECFSZ      R11, 1, 1
	BRA         L_initGSM48
	NOP
	NOP
;GPS_Parser.c,239 :: 		Usend("AT+IPR=9600");
	MOVLW       ?lstr8_GPS_Parser+0
	MOVWF       FARG_Usend_cmd+0 
	MOVLW       hi_addr(?lstr8_GPS_Parser+0)
	MOVWF       FARG_Usend_cmd+1 
	CALL        _Usend+0, 0
;GPS_Parser.c,240 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_initGSM49:
	DECFSZ      R13, 1, 1
	BRA         L_initGSM49
	DECFSZ      R12, 1, 1
	BRA         L_initGSM49
	DECFSZ      R11, 1, 1
	BRA         L_initGSM49
	NOP
	NOP
;GPS_Parser.c,241 :: 		Usend("AT+CMGF=1");
	MOVLW       ?lstr9_GPS_Parser+0
	MOVWF       FARG_Usend_cmd+0 
	MOVLW       hi_addr(?lstr9_GPS_Parser+0)
	MOVWF       FARG_Usend_cmd+1 
	CALL        _Usend+0, 0
;GPS_Parser.c,242 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_initGSM50:
	DECFSZ      R13, 1, 1
	BRA         L_initGSM50
	DECFSZ      R12, 1, 1
	BRA         L_initGSM50
	DECFSZ      R11, 1, 1
	BRA         L_initGSM50
	NOP
	NOP
;GPS_Parser.c,243 :: 		}
L_end_initGSM:
	RETURN      0
; end of _initGSM

_sendStartSMS:

;GPS_Parser.c,245 :: 		void sendStartSMS()
;GPS_Parser.c,247 :: 		UART1_WRITE_TEXT("AT+CMGS=\"+639153013461\"\x0D");  // replace this with your phone number
	MOVLW       ?lstr10_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,248 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
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
;GPS_Parser.c,249 :: 		UART1_WRITE_TEXT("ALERT! Transmitter no: ");
	MOVLW       ?lstr11_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,250 :: 		UART1_WRITE_TEXT(phoneNumber);
	MOVLW       _phoneNumber+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_phoneNumber+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,251 :: 		UART1_WRITE_TEXT(" to save to server and see location, use: https://rrs-receiver-website.herokuapp.com/transmitters/newtransmitter?latitude=");
	MOVLW       ?lstr12_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,252 :: 		UART1_Write(lat_first[2]);
	MOVF        _lat_first+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,253 :: 		UART1_Write('0');
	MOVLW       48
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,254 :: 		UART1_Write('.');
	MOVLW       46
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,255 :: 		UART1_Write(lat_second_s[0]);
	MOVF        _lat_second_s+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,256 :: 		UART1_Write(lat_second_s[1]);
	MOVF        _lat_second_s+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,257 :: 		UART1_Write(lat_second_s[2]);
	MOVF        _lat_second_s+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,258 :: 		UART1_Write(lat_second_s[3]);
	MOVF        _lat_second_s+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,259 :: 		UART1_Write(lat_second_s[5]);
	MOVF        _lat_second_s+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,260 :: 		UART1_Write(lat_second_s[6]);
	MOVF        _lat_second_s+6, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,261 :: 		UART1_Write_Text("&longitude=");
	MOVLW       ?lstr13_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,262 :: 		UART1_Write('1');
	MOVLW       49
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,263 :: 		UART1_Write('2');
	MOVLW       50
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,264 :: 		UART1_Write('2');
	MOVLW       50
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,265 :: 		UART1_Write('.');
	MOVLW       46
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,266 :: 		UART1_Write(long_second_s[0]);
	MOVF        _long_second_s+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,267 :: 		UART1_Write(long_second_s[1]);
	MOVF        _long_second_s+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,268 :: 		UART1_Write(long_second_s[2]);
	MOVF        _long_second_s+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,269 :: 		UART1_Write(long_second_s[3]);
	MOVF        _long_second_s+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,270 :: 		UART1_Write(long_second_s[5]);
	MOVF        _long_second_s+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,271 :: 		UART1_Write(long_second_s[6]);
	MOVF        _long_second_s+6, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,272 :: 		UART1_Write_Text("&phoneNumber=");
	MOVLW       ?lstr14_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,273 :: 		UART1_WRITE_TEXT(phoneNumber);
	MOVLW       _phoneNumber+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_phoneNumber+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,274 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_sendStartSMS52:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS52
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS52
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS52
	NOP
	NOP
;GPS_Parser.c,275 :: 		UART1_WRITE(26);
	MOVLW       26
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,276 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_sendStartSMS53:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS53
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS53
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS53
	NOP
	NOP
;GPS_Parser.c,277 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_sendStartSMS54:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS54
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS54
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS54
	NOP
;GPS_Parser.c,278 :: 		UART1_WRITE_TEXT("AT+CMGS=\"+639233205775\"\x0D");  // replace this with your phone number
	MOVLW       ?lstr15_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,279 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_sendStartSMS55:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS55
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS55
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS55
	NOP
	NOP
;GPS_Parser.c,280 :: 		UART1_WRITE_TEXT("HELP! I am in danger, seek authorities/barangay officials. Coordinates: ");
	MOVLW       ?lstr16_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr16_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,281 :: 		UART1_Write_Text(" Latitude: ");
	MOVLW       ?lstr17_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr17_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,282 :: 		UART1_Write(lat_first[2]);
	MOVF        _lat_first+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,283 :: 		UART1_Write(lat_first[1]);
	MOVF        _lat_first+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,284 :: 		UART1_Write('.');
	MOVLW       46
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,285 :: 		UART1_Write(lat_second_s[0]);
	MOVF        _lat_second_s+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,286 :: 		UART1_Write(lat_second_s[1]);
	MOVF        _lat_second_s+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,287 :: 		UART1_Write(lat_second_s[2]);
	MOVF        _lat_second_s+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,288 :: 		UART1_Write(lat_second_s[3]);
	MOVF        _lat_second_s+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,289 :: 		UART1_Write(lat_second_s[5]);
	MOVF        _lat_second_s+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,290 :: 		UART1_Write(lat_second_s[6]);
	MOVF        _lat_second_s+6, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,291 :: 		UART1_Write_Text(" Longitude: ");
	MOVLW       ?lstr18_GPS_Parser+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr18_GPS_Parser+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GPS_Parser.c,292 :: 		UART1_Write('1');
	MOVLW       49
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,293 :: 		UART1_Write('2');
	MOVLW       50
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,294 :: 		UART1_Write('2');
	MOVLW       50
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,295 :: 		UART1_Write('.');
	MOVLW       46
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,296 :: 		UART1_Write(long_second_s[0]);
	MOVF        _long_second_s+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,297 :: 		UART1_Write(long_second_s[1]);
	MOVF        _long_second_s+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,298 :: 		UART1_Write(long_second_s[2]);
	MOVF        _long_second_s+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,299 :: 		UART1_Write(long_second_s[3]);
	MOVF        _long_second_s+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,300 :: 		UART1_Write(long_second_s[5]);
	MOVF        _long_second_s+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,301 :: 		UART1_Write(long_second_s[6]);
	MOVF        _long_second_s+6, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,302 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_sendStartSMS56:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS56
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS56
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS56
	NOP
	NOP
;GPS_Parser.c,303 :: 		UART1_WRITE(26);
	MOVLW       26
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GPS_Parser.c,304 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_sendStartSMS57:
	DECFSZ      R13, 1, 1
	BRA         L_sendStartSMS57
	DECFSZ      R12, 1, 1
	BRA         L_sendStartSMS57
	DECFSZ      R11, 1, 1
	BRA         L_sendStartSMS57
	NOP
	NOP
;GPS_Parser.c,305 :: 		}
L_end_sendStartSMS:
	RETURN      0
; end of _sendStartSMS

_vibrate:

;GPS_Parser.c,307 :: 		void vibrate()
;GPS_Parser.c,309 :: 		while(isComplete == 0)
L_vibrate58:
	MOVF        _isComplete+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_vibrate59
;GPS_Parser.c,311 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,312 :: 		vDuration = vDuration - 1;
	MOVLW       1
	SUBWF       _vDuration+0, 1 
	MOVLW       0
	SUBWFB      _vDuration+1, 1 
;GPS_Parser.c,313 :: 		if(Confirm == 1)
	MOVF        _Confirm+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_vibrate60
;GPS_Parser.c,315 :: 		PORTD.B0 = 0;
	BCF         PORTD+0, 0 
;GPS_Parser.c,316 :: 		isComplete = 1;
	MOVLW       1
	MOVWF       _isComplete+0 
;GPS_Parser.c,318 :: 		}else if(vDuration == 0)
	GOTO        L_vibrate61
L_vibrate60:
	MOVLW       0
	XORWF       _vDuration+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__vibrate108
	MOVLW       0
	XORWF       _vDuration+0, 0 
L__vibrate108:
	BTFSS       STATUS+0, 2 
	GOTO        L_vibrate62
;GPS_Parser.c,320 :: 		PORTD.B0 = 0;
	BCF         PORTD+0, 0 
;GPS_Parser.c,321 :: 		isComplete = 1;
	MOVLW       1
	MOVWF       _isComplete+0 
;GPS_Parser.c,323 :: 		}else
	GOTO        L_vibrate63
L_vibrate62:
;GPS_Parser.c,326 :: 		isComplete = 0;
	CLRF        _isComplete+0 
;GPS_Parser.c,327 :: 		}
L_vibrate63:
L_vibrate61:
;GPS_Parser.c,328 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_vibrate64:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate64
	DECFSZ      R12, 1, 1
	BRA         L_vibrate64
	DECFSZ      R11, 1, 1
	BRA         L_vibrate64
	NOP
;GPS_Parser.c,329 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,330 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_vibrate65:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate65
	DECFSZ      R12, 1, 1
	BRA         L_vibrate65
	DECFSZ      R11, 1, 1
	BRA         L_vibrate65
	NOP
;GPS_Parser.c,331 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,332 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_vibrate66:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate66
	DECFSZ      R12, 1, 1
	BRA         L_vibrate66
	DECFSZ      R11, 1, 1
	BRA         L_vibrate66
	NOP
;GPS_Parser.c,333 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,334 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_vibrate67:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate67
	DECFSZ      R12, 1, 1
	BRA         L_vibrate67
	DECFSZ      R11, 1, 1
	BRA         L_vibrate67
	NOP
;GPS_Parser.c,335 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,336 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_vibrate68:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate68
	DECFSZ      R12, 1, 1
	BRA         L_vibrate68
	DECFSZ      R11, 1, 1
	BRA         L_vibrate68
	NOP
;GPS_Parser.c,337 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,338 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_vibrate69:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate69
	DECFSZ      R12, 1, 1
	BRA         L_vibrate69
	DECFSZ      R11, 1, 1
	BRA         L_vibrate69
	NOP
;GPS_Parser.c,339 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,340 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_vibrate70:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate70
	DECFSZ      R12, 1, 1
	BRA         L_vibrate70
	DECFSZ      R11, 1, 1
	BRA         L_vibrate70
	NOP
;GPS_Parser.c,341 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,342 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_vibrate71:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate71
	DECFSZ      R12, 1, 1
	BRA         L_vibrate71
	DECFSZ      R11, 1, 1
	BRA         L_vibrate71
	NOP
;GPS_Parser.c,343 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,344 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_vibrate72:
	DECFSZ      R13, 1, 1
	BRA         L_vibrate72
	DECFSZ      R12, 1, 1
	BRA         L_vibrate72
	DECFSZ      R11, 1, 1
	BRA         L_vibrate72
	NOP
;GPS_Parser.c,345 :: 		check_button3();
	CALL        _check_button3+0, 0
;GPS_Parser.c,346 :: 		}
	GOTO        L_vibrate58
L_vibrate59:
;GPS_Parser.c,347 :: 		isComplete = 0;
	CLRF        _isComplete+0 
;GPS_Parser.c,348 :: 		vDuration = 8; // reset to default
	MOVLW       8
	MOVWF       _vDuration+0 
	MOVLW       0
	MOVWF       _vDuration+1 
;GPS_Parser.c,349 :: 		}
L_end_vibrate:
	RETURN      0
; end of _vibrate

_main:

;GPS_Parser.c,351 :: 		void main() {
;GPS_Parser.c,352 :: 		init_pins();
	CALL        _init_pins+0, 0
;GPS_Parser.c,353 :: 		UART1_init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;GPS_Parser.c,354 :: 		Delay_ms(100); // Wait for UART module to stabilize
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main73:
	DECFSZ      R13, 1, 1
	BRA         L_main73
	DECFSZ      R12, 1, 1
	BRA         L_main73
	DECFSZ      R11, 1, 1
	BRA         L_main73
	NOP
;GPS_Parser.c,355 :: 		initGSM();     // AT init with baud rate config
	CALL        _initGSM+0, 0
;GPS_Parser.c,356 :: 		PORTD.B0 = 0;
	BCF         PORTD+0, 0 
;GPS_Parser.c,358 :: 		while (1) {
L_main74:
;GPS_Parser.c,359 :: 		check_button1();
	CALL        _check_button1+0, 0
;GPS_Parser.c,360 :: 		check_button2();
	CALL        _check_button2+0, 0
;GPS_Parser.c,361 :: 		if(Send_Ready == 1 && Is_Duplicate == 1)
	MOVF        _Send_Ready+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main78
	MOVF        _Is_duplicate+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main78
L__main96:
;GPS_Parser.c,363 :: 		if(Normal == 1)
	MOVF        _Normal+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main79
;GPS_Parser.c,365 :: 		PORTD.B0 = 1;
	BSF         PORTD+0, 0 
;GPS_Parser.c,366 :: 		Confirm = 0;
	CLRF        _Confirm+0 
;GPS_Parser.c,367 :: 		vibrate(); // check if false trigger
	CALL        _vibrate+0, 0
;GPS_Parser.c,368 :: 		if(Confirm == 0)
	MOVF        _Confirm+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main80
;GPS_Parser.c,370 :: 		while(gps_taken == 0)
L_main81:
	MOVF        _gps_taken+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main82
;GPS_Parser.c,372 :: 		GPS_GetData();
	CALL        _GPS_GetData+0, 0
;GPS_Parser.c,373 :: 		}
	GOTO        L_main81
L_main82:
;GPS_Parser.c,374 :: 		cooldown = 0;
	CLRF        _cooldown+0 
;GPS_Parser.c,375 :: 		gps_taken = 0;
	CLRF        _gps_taken+0 
;GPS_Parser.c,376 :: 		sendStartSMS();  // Send SMS
	CALL        _sendStartSMS+0, 0
;GPS_Parser.c,379 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main83:
	DECFSZ      R13, 1, 1
	BRA         L_main83
	DECFSZ      R12, 1, 1
	BRA         L_main83
	DECFSZ      R11, 1, 1
	BRA         L_main83
	NOP
;GPS_Parser.c,380 :: 		PORTD.B0 = 1;    // feedback, sign that sms is sent
	BSF         PORTD+0, 0 
;GPS_Parser.c,381 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main84:
	DECFSZ      R13, 1, 1
	BRA         L_main84
	DECFSZ      R12, 1, 1
	BRA         L_main84
	DECFSZ      R11, 1, 1
	BRA         L_main84
	NOP
;GPS_Parser.c,382 :: 		PORTD.B0 = 0;
	BCF         PORTD+0, 0 
;GPS_Parser.c,392 :: 		}
L_main80:
;GPS_Parser.c,394 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main85:
	DECFSZ      R13, 1, 1
	BRA         L_main85
	DECFSZ      R12, 1, 1
	BRA         L_main85
	DECFSZ      R11, 1, 1
	BRA         L_main85
	NOP
	NOP
;GPS_Parser.c,395 :: 		Send_Ready = 0;
	CLRF        _Send_Ready+0 
;GPS_Parser.c,396 :: 		Auto = 0;
	CLRF        _Auto+0 
;GPS_Parser.c,397 :: 		Normal = 0;
	CLRF        _Normal+0 
;GPS_Parser.c,398 :: 		Confirm = 0;
	CLRF        _Confirm+0 
;GPS_Parser.c,399 :: 		isComplete = 0;
	CLRF        _isComplete+0 
;GPS_Parser.c,400 :: 		}else if(Auto == 1)
	GOTO        L_main86
L_main79:
	MOVF        _Auto+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main87
;GPS_Parser.c,403 :: 		PORTD.B0 = 1;
	BSF         PORTD+0, 0 
;GPS_Parser.c,404 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main88:
	DECFSZ      R13, 1, 1
	BRA         L_main88
	DECFSZ      R12, 1, 1
	BRA         L_main88
	DECFSZ      R11, 1, 1
	BRA         L_main88
	NOP
;GPS_Parser.c,405 :: 		PORTD.B0 = 0;
	BCF         PORTD+0, 0 
;GPS_Parser.c,406 :: 		act_sensor(); // sensor on
	CALL        _act_sensor+0, 0
;GPS_Parser.c,407 :: 		Confirm = 0;
	CLRF        _Confirm+0 
;GPS_Parser.c,408 :: 		isComplete = 0;
	CLRF        _isComplete+0 
;GPS_Parser.c,409 :: 		PORTD.B0 = 1;
	BSF         PORTD+0, 0 
;GPS_Parser.c,410 :: 		vibrate(); // check if false trigger
	CALL        _vibrate+0, 0
;GPS_Parser.c,411 :: 		if(confirm == 0)
	MOVF        _Confirm+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main89
;GPS_Parser.c,413 :: 		while(gps_taken == 0)
L_main90:
	MOVF        _gps_taken+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main91
;GPS_Parser.c,415 :: 		GPS_GetData();
	CALL        _GPS_GetData+0, 0
;GPS_Parser.c,416 :: 		}
	GOTO        L_main90
L_main91:
;GPS_Parser.c,417 :: 		cooldown = 0;
	CLRF        _cooldown+0 
;GPS_Parser.c,418 :: 		gps_taken = 0;
	CLRF        _gps_taken+0 
;GPS_Parser.c,419 :: 		sendStartSMS();  // Send SMS
	CALL        _sendStartSMS+0, 0
;GPS_Parser.c,422 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main92:
	DECFSZ      R13, 1, 1
	BRA         L_main92
	DECFSZ      R12, 1, 1
	BRA         L_main92
	DECFSZ      R11, 1, 1
	BRA         L_main92
	NOP
;GPS_Parser.c,423 :: 		PORTD.B0 = 1;    // feedback, sign that sms is sent
	BSF         PORTD+0, 0 
;GPS_Parser.c,424 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main93:
	DECFSZ      R13, 1, 1
	BRA         L_main93
	DECFSZ      R12, 1, 1
	BRA         L_main93
	DECFSZ      R11, 1, 1
	BRA         L_main93
	NOP
;GPS_Parser.c,425 :: 		PORTD.B0 = 0;
	BCF         PORTD+0, 0 
;GPS_Parser.c,426 :: 		}
L_main89:
;GPS_Parser.c,437 :: 		Send_Ready = 0;
	CLRF        _Send_Ready+0 
;GPS_Parser.c,438 :: 		Auto = 0;
	CLRF        _Auto+0 
;GPS_Parser.c,439 :: 		Confirm = 0;
	CLRF        _Confirm+0 
;GPS_Parser.c,440 :: 		isComplete = 0;
	CLRF        _isComplete+0 
;GPS_Parser.c,441 :: 		}else
	GOTO        L_main94
L_main87:
;GPS_Parser.c,444 :: 		}
L_main94:
L_main86:
;GPS_Parser.c,445 :: 		}else
	GOTO        L_main95
L_main78:
;GPS_Parser.c,448 :: 		}
L_main95:
;GPS_Parser.c,449 :: 		Is_Duplicate = 1;
	MOVLW       1
	MOVWF       _Is_duplicate+0 
;GPS_Parser.c,450 :: 		}
	GOTO        L_main74
;GPS_Parser.c,451 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
