
_main:

;_7_seg_button.c,3 :: 		void main() {
;_7_seg_button.c,4 :: 		trisc = 0;
	CLRF       TRISC+0
;_7_seg_button.c,5 :: 		portc = 0;
	CLRF       PORTC+0
;_7_seg_button.c,6 :: 		trisd = 0b00011000;
	MOVLW      24
	MOVWF      TRISD+0
;_7_seg_button.c,7 :: 		while(portd.f3 == 0);
L_main0:
	BTFSC      PORTD+0, 3
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;_7_seg_button.c,8 :: 		for(i;i<10;i++){
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      10
	SUBWF      _i+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;_7_seg_button.c,9 :: 		portc = seqCode[i];
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
;_7_seg_button.c,10 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;_7_seg_button.c,8 :: 		for(i;i<10;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;_7_seg_button.c,11 :: 		}
	GOTO       L_main2
L_main3:
;_7_seg_button.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
