
_main:

;MyProject.c,8 :: 		void main() {
;MyProject.c,9 :: 		trisc = 0;
	CLRF       TRISC+0
;MyProject.c,10 :: 		trisd = 3;
	MOVLW      3
	MOVWF      TRISD+0
;MyProject.c,11 :: 		L1 :
___main_L1:
;MyProject.c,12 :: 		portc = 0;
	CLRF       PORTC+0
;MyProject.c,13 :: 		while(start == 0);
L_main0:
	BTFSC      PORTD+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;MyProject.c,14 :: 		portc = 1;
	MOVLW      1
	MOVWF      PORTC+0
;MyProject.c,15 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;MyProject.c,16 :: 		portc = 3;
	MOVLW      3
	MOVWF      PORTC+0
;MyProject.c,17 :: 		delay_ms(1000);
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
;MyProject.c,18 :: 		portc = 7;
	MOVLW      7
	MOVWF      PORTC+0
;MyProject.c,19 :: 		while(stop == 0);
L_main4:
	BTFSC      PORTD+0, 1
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;MyProject.c,20 :: 		goto L1;
	GOTO       ___main_L1
;MyProject.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,22 :: 		void interrupt(){
;MyProject.c,23 :: 		portc = 0;
	CLRF       PORTC+0
;MyProject.c,24 :: 		}
L_end_interrupt:
L__interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
