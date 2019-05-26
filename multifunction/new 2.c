#define setMode portd.f0
#define setMin portd.f1
#define setHour portd.f2


// citcuit connections

/*
  LCD
  * RS -> C0
  * EN -> C1
  * D4 -> C2
  * D5 -> C3
  * D6 -> C4
  * D7 -> C5
  * E,D0,D1,D2,D3 -> GND
  SWITCHES
  * SetMode -> D0
  * SetMinute -> D1
  * SetHour -> D2
*/

// LCD initilize
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

// variabe initilize
int minute = 5;
int hour = 10;
int second = 6;
char time[]
char sMinute[7];
char sHour[7];
char sSecond[7];

int  am = 0b0;


void setUp();
void increaseSeconds();
void increaseMinutes();
void increaseHours();
void printTime();
void AM_PM();
void setTimeMode();


void main() {
     setUp();
     while(1){
      if(setMode == 0){
        lcd_cmd(_lcd_clear);
        increaseSeconds();
        increaseMinutes();
        increaseHours();
      }else{
        while(setMode == 1);
        setTimeMode();
      }
        printTime();
        delay_ms(1000);
   }
}
void setUp(){
   trisd = 0b00000111;
   lcd_init();
   Lcd_Cmd( _LCD_CURSOR_OFF);
   IntToStr(second,sSecond);
   IntToStr(minute,sMinute);
   IntToStr(hour,sHour);
   printTime();
   delay_ms(1000);
   }
void increaseSeconds(){
      second++;
}
void increaseMinutes(){
      if (second == 60){
      second = 0;
      minute++;
      }
}
void increaseHours(){

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
if (minute > 9 && second > 9){
       lcd_chr(1,11,sSecond[4]);
       lcd_chr(1,12,sSecond[5]);
       lcd_chr(1,8,sMinute[4]);
       lcd_chr(1,9,sMinute[5]);
       lcd_chr(1,5,sHour[4]);
       lcd_chr(1,6,sHour[5]);
       lcd_out(1,7,":");
       lcd_out(1,10,":");
       }
else if (second > 9 && minute <= 9){
       lcd_chr(1,11,sSecond[4]);
       lcd_chr(1,12,sSecond[5]);
       lcd_chr(1,9,sMinute[5]);
       lcd_chr(1,5,sHour[4]);
       lcd_chr(1,6,sHour[5]);
       lcd_out(1,7,":0");
       lcd_out(1,10,":");
       }
else if (minute > 9 && second <= 9){
       lcd_chr(1,12,sSecond[5]);
       lcd_chr(1,8,sMinute[4]);
       lcd_chr(1,9,sMinute[5]);
       lcd_chr(1,5,sHour[4]);
       lcd_chr(1,6,sHour[5]);
       lcd_out(1,7,":");
       lcd_out(1,10,":0");
       }
else if (second <= 9 && minute <= 9){
       lcd_chr(1,12,sSecond[5]);
       lcd_chr(1,9,sMinute[5]);
       lcd_chr(1,5,sHour[4]);
       lcd_chr(1,6,sHour[5]);
       lcd_out(1,7,":0");
       lcd_out(1,10,":0");
}
if (am == 0)
  lcd_out(1,13,"PM");
else
  lcd_out(1,13,"AM");
}

void setTimeMode(){
    while(1){
       if(setMin == 1){
         minute++;
         increaseHours();
         printTime();
         while(setMin == 1);
       }
       if(setHour == 1){
         if(hour == 12)
           hour = 0;
         hour++;
         AM_PM();
         printTime();
         while(setHour == 1);
       }
       if(setMode == 1){
          while(setMode == 1);
          break;
       }
    }
}