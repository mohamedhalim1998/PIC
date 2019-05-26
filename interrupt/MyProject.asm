
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;MyProject.c,3 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;MyProject.c,4 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;MyProject.c,5 :: 		option_reg.intedg=0;   //select Interrupt on falling edge of INT0 pin
	BCF        OPTION_REG+0, 6
;MyProject.c,8 :: 		trisc  = 0;
	CLRF       TRISC+0
;MyProject.c,10 :: 		portc = 1;
	MOVLW      1
	MOVWF      PORTC+0
;MyProject.c,11 :: 		}
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

;MyProject.c,13 :: 		void interrupt(){
;MyProject.c,14 :: 		portc.f1 = 1;
	BSF        PORTC+0, 1
;MyProject.c,16 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;MyProject.c,18 :: 		}
L_end_interrupt:
L__interrupt2:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
