#line 1 "E:/amr/PIC code/timerCounter/MyProject.c"
int count = 0;
int seg[] = {0x3F,0x06,0x5B ,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void main() {

 OPTION_REG.T0CS = 1;
 OPTION_REG.T0SE = 1;
 OPTION_REG.PSA = 0;


 OPTION_REG.PS2 = 0;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS0 = 0;



 intcon.b5=1;
 intcon.b6=1;
 intcon.b7=1;
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

 if(intcon.b2==1)
 {
 intcon.b2=0;
 }

}
