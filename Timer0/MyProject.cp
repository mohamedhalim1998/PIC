#line 1 "E:/amr/PIC code/Timer0/MyProject.c"
int count = 0;
void main() {

 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.TMR0IE = 1;

 OPTION_REG.T0CS = 0;
 OPTION_REG.PSA = 0;
 OPTION_REG.PS0 = 0;
 OPTION_REG.PS1 = 1;
 OPTION_REG.PS2 = 1;

 TMR0 = 99;

 trisb = 0;
 portb = 0;
 portb = 1;

}
void interrupt(){
 if(INTCON.TMR0IF == 1){
 INTCON.TMR0IF = 0;
 TMR0 = 99;
 count++;
 if(count >= 100){
 portb =~ portb;
 count = 0;
 }

 }
}
