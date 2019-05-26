#line 1 "E:/amr/PIC code/segOnePort/MyProject.c"
int i , j;
int hexToDecimal(int i);
void main() {
 trisb = 0x00;
 portb = 0;
 for( i = 0; i <= 9 ; i++){
 for( j = 0;j <= 9; j++){
 portb = j + hexToDecimal(i);
 delay_ms(500);
 }
 }
}

int hexToDecimal(int i) {
return i * 16;
}
