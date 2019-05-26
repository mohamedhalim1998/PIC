void main() {
  INTCON.GIE = 1;
  INTCON.PEIE = 1;
  INTCON.INTE = 1;
  option_reg.intedg = 1;
  
  trisc  = 0;
  portc = 1;
  
}

void interrupt(){
  portc.f1 = 1;
  INTCON.INTF = 0;
}

