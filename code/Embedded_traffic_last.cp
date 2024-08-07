#line 1 "C:/Users/A store/OneDrive/Desktop/project1 sh/code/Embedded_traffic_last.c"
#line 12 "C:/Users/A store/OneDrive/Desktop/project1 sh/code/Embedded_traffic_last.c"
 void counter(signed char count){
 char left = count/10;
 char right=count%10;
 porta.b0=0;
 porta.b1=0;
 porta.b2=0;
 porta.b3=0;
  portc =right;
  portd =left;
 delay_ms(10);
}
signed char count;
unsigned char i ,state;
#line 56 "C:/Users/A store/OneDrive/Desktop/project1 sh/code/Embedded_traffic_last.c"
 void manual_mode(){
 if( portb.b7 ){
 for(count=3;count>=0;count--){
  portb.b2 =0;  portb.b3 =0;  portb.b4 =1;
  portb.b6 =1; portb.b7 =0;
 for(i=0;i<50;i++){

 char left = count/10;
 char right=count%10;
 porta.b0=0;
 porta.b1=0;
 porta.b2=0;
 porta.b3=0;
  portc =right;
  portd =left;
 delay_ms(10);
 }}
  portb.b5 =1;  portb.b6 =0;}
 else if( portb.b4 ){
 for(count=3;count>=0;count--){
  portb.b5 =0;  portb.b6 =0;  portb.b7 =1;
  portb.b3 =1;  portb.b4 =0;
 for(i=0;i<50;i++){

 char left = count/10;
 char right=count%10;
 porta.b0=0;
 porta.b1=0;
 porta.b2=0;
 porta.b3=0;
  portc =right;
  portd =left;
 delay_ms(10);
 }}
  portb.b2 =1;  portb.b3 =0;}
 delay_ms(100);
 }

 void interrupt(){
 while(INTF_bit){
  portc =0;  portd =0;
 delay_ms(500);
 if(!portb.b1){
 manual_mode();
 } if(portb.b0){ INTF_bit=0; }

 }
 }

void main() {
 adcon1=0x07;
 trisb.b0=1;
 trisb.b1=1;
 INTE_bit=1;
 GIE_bit=1;
 INTEDG_bit=0;
 Not_RBPU_bit=0;
 trisa.b0=0; porta.b0=1;
 trisa.B1=0; porta.b1=1;
 trisa.b2=0; porta.b2=1;
 trisa.B3=0; porta.b3=1;
 trisc=0;  portc =0;
 trisd=0;  portd =0;
 trisb=0b00000011;
  portb.b2 =0;  portb.b3 =0;  portb.b4 =0;
  portb.b5 =0;  portb.b6 =0;  portb.b7 =0;
 delay_ms(100);
 while(1){
 for(;;){

 for(count=23;count>=4;count--){

  portb.b2 =0;  portb.b3 =0;  portb.b4 =1;
  portb.b5 =1;  portb.b6 =0;  portb.b7 =0;
 for(i=0;i<50;i++){
 counter(count);
 }}
 for(count=3;count>=0;count--){

  portb.b2 =0;  portb.b3 =1;  portb.b4 =0;
  portb.b5 =1;  portb.b6 =0;  portb.b7 =0;
 for(i=0;i<50;i++){
 counter(count);
 }}
 for(count=15;count>=4;count--){

  portb.b2 =1;  portb.b3 =0;  portb.b4 =0;
  portb.b5 =0;  portb.b6 =0;  portb.b7 =1;
 for(i=0;i<50;i++){
 counter(count);
 }}
 for(count=3;count>=0;count--){

  portb.b2 =1;  portb.b3 =0;  portb.b4 =0;
  portb.b5 =0;  portb.b6 =1;  portb.b7 =0;
 for(i=0;i<50;i++){
 counter(count);
 }}
 }
 }


}
