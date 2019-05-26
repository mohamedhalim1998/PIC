
_main:

;automaticDoor.c,10 :: 		void main() {
;automaticDoor.c,12 :: 		trisd = 0b00011111   ;
	MOVLW      31
	MOVWF      TRISD+0
;automaticDoor.c,13 :: 		trisc = 0x00;
	CLRF       TRISC+0
;automaticDoor.c,14 :: 		portc = 0;
	CLRF       PORTC+0
;automaticDoor.c,16 :: 		while(start == 0);
L_main0:
	BTFSC      PORTD+0, 0
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;automaticDoor.c,17 :: 		portc.f2 = 1; //for test only
	BSF        PORTC+0, 2
;automaticDoor.c,19 :: 		while(1){
L_main2:
;automaticDoor.c,20 :: 		if(sensorIn == 1 || sensorOut == 1){
	BTFSC      PORTD+0, 1
	GOTO       L__main17
	BTFSC      PORTD+0, 2
	GOTO       L__main17
	GOTO       L_main6
L__main17:
;automaticDoor.c,21 :: 		L1:
___main_L1:
;automaticDoor.c,24 :: 		open = 1; // start the motor
	BSF        PORTC+0, 0
;automaticDoor.c,25 :: 		while(limitOpen == 0);
L_main7:
	BTFSC      PORTD+0, 3
	GOTO       L_main8
	GOTO       L_main7
L_main8:
;automaticDoor.c,26 :: 		open = 0;
	BCF        PORTC+0, 0
;automaticDoor.c,27 :: 		portc.f2 = 0 ; // for test only
	BCF        PORTC+0, 2
;automaticDoor.c,28 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;automaticDoor.c,29 :: 		close = 1;  // revrse the motor direction
	BSF        PORTC+0, 1
;automaticDoor.c,32 :: 		while(limitClose == 0){
L_main10:
	BTFSC      PORTD+0, 4
	GOTO       L_main11
;automaticDoor.c,33 :: 		if(sensorIn == 1 || sensorOut == 1){
	BTFSC      PORTD+0, 1
	GOTO       L__main16
	BTFSC      PORTD+0, 2
	GOTO       L__main16
	GOTO       L_main14
L__main16:
;automaticDoor.c,34 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;automaticDoor.c,35 :: 		goto L1;
	GOTO       ___main_L1
;automaticDoor.c,36 :: 		}
L_main14:
;automaticDoor.c,37 :: 		}
	GOTO       L_main10
L_main11:
;automaticDoor.c,39 :: 		}
L_main6:
;automaticDoor.c,40 :: 		}
	GOTO       L_main2
;automaticDoor.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
