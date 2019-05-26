#line 1 "E:/amr/PIC code/multifunction/multiFunction.c"

int count = 0;
int i = 0;
void main() {

 trisd = 0b00000100;
 trisb = 0x00;
 portb = 0x00;


 while(1){
 count = 0;
 while(portd.f2 == 0);

 while(portd.f2 == 1){
 count++;
 delay_ms(5);
 }

 if(count < 70) {
 for(i = 0;i < 500;i++){
 if(portd.f2 == 1){
 while(portd.f2 == 1);
 portb.f2 = 1;
 break;
 }
 delay_ms(1);}
 if(portb.f2 == 0)
 portb.f0 = 1;
 }
 else
 portb.f1 = 1;

 delay_ms(1000);
 }
}
