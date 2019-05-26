int i=0;
int seqCode[] =  {0x3F,0x06,0x5B ,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void main() {
trisc = 0;
portc = 0;
trisd = 0b00011000;
while(portd.f3 == 0);
l1:
for(i = 0;i<10;){
   portc = seqCode[i];
   while(portd.f4 == 0);
   while(portd.f4 == 1);
   i++;
}
goto l1;
}