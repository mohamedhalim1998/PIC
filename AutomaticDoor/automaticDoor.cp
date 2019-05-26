#line 1 "E:/amr/PIC code/AutomaticDoor/automaticDoor.c"









void main() {

 trisd = 0b00011111 ;
 trisc = 0x00;
 portc = 0;

 while( portd.f0  == 0);
 portc.f2 = 1;

 while(1){
 if( portd.f1  == 1 ||  portd.f2  == 1){
 L1:


  portc.f0  = 1;
 while( portd.f3  == 0);
  portc.f0  = 0;
 portc.f2 = 0 ;
 delay_ms(2000);
  portc.f1  = 1;


 while( portd.f4  == 0){
 if( portd.f1  == 1 ||  portd.f2  == 1){
 delay_ms(500);
 goto L1;
 }
 }

 }
 }
}
