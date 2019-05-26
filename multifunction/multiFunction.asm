
_main:

;multiFunction.c,4 :: 		void main() {
;multiFunction.c,6 :: 		trisd = 0b00000100;
	MOVLW      4
	MOVWF      TRISD+0
;multiFunction.c,7 :: 		trisb = 0x00;
	CLRF       TRISB+0
;multiFunction.c,8 :: 		portb = 0x00;
	CLRF       PORTB+0
;multiFunction.c,11 :: 		while(1){
L_main0:
;multiFunction.c,12 :: 		count = 0;
	CLRF       _count+0
	CLRF       _count+1
;multiFunction.c,13 :: 		while(portd.f2 == 0);
L_main2:
	BTFSC      PORTD+0, 2
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;multiFunction.c,15 :: 		while(portd.f2 == 1){
L_main4:
	BTFSS      PORTD+0, 2
	GOTO       L_main5
;multiFunction.c,16 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;multiFunction.c,17 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;multiFunction.c,18 :: 		}
	GOTO       L_main4
L_main5:
;multiFunction.c,20 :: 		if(count < 70) {
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      70
	SUBWF      _count+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;multiFunction.c,21 :: 		for(i = 0;i < 500;i++){ // waiting for the second press
	CLRF       _i+0
	CLRF       _i+1
L_main8:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      244
	SUBWF      _i+0, 0
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;multiFunction.c,22 :: 		if(portd.f2 == 1){
	BTFSS      PORTD+0, 2
	GOTO       L_main11
;multiFunction.c,23 :: 		while(portd.f2 == 1);
L_main12:
	BTFSS      PORTD+0, 2
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;multiFunction.c,24 :: 		portb.f2 = 1;
	BSF        PORTB+0, 2
;multiFunction.c,25 :: 		break;
	GOTO       L_main9
;multiFunction.c,26 :: 		}
L_main11:
;multiFunction.c,27 :: 		delay_ms(1);}
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
	NOP
;multiFunction.c,21 :: 		for(i = 0;i < 500;i++){ // waiting for the second press
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;multiFunction.c,27 :: 		delay_ms(1);}
	GOTO       L_main8
L_main9:
;multiFunction.c,28 :: 		if(portb.f2 == 0)
	BTFSC      PORTB+0, 2
	GOTO       L_main15
;multiFunction.c,29 :: 		portb.f0 = 1;
	BSF        PORTB+0, 0
L_main15:
;multiFunction.c,30 :: 		}
	GOTO       L_main16
L_main7:
;multiFunction.c,32 :: 		portb.f1 = 1;
	BSF        PORTB+0, 1
L_main16:
;multiFunction.c,34 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;multiFunction.c,35 :: 		}
	GOTO       L_main0
;multiFunction.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
