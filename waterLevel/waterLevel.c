void main() {
  trisc = 0;
  portc= 0;
  trisd = 0b00011000;
  while(1)
  if(portd.f3 == 1  && portd.f4 == 0)
      portc.f0 = 1;
  else
      portc.f0 = 0;



}