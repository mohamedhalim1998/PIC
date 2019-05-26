#line 1 "E:/amr/PIC code/_7_seg_button.c"
int i=0;
int seqCode[] = {0x3F,0x06,0x5B ,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void main() {
trisc = 0;
portc = 0;
trisd = 0b00011000;
while(portd.f3 == 0);
for(i;i<10;i++){
 portc = seqCode[i];
 delay_ms(500);
}
}
