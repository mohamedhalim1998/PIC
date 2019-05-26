
_main:

;MyProject.c,18 :: 		void main() {
;MyProject.c,19 :: 		lcd_init();
	CALL       _Lcd_Init+0
;MyProject.c,20 :: 		Lcd_Cmd( _LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,21 :: 		intToStr(num,numc);
	MOVF       _num+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _num+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _numc+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MyProject.c,22 :: 		LCD_chr(1,1,numc[5]);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _numc+5, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
