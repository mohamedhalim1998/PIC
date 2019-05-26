int count = 0;
int seg[] =  {0x3F,0x06,0x5B ,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void main() {
 //OPTION_REG REGISTER
  OPTION_REG.T0CS = 1; //Transition on RA4/T0CKI pin
  OPTION_REG.T0SE = 1; //Increment on high-to-low transition on RA4/T0CKI pin
  OPTION_REG.PSA = 0;  //Prescaler is assigned to the Timer0 module

  //PS2 - PS0: Prescaler Rate Select bits, Prescaler 1:4
  OPTION_REG.PS2 = 0;
  OPTION_REG.PS1 = 0;
  OPTION_REG.PS0 = 0;


  //INTCON REGISTER
  intcon.b5=1; //timer0 overflow interrupt
  intcon.b6=1;  //Enables all unmasked peripheral interrupts
  intcon.b7=1;   //enable global interrupt
  trisa.b4 = 1;
  trisc = 0;
  portc = 0;
  TMR0 = 0;
  while(1){
  count = TMR0;
     portc = seg[count];
  }

}

void interrupt()
{

 if(intcon.b2==1) //if timer0 is overlfowed
 {
   intcon.b2=0; //reset timer0 flag
 }

}
