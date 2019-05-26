
_main:

;waterLevel.c,1 :: 		void main() {
;waterLevel.c,2 :: 		trisc = 0;
	CLRF       TRISC+0
;waterLevel.c,3 :: 		portc= 0;
	CLRF       PORTC+0
;waterLevel.c,4 :: 		trisd = 0b00011000;
	MOVLW      24
	MOVWF      TRISD+0
;waterLevel.c,5 :: 		while(1)
L_main0:
;waterLevel.c,6 :: 		if(portd.f3 == 1  && portd.f4 == 0)
	BTFSS      PORTD+0, 3
	GOTO       L_main4
	BTFSC      PORTD+0, 4
	GOTO       L_main4
L__main6:
;waterLevel.c,7 :: 		portc.f0 = 1;
	BSF        PORTC+0, 0
	GOTO       L_main5
L_main4:
;waterLevel.c,9 :: 		portc.f0 = 0;
	BCF        PORTC+0, 0
L_main5:
	GOTO       L_main0
;waterLevel.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
