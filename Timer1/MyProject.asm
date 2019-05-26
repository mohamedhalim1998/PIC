
_main:

;MyProject.c,2 :: 		void main() {
;MyProject.c,3 :: 		T1CON = 0x01;
	MOVLW      1
	MOVWF      T1CON+0
;MyProject.c,4 :: 		INTCON = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;MyProject.c,5 :: 		TMR1IE_bit = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;MyProject.c,6 :: 		TMR1H = 0xD8;
	MOVLW      216
	MOVWF      TMR1H+0
;MyProject.c,7 :: 		TMR1L = 0xEF;
	MOVLW      239
	MOVWF      TMR1L+0
;MyProject.c,8 :: 		trisb = 0;
	CLRF       TRISB+0
;MyProject.c,9 :: 		portb = 0;
	CLRF       PORTB+0
;MyProject.c,10 :: 		while(1);
L_main0:
	GOTO       L_main0
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

;MyProject.c,12 :: 		void interrupt(){
;MyProject.c,13 :: 		if(TMR1IF_bit = 1){
	BSF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_interrupt2
;MyProject.c,14 :: 		TMR1H = 0xD8;
	MOVLW      216
	MOVWF      TMR1H+0
;MyProject.c,15 :: 		TMR1L = 0xEF;
	MOVLW      239
	MOVWF      TMR1L+0
;MyProject.c,16 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;MyProject.c,17 :: 		if ( count == 50){
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt7
	MOVLW      50
	XORWF      _count+0, 0
L__interrupt7:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt3
;MyProject.c,18 :: 		count = 0;
	CLRF       _count+0
	CLRF       _count+1
;MyProject.c,19 :: 		portb = ~ portb;
	COMF       PORTB+0, 1
;MyProject.c,20 :: 		}
L_interrupt3:
;MyProject.c,21 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;MyProject.c,22 :: 		}
L_interrupt2:
;MyProject.c,23 :: 		}
L_end_interrupt:
L__interrupt6:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
