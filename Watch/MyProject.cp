#line 1 "E:/amr/PIC code/Watch/MyProject.c"
#line 37 "E:/amr/PIC code/Watch/MyProject.c"
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


int minute = 55;
int hour = 10;
int second = 6;
int i = 0;

char time[12] ;
char sMinute[7];
char sHour[7];
char sSecond[7];

int count = 0;
int am = 0b0;
int timerDelay = 63;

void setUp();




void updateSeconds();

void updateMinutes();


void updateHours();

void printTime();
void AM_PM();
void setTimeMode();
void blink();

void main() {
 setUp();
 while(1){
 if( portd.f0  == 0){
 updateSeconds();
 updateMinutes();
 updateHours();
 printTime();
 delay_ms(1000);
 } else {
 delay_ms(50);
 if( portd.f0  == 1){
 while( portd.f0  == 1);
 setTimeMode();
 }
 }
 }
}
void setUp(){
 trisd = 0b00000111;
 OPTION_REG = 0x85;
 INTCON.GIE = 1;
 INTCON.PEIE = 1;

 lcd_init();
 Lcd_Cmd( _LCD_CURSOR_OFF);

 printTime();
 delay_ms(1000);
 }
void updateSeconds(){
 second++;
}
void updateMinutes(){
 if (second == 60){
 second = 0;
 minute++;
 }
}
void updateHours(){
 if(minute == 60){
 minute = 0;
 if(hour == 12)
 hour = 0;
 hour ++;
 AM_PM();
 }
}

void AM_PM(){
 if (hour == 12){
 am = ~ am;
 }
}

void printTime(){
 IntToStr(second,sSecond);
 IntToStr(minute,sMinute);
 IntToStr(hour,sHour);
 time[0] = sHour[4];
 time[1] = sHour[5];
 time[2] = ':' ;
 time[3] = sMinute[4];
 time[4] = sMinute[5];
 time[5] = ':';
 time[6] = sSecond[4];
 time[7] = sSecond[5];
 for(i = 0;i<8;i++){
 if(time[i] == ' ')
 time[i] = '0';
 }
 time[8] = ' ';
 if (am == 0)
 time[9] = 'P';
 else
 time[9] = 'A';
 time[10] = 'M';
 time[11] = ' ';
 LCD_OUT(1,5,time);

}

void setTimeMode(){
 INTCON.TMR0IE = 1;
 TMR0 = 5;
 while(1){
 if( portd.f1  == 1){
 minute++;
 if(minute == 60)
 minute = 0;
 printTime();
 count = 0;
 while( portd.f1  == 1);
 }
 if( portd.f2  == 1){
 if(hour == 12)
 hour = 0;
 hour++;
 AM_PM();
 printTime();
 count = 0;
 while( portd.f2  == 1);
 }
 if( portd.f0  == 1){
 while( portd.f0  == 1);
 INTCON.TMR0IE = 0;
 break;
 }
 blink();

 }
}
 void Interrupt(){
 if (TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0 = 5;
 count++;
 }
}

void blink(){
 if(count == timerDelay){
 lcd_cmd(_lcd_clear);
 }
 else if(count == 2*timerDelay){
 count = 0;
 printTime();
 }
}
