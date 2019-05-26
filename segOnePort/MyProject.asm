
_main:

;MyProject.c,3 :: 		void main() {
;MyProject.c,4 :: 		trisb = 0x00;
	CLRF       TRISB+0
;MyProject.c,5 :: 		portb = 0;
	CLRF       PORTB+0
;MyProject.c,6 :: 		for( i = 0; i <= 9 ; i++){
	CLRF       _i+0
	CLRF       _i+1
L_main0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       _i+0, 0
	SUBLW      9
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L_main1
;MyProject.c,7 :: 		for( j = 0;j <= 9; j++){
	CLRF       _j+0
	CLRF       _j+1
L_main3:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       _j+0, 0
	SUBLW      9
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;MyProject.c,8 :: 		portb = j + hexToDecimal(i);
	MOVF       _i+0, 0
	MOVWF      FARG_hexToDecimal_i+0
	MOVF       _i+1, 0
	MOVWF      FARG_hexToDecimal_i+1
	CALL       _hexToDecimal+0
	MOVF       R0+0, 0
	ADDWF      _j+0, 0
	MOVWF      PORTB+0
;MyProject.c,9 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;MyProject.c,7 :: 		for( j = 0;j <= 9; j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,10 :: 		}
	GOTO       L_main3
L_main4:
;MyProject.c,6 :: 		for( i = 0; i <= 9 ; i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,11 :: 		}
	GOTO       L_main0
L_main1:
;MyProject.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_hexToDecimal:

;MyProject.c,14 :: 		int hexToDecimal(int i) {
;MyProject.c,15 :: 		return i * 16;
	MOVLW      4
	MOVWF      R2+0
	MOVF       FARG_hexToDecimal_i+0, 0
	MOVWF      R0+0
	MOVF       FARG_hexToDecimal_i+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__hexToDecimal11:
	BTFSC      STATUS+0, 2
	GOTO       L__hexToDecimal12
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__hexToDecimal11
L__hexToDecimal12:
;MyProject.c,16 :: 		}
L_end_hexToDecimal:
	RETURN
; end of _hexToDecimal
