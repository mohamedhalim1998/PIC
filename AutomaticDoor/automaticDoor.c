// define constants for sensors and switchs
#define start portd.f0
#define sensorIn portd.f1
#define sensorOut portd.f2
#define limitOpen portd.f3
#define limitClose portd.f4
// define constants for motor diretion control
#define open portc.f0
#define close portc.f1
void main() {
 // initialise  ports and trises
 trisd = 0b00011111   ;
 trisc = 0x00;
 portc = 0;
// hold until start is pressed
 while(start == 0);
 portc.f2 = 1; //for test only
// program loop
 while(1){
    if(sensorIn == 1 || sensorOut == 1){
      L1: 
       //open the door until the limit switch of open is pressed 
       // then hold for 2 sec
          open = 1; // start the motor
          while(limitOpen == 0);
          open = 0;
          portc.f2 = 0 ; // for test only
          delay_ms(2000);
          close = 1;  // revrse the motor direction
          //close the door  until the limit switch of close is pressed
          //          put re-open it if any sensor read
     while(limitClose == 0){
        if(sensorIn == 1 || sensorOut == 1){
          delay_ms(500);
          goto L1;
        }
     }

    }
 }
}