/* LCD watch with set options
developed by MohamedHalim
start date : 13/5/2016
last edit : 17/5/2016*/

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

// USING
/*
on strat : the LCD display random time
           and strat increasing
to Set time : hold SetMode for 1 second entering the set mode
              SetMinute increase  minutes by 1
              SetHour increase Hours by 1
to exit set time mode : press setMode buttom again

*/
// Switches macros
#define setMode portd.f0
#define setMin portd.f1
#define setHour portd.f2
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
int minute = 55;
int hour = 10;
int second = 6;
int i = 0;     // loop variable

char time[12] ;   // total time as string
char sMinute[7];  // minute as string
char sHour[7];    // hours as string
char sSecond[7];  // seconds as string

int count = 0;    // timer counter for delay
int am = 0b0;    // am pm flag
int timerDelay = 63;  // for 500 ms second time (caulated by (time / 8) ms)

void setUp();         // intinal lcd and ports

// update time functios

// increase seconds by 1 every cycle
void updateSeconds();
// increase minute by 1 if seconds = 60 and reset seconds
void updateMinutes();
// increase Hours by 1 if minutes == 60 and reset minutes
// update to pm or am if hour = 12
void updateHours();

void printTime();        // display time on the lcd
void AM_PM();            // toggle if the hour = 12
void setTimeMode();      // interupt for setting the time
void blink();            // blink on seting time

void main() {
     setUp();
     while(1){
      if(setMode == 0){
        updateSeconds();
        updateMinutes();
        updateHours();
        printTime();
        delay_ms(1000);
      } else {
        delay_ms(50);
        if(setMode == 1){
        while(setMode == 1);
        setTimeMode();
        }
      }
   }
}
void setUp(){
   trisd = 0b00000111;  // intial seting buttons
   OPTION_REG         = 0x85; // set the scale and the frequancy source for timer0
   INTCON.GIE = 1;    // global interrupt
   INTCON.PEIE = 1;
   //lcd initlize
   lcd_init();
   Lcd_Cmd( _LCD_CURSOR_OFF);
   // display the strat time
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
    INTCON.TMR0IE = 1; // timer 0 Interrupt
    TMR0 = 5;
    while(1){
       if(setMin == 1){
         minute++;
         if(minute == 60)
            minute = 0;
         printTime();
         count = 0;
         while(setMin == 1);
       }
       if(setHour == 1){
         if(hour == 12)
           hour = 0;
         hour++;
         AM_PM();
          printTime();
          count = 0;
         while(setHour == 1);
       }
       if(setMode == 1){
          while(setMode == 1);
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