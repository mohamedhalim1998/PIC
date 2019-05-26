#line 1 "E:/amr/PIC code/number/MyProject.c"
sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D4 at RC2_bit;
sbit LCD_D5 at RC3_bit;
sbit LCD_D6 at RC4_bit;
sbit LCD_D7 at RC5_bit;

sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISC3_bit;
sbit LCD_D6_Direction at TRISC4_bit;
sbit LCD_D7_Direction at TRISC5_bit;

int num = 123;
char numc[7] ;
int i = 0;
void main() {
 lcd_init();
 Lcd_Cmd( _LCD_CURSOR_OFF);
 intToStr(num,numc);
 LCD_chr(1,1,numc[5]);

}
