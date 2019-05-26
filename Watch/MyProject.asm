
_main:

;MyProject.c,83 :: 		void main() {
;MyProject.c,84 :: 		setUp();
	CALL       _setUp+0
;MyProject.c,85 :: 		while(1){
L_main0:
;MyProject.c,86 :: 		if(setMode == 0){
	BTFSC      PORTD+0, 0
	GOTO       L_main2
;MyProject.c,87 :: 		updateSeconds();
	CALL       _updateSeconds+0
;MyProject.c,88 :: 		updateMinutes();
	CALL       _updateMinutes+0
;MyProject.c,89 :: 		updateHours();
	CALL       _updateHours+0
;MyProject.c,90 :: 		printTime();
	CALL       _printTime+0
;MyProject.c,91 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;MyProject.c,92 :: 		} else {
	GOTO       L_main4
L_main2:
;MyProject.c,93 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;MyProject.c,94 :: 		if(setMode == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main6
;MyProject.c,95 :: 		while(setMode == 1);
L_main7:
	BTFSS      PORTD+0, 0
	GOTO       L_main8
	GOTO       L_main7
L_main8:
;MyProject.c,96 :: 		setTimeMode();
	CALL       _setTimeMode+0
;MyProject.c,97 :: 		}
L_main6:
;MyProject.c,98 :: 		}
L_main4:
;MyProject.c,99 :: 		}
	GOTO       L_main0
;MyProject.c,100 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setUp:

;MyProject.c,101 :: 		void setUp(){
;MyProject.c,102 :: 		trisd = 0b00000111;  // intial seting buttons
	MOVLW      7
	MOVWF      TRISD+0
;MyProject.c,103 :: 		OPTION_REG         = 0x85; // set the scale and the frequancy source for timer0
	MOVLW      133
	MOVWF      OPTION_REG+0
;MyProject.c,104 :: 		INTCON.GIE = 1;    // global interrupt
	BSF        INTCON+0, 7
;MyProject.c,105 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;MyProject.c,107 :: 		lcd_init();
	CALL       _Lcd_Init+0
;MyProject.c,108 :: 		Lcd_Cmd( _LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,110 :: 		printTime();
	CALL       _printTime+0
;MyProject.c,111 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_setUp9:
	DECFSZ     R13+0, 1
	GOTO       L_setUp9
	DECFSZ     R12+0, 1
	GOTO       L_setUp9
	DECFSZ     R11+0, 1
	GOTO       L_setUp9
	NOP
	NOP
;MyProject.c,112 :: 		}
L_end_setUp:
	RETURN
; end of _setUp

_updateSeconds:

;MyProject.c,113 :: 		void updateSeconds(){
;MyProject.c,114 :: 		second++;
	INCF       _second+0, 1
	BTFSC      STATUS+0, 2
	INCF       _second+1, 1
;MyProject.c,115 :: 		}
L_end_updateSeconds:
	RETURN
; end of _updateSeconds

_updateMinutes:

;MyProject.c,116 :: 		void updateMinutes(){
;MyProject.c,117 :: 		if (second == 60){
	MOVLW      0
	XORWF      _second+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__updateMinutes41
	MOVLW      60
	XORWF      _second+0, 0
L__updateMinutes41:
	BTFSS      STATUS+0, 2
	GOTO       L_updateMinutes10
;MyProject.c,118 :: 		second = 0;
	CLRF       _second+0
	CLRF       _second+1
;MyProject.c,119 :: 		minute++;
	INCF       _minute+0, 1
	BTFSC      STATUS+0, 2
	INCF       _minute+1, 1
;MyProject.c,120 :: 		}
L_updateMinutes10:
;MyProject.c,121 :: 		}
L_end_updateMinutes:
	RETURN
; end of _updateMinutes

_updateHours:

;MyProject.c,122 :: 		void updateHours(){
;MyProject.c,123 :: 		if(minute == 60){
	MOVLW      0
	XORWF      _minute+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__updateHours43
	MOVLW      60
	XORWF      _minute+0, 0
L__updateHours43:
	BTFSS      STATUS+0, 2
	GOTO       L_updateHours11
;MyProject.c,124 :: 		minute = 0;
	CLRF       _minute+0
	CLRF       _minute+1
;MyProject.c,125 :: 		if(hour == 12)
	MOVLW      0
	XORWF      _hour+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__updateHours44
	MOVLW      12
	XORWF      _hour+0, 0
L__updateHours44:
	BTFSS      STATUS+0, 2
	GOTO       L_updateHours12
;MyProject.c,126 :: 		hour = 0;
	CLRF       _hour+0
	CLRF       _hour+1
L_updateHours12:
;MyProject.c,127 :: 		hour ++;
	INCF       _hour+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hour+1, 1
;MyProject.c,128 :: 		AM_PM();
	CALL       _AM_PM+0
;MyProject.c,129 :: 		}
L_updateHours11:
;MyProject.c,130 :: 		}
L_end_updateHours:
	RETURN
; end of _updateHours

_AM_PM:

;MyProject.c,132 :: 		void AM_PM(){
;MyProject.c,133 :: 		if (hour == 12){
	MOVLW      0
	XORWF      _hour+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__AM_PM46
	MOVLW      12
	XORWF      _hour+0, 0
L__AM_PM46:
	BTFSS      STATUS+0, 2
	GOTO       L_AM_PM13
;MyProject.c,134 :: 		am = ~ am;
	COMF       _am+0, 1
	COMF       _am+1, 1
;MyProject.c,135 :: 		}
L_AM_PM13:
;MyProject.c,136 :: 		}
L_end_AM_PM:
	RETURN
; end of _AM_PM

_printTime:

;MyProject.c,138 :: 		void printTime(){
;MyProject.c,139 :: 		IntToStr(second,sSecond);
	MOVF       _second+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _second+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _sSecond+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,140 :: 		IntToStr(minute,sMinute);
	MOVF       _minute+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _minute+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _sMinute+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,141 :: 		IntToStr(hour,sHour);
	MOVF       _hour+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _hour+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _sHour+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,142 :: 		time[0] = sHour[4];
	MOVF       _sHour+4, 0
	MOVWF      _time+0
;MyProject.c,143 :: 		time[1] = sHour[5];
	MOVF       _sHour+5, 0
	MOVWF      _time+1
;MyProject.c,144 :: 		time[2] = ':' ;
	MOVLW      58
	MOVWF      _time+2
;MyProject.c,145 :: 		time[3] = sMinute[4];
	MOVF       _sMinute+4, 0
	MOVWF      _time+3
;MyProject.c,146 :: 		time[4] = sMinute[5];
	MOVF       _sMinute+5, 0
	MOVWF      _time+4
;MyProject.c,147 :: 		time[5] = ':';
	MOVLW      58
	MOVWF      _time+5
;MyProject.c,148 :: 		time[6] = sSecond[4];
	MOVF       _sSecond+4, 0
	MOVWF      _time+6
;MyProject.c,149 :: 		time[7] = sSecond[5];
	MOVF       _sSecond+5, 0
	MOVWF      _time+7
;MyProject.c,150 :: 		for(i = 0;i<8;i++){
	CLRF       _i+0
	CLRF       _i+1
L_printTime14:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__printTime48
	MOVLW      8
	SUBWF      _i+0, 0
L__printTime48:
	BTFSC      STATUS+0, 0
	GOTO       L_printTime15
;MyProject.c,151 :: 		if(time[i] == ' ')
	MOVF       _i+0, 0
	ADDLW      _time+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_printTime17
;MyProject.c,152 :: 		time[i] = '0';
	MOVF       _i+0, 0
	ADDLW      _time+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
L_printTime17:
;MyProject.c,150 :: 		for(i = 0;i<8;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,153 :: 		}
	GOTO       L_printTime14
L_printTime15:
;MyProject.c,154 :: 		time[8] = ' ';
	MOVLW      32
	MOVWF      _time+8
;MyProject.c,155 :: 		if (am == 0)
	MOVLW      0
	XORWF      _am+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__printTime49
	MOVLW      0
	XORWF      _am+0, 0
L__printTime49:
	BTFSS      STATUS+0, 2
	GOTO       L_printTime18
;MyProject.c,156 :: 		time[9] = 'P';
	MOVLW      80
	MOVWF      _time+9
	GOTO       L_printTime19
L_printTime18:
;MyProject.c,158 :: 		time[9] = 'A';
	MOVLW      65
	MOVWF      _time+9
L_printTime19:
;MyProject.c,159 :: 		time[10] = 'M';
	MOVLW      77
	MOVWF      _time+10
;MyProject.c,160 :: 		time[11] = ' ';
	MOVLW      32
	MOVWF      _time+11
;MyProject.c,161 :: 		LCD_OUT(1,5,time);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _time+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,163 :: 		}
L_end_printTime:
	RETURN
; end of _printTime

_setTimeMode:

;MyProject.c,165 :: 		void setTimeMode(){
;MyProject.c,166 :: 		INTCON.TMR0IE = 1; // timer 0 Interrupt
	BSF        INTCON+0, 5
;MyProject.c,167 :: 		TMR0 = 5;
	MOVLW      5
	MOVWF      TMR0+0
;MyProject.c,168 :: 		while(1){
L_setTimeMode20:
;MyProject.c,169 :: 		if(setMin == 1){
	BTFSS      PORTD+0, 1
	GOTO       L_setTimeMode22
;MyProject.c,170 :: 		minute++;
	INCF       _minute+0, 1
	BTFSC      STATUS+0, 2
	INCF       _minute+1, 1
;MyProject.c,171 :: 		if(minute == 60)
	MOVLW      0
	XORWF      _minute+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setTimeMode51
	MOVLW      60
	XORWF      _minute+0, 0
L__setTimeMode51:
	BTFSS      STATUS+0, 2
	GOTO       L_setTimeMode23
;MyProject.c,172 :: 		minute = 0;
	CLRF       _minute+0
	CLRF       _minute+1
L_setTimeMode23:
;MyProject.c,173 :: 		printTime();
	CALL       _printTime+0
;MyProject.c,174 :: 		count = 0;
	CLRF       _count+0
	CLRF       _count+1
;MyProject.c,175 :: 		while(setMin == 1);
L_setTimeMode24:
	BTFSS      PORTD+0, 1
	GOTO       L_setTimeMode25
	GOTO       L_setTimeMode24
L_setTimeMode25:
;MyProject.c,176 :: 		}
L_setTimeMode22:
;MyProject.c,177 :: 		if(setHour == 1){
	BTFSS      PORTD+0, 2
	GOTO       L_setTimeMode26
;MyProject.c,178 :: 		if(hour == 12)
	MOVLW      0
	XORWF      _hour+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setTimeMode52
	MOVLW      12
	XORWF      _hour+0, 0
L__setTimeMode52:
	BTFSS      STATUS+0, 2
	GOTO       L_setTimeMode27
;MyProject.c,179 :: 		hour = 0;
	CLRF       _hour+0
	CLRF       _hour+1
L_setTimeMode27:
;MyProject.c,180 :: 		hour++;
	INCF       _hour+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hour+1, 1
;MyProject.c,181 :: 		AM_PM();
	CALL       _AM_PM+0
;MyProject.c,182 :: 		printTime();
	CALL       _printTime+0
;MyProject.c,183 :: 		count = 0;
	CLRF       _count+0
	CLRF       _count+1
;MyProject.c,184 :: 		while(setHour == 1);
L_setTimeMode28:
	BTFSS      PORTD+0, 2
	GOTO       L_setTimeMode29
	GOTO       L_setTimeMode28
L_setTimeMode29:
;MyProject.c,185 :: 		}
L_setTimeMode26:
;MyProject.c,186 :: 		if(setMode == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_setTimeMode30
;MyProject.c,187 :: 		while(setMode == 1);
L_setTimeMode31:
	BTFSS      PORTD+0, 0
	GOTO       L_setTimeMode32
	GOTO       L_setTimeMode31
L_setTimeMode32:
;MyProject.c,188 :: 		INTCON.TMR0IE = 0;
	BCF        INTCON+0, 5
;MyProject.c,189 :: 		break;
	GOTO       L_setTimeMode21
;MyProject.c,190 :: 		}
L_setTimeMode30:
;MyProject.c,191 :: 		blink();
	CALL       _blink+0
;MyProject.c,193 :: 		}
	GOTO       L_setTimeMode20
L_setTimeMode21:
;MyProject.c,194 :: 		}
L_end_setTimeMode:
	RETURN
; end of _setTimeMode

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,195 :: 		void Interrupt(){
;MyProject.c,196 :: 		if (TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt33
;MyProject.c,197 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;MyProject.c,198 :: 		TMR0 = 5;
	MOVLW      5
	MOVWF      TMR0+0
;MyProject.c,199 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;MyProject.c,200 :: 		}
L_Interrupt33:
;MyProject.c,201 :: 		}
L_end_Interrupt:
L__Interrupt54:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_blink:

;MyProject.c,203 :: 		void blink(){
;MyProject.c,204 :: 		if(count == timerDelay){
	MOVF       _count+1, 0
	XORWF      _timerDelay+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__blink56
	MOVF       _timerDelay+0, 0
	XORWF      _count+0, 0
L__blink56:
	BTFSS      STATUS+0, 2
	GOTO       L_blink34
;MyProject.c,205 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,206 :: 		}
	GOTO       L_blink35
L_blink34:
;MyProject.c,207 :: 		else if(count == 2*timerDelay){
	MOVF       _timerDelay+0, 0
	MOVWF      R1+0
	MOVF       _timerDelay+1, 0
	MOVWF      R1+1
	RLF        R1+0, 1
	RLF        R1+1, 1
	BCF        R1+0, 0
	MOVF       _count+1, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__blink57
	MOVF       R1+0, 0
	XORWF      _count+0, 0
L__blink57:
	BTFSS      STATUS+0, 2
	GOTO       L_blink36
;MyProject.c,208 :: 		count = 0;
	CLRF       _count+0
	CLRF       _count+1
;MyProject.c,209 :: 		printTime();
	CALL       _printTime+0
;MyProject.c,210 :: 		}
L_blink36:
L_blink35:
;MyProject.c,211 :: 		}
L_end_blink:
	RETURN
; end of _blink
