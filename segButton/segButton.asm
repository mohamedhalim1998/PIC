
_main:

;segButton.c,3 :: 		void main() {
;segButton.c,4 :: 		trisc = 0;
	CLRF       TRISC+0
;segButton.c,5 :: 		portc = 0;
	CLRF       PORTC+0
;segButton.c,6 :: 		trisd = 0b00011000;
	MOVLW      24
	MOVWF      TRISD+0
;segButton.c,7 :: 		while(portd.f3 == 0);
L_main0:
	BTFSC      PORTD+0, 3
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;segButton.c,8 :: 		l1:
___main_l1:
;segButton.c,9 :: 		for(i = 0;i<10;){
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      10
	SUBWF      _i+0, 0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;segButton.c,10 :: 		portc = seqCode[i];
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _seqCode+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;segButton.c,11 :: 		while(portd.f4 == 0);
L_main5:
	BTFSC      PORTD+0, 4
	GOTO       L_main6
	GOTO       L_main5
L_main6:
;segButton.c,12 :: 		while(portd.f4 == 1);
L_main7:
	BTFSS      PORTD+0, 4
	GOTO       L_main8
	GOTO       L_main7
L_main8:
;segButton.c,13 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;segButton.c,14 :: 		}
	GOTO       L_main2
L_main3:
;segButton.c,15 :: 		goto l1;
	GOTO       ___main_l1
;segButton.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
