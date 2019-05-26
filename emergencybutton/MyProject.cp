#line 1 "E:/amr/PIC code/emergencybutton/MyProject.c"







void main() {
 trisc = 0;
 trisd = 3;
 L1 :
 portc = 0;
 while( portd.f0  == 0);
 portc = 1;
 delay_ms(1000);
 portc = 3;
 delay_ms(1000);
 portc = 7;
 while( portd.f1  == 0);
 goto L1;
}
void interrupt(){
 portc = 0;
}
