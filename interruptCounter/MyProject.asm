
_main:

;MyProject.c,6 :: 		void main() {
;MyProject.c,7 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;MyProject.c,8 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;MyProject.c,9 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;MyProject.c,10 :: 		option_reg.intedg = 1;
	BSF        OPTION_REG+0, 6
;MyProject.c,11 :: 		trisc = 0;
	CLRF       TRISC+0
;MyProject.c,12 :: 		portc = 0;
	CLRF       PORTC+0
;MyProject.c,13 :: 		l1   :
___main_l1:
;MyProject.c,14 :: 		for(i = 0;i<10;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      10
	SUBWF      _i+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;MyProject.c,15 :: 		portc = segment[i];
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _segment+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;MyProject.c,16 :: 		count = 0  ;
	CLRF       _count+0
	CLRF       _count+1
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
;MyProject.c,14 :: 		for(i = 0;i<10;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,18 :: 		}
	GOTO       L_main0
L_main1:
;MyProject.c,19 :: 		goto l1;
	GOTO       ___main_l1
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

;MyProject.c,22 :: 		void interrupt(){
;MyProject.c,23 :: 		l2 :
___interrupt_l2:
;MyProject.c,24 :: 		while(portb.f0 == 1);
L_interrupt4:
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt5
	GOTO       L_interrupt4
L_interrupt5:
;MyProject.c,25 :: 		for(j = 0;j < 500;j++){
	CLRF       _j+0
	CLRF       _j+1
L_interrupt6:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt16
	MOVLW      244
	SUBWF      _j+0, 0
L__interrupt16:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt7
;MyProject.c,26 :: 		if(portb.f0 == 1){
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt9
;MyProject.c,27 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;MyProject.c,28 :: 		goto l2;
	GOTO       ___interrupt_l2
;MyProject.c,29 :: 		}
L_interrupt9:
;MyProject.c,30 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_interrupt10:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt10
	DECFSZ     R12+0, 1
	GOTO       L_interrupt10
	NOP
	NOP
;MyProject.c,25 :: 		for(j = 0;j < 500;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,31 :: 		}
	GOTO       L_interrupt6
L_interrupt7:
;MyProject.c,32 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;MyProject.c,33 :: 		i = count;
	MOVF       _count+0, 0
	MOVWF      _i+0
	MOVF       _count+1, 0
	MOVWF      _i+1
;MyProject.c,34 :: 		portc = segment[i];
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _segment+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;MyProject.c,35 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt11:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt11
	DECFSZ     R12+0, 1
	GOTO       L_interrupt11
	DECFSZ     R11+0, 1
	GOTO       L_interrupt11
	NOP
	NOP
;MyProject.c,36 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;MyProject.c,37 :: 		}
L_end_interrupt:
L__interrupt15:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
