#line 1 "E:/amr/PIC code/interruptCounter/MyProject.c"
int i=0;
int j =0;
int count = 0;
int delayCount = 0;
int segment[] = {0x3F,0x06,0x5B ,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void main() {
 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.INTE = 1;
 option_reg.intedg = 1;
 trisc = 0;
 portc = 0;
 l1 :
 for(i = 0;i<10;i++){
 portc = segment[i];
 count = 0 ;
 delay_ms(1000);
}
goto l1;
}

void interrupt(){
l2 :
 while(portb.f0 == 1);
 for(j = 0;j < 500;j++){
 if(portb.f0 == 1){
 count++;
 goto l2;
 }
 delay_ms(1);
 }
 count++;
 i = count;
 portc = segment[i];
 delay_ms(1000);
 INTCON.INTF = 0;
}
