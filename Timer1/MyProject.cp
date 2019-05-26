#line 1 "E:/amr/PIC code/Timer1/MyProject.c"
int count = 0;
void main() {
 T1CON = 0x01;
 INTCON = 0xC0;
 TMR1IE_bit = 1;
 TMR1H = 0xD8;
 TMR1L = 0xEF;
 trisb = 0;
 portb = 0;
 while(1);
 }
void interrupt(){
 if(TMR1IF_bit = 1){
 TMR1H = 0xD8;
 TMR1L = 0xEF;
 count++;
 if ( count == 50){
 count = 0;
 portb = ~ portb;
 }
 TMR1IF_bit = 0;
 }
}
