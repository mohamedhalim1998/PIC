#define motor1 portc.f0
#define motor2 portc.f1
#define motor3 portc.f2

#define start portd.f0
#define stop  portd.f1

void main() {
  trisc = 0;
  trisd = 3;
  L1 :
  portc = 0;
  while(start == 0);
  portc = 1;
  delay_ms(1000);
  portc = 3;
  delay_ms(1000);
  portc = 7;
  while(stop == 0);
  goto L1;
}
void interrupt(){
     portc = 0;
}