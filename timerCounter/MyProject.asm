
_main:

;MyProject.c,3 :: 		void main() {
;MyProject.c,5 :: 		OPTION_REG.T0CS = 1; //Transition on RA4/T0CKI pin
	BSF        OPTION_REG+0, 5
;MyProject.c,6 :: 		OPTION_REG.T0SE = 1; //Increment on high-to-low transition on RA4/T0CKI pin
	BSF        OPTION_REG+0, 4
;MyProject.c,7 :: 		OPTION_REG.PSA = 0;  //Prescaler is assigned to the Timer0 module
	BCF        OPTION_REG+0, 3
;MyProject.c,10 :: 		OPTION_REG.PS2 = 0;
	BCF        OPTION_REG+0, 2
;MyProject.c,11 :: 		OPTION_REG.PS1 = 0;
	BCF        OPTION_REG+0, 1
;MyProject.c,12 :: 		OPTION_REG.PS0 = 0;
	BCF        OPTION_REG+0, 0
;MyProject.c,16 :: 		intcon.b5=1; //timer0 overflow interrupt
	BSF        INTCON+0, 5
;MyProject.c,17 :: 		intcon.b6=1;  //Enables all unmasked peripheral interrupts
	BSF        INTCON+0, 6
;MyProject.c,18 :: 		intcon.b7=1;   //enable global interrupt
	BSF        INTCON+0, 7
;MyProject.c,19 :: 		trisa.b4 = 1;
	BSF        TRISA+0, 4
;MyProject.c,20 :: 		trisc = 0;
	CLRF       TRISC+0
;MyProject.c,21 :: 		portc = 0;
	CLRF       PORTC+0
;MyProject.c,22 :: 		TMR0 = 0;
	CLRF       TMR0+0
;MyProject.c,23 :: 		while(1){
L_main0:
;MyProject.c,24 :: 		count = TMR0;
	MOVF       TMR0+0, 0
	MOVWF      _count+0
	CLRF       _count+1
;MyProject.c,25 :: 		portc = seg[count];
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;MyProject.c,26 :: 		}
	GOTO       L_main0
;MyProject.c,28 :: 		}
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

;MyProject.c,30 :: 		void interrupt()
;MyProject.c,33 :: 		if(intcon.b2==1) //if timer0 is overlfowed
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt2
;MyProject.c,35 :: 		intcon.b2=0; //reset timer0 flag
	BCF        INTCON+0, 2
;MyProject.c,36 :: 		}
L_interrupt2:
;MyProject.c,38 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
