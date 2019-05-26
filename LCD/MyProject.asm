
_main:

;MyProject.c,16 :: 		void main() {
;MyProject.c,17 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,18 :: 		Lcd_Cmd( _LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,20 :: 		while(1){
L_main0:
;MyProject.c,22 :: 		Lcd_Out(1,1,"test"); // printing  at lcd at posistion line 1 col 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,23 :: 		}
	GOTO       L_main0
;MyProject.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
