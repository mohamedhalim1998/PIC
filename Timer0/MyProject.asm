
_main:

;MyProject.c,2 :: 		void main() {
;MyProject.c,4 :: 		INTCON.GIE = 1;    // gloable interrupt
	BSF        INTCON+0, 7
;MyProject.c,5 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;MyProject.c,6 :: 		INTCON.TMR0IE = 1; // timer 0 interrupt
	BSF        INTCON+0, 5
;MyProject.c,8 :: 		OPTION_REG.T0CS = 0;
	BCF        OPTION_REG+0, 5
;MyProject.c,9 :: 		OPTION_REG.PSA  = 0;
	BCF        OPTION_REG+0, 3
;MyProject.c,10 :: 		OPTION_REG.PS0  = 0;
	BCF        OPTION_REG+0, 0
;MyProject.c,11 :: 		OPTION_REG.PS1  = 1;
	BSF        OPTION_REG+0, 1
;MyProject.c,12 :: 		OPTION_REG.PS2  = 1;
	BSF        OPTION_REG+0, 2
;MyProject.c,14 :: 		TMR0 = 99;
	MOVLW      99
	MOVWF      TMR0+0
;MyProject.c,16 :: 		trisb = 0;
	CLRF       TRISB+0
;MyProject.c,17 :: 		portb = 0;
	CLRF       PORTB+0
;MyProject.c,18 :: 		portb = 1;
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,20 :: 		}
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

;MyProject.c,21 :: 		void interrupt(){
;MyProject.c,22 :: 		if(INTCON.TMR0IF == 1){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt0
;MyProject.c,23 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;MyProject.c,24 :: 		TMR0 = 99;
	MOVLW      99
	MOVWF      TMR0+0
;MyProject.c,25 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;MyProject.c,26 :: 		if(count >= 100){
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt5
	MOVLW      100
	SUBWF      _count+0, 0
L__interrupt5:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt1
;MyProject.c,27 :: 		portb =~ portb;
	COMF       PORTB+0, 1
;MyProject.c,28 :: 		count = 0;
	CLRF       _count+0
	CLRF       _count+1
;MyProject.c,29 :: 		}
L_interrupt1:
;MyProject.c,31 :: 		}
L_interrupt0:
;MyProject.c,32 :: 		}
L_end_interrupt:
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
