// intialize variables
int count = 0;
int i = 0;
void main() {
// intialize ports and trises
  trisd = 0b00000100;
  trisb = 0x00;
  portb = 0x00;
  
  // program Loop
  while(1){
    count = 0;
  while(portd.f2 == 0);
  // calculatethe time switch is pressed
  while(portd.f2 == 1){
     count++;
     delay_ms(5);
  }
  // pushed the button once
  if(count < 70) {
     for(i = 0;i < 500;i++){ // waiting for the second press
        if(portd.f2 == 1){
          while(portd.f2 == 1);
          portb.f2 = 1;
          break;
        }
        delay_ms(1);}
        if(portb.f2 == 0)
           portb.f0 = 1;
        }
  else // hold the button
     portb.f1 = 1;
     
  delay_ms(1000);
  }
}