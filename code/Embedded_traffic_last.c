#define red_w portb.b2
#define yellow_w portb.b3
#define green_w portb.b4
#define red_s portb.b5
#define yellow_s portb.b6
#define green_s portb.b7
#define display_r portc
#define display_l portd



   void counter(signed char count){
       char left = count/10;
       char right=count%10;
       porta.b0=0;
       porta.b1=0;
       porta.b2=0;
       porta.b3=0;
       display_r=right;
       display_l=left;
       delay_ms(10);
}         
signed char count;
unsigned char i ,state;
  /*  void automatic_mode(){ for(;;){
          for(count=23;count>=4;count--){
          //portd=0b00001100;
          red_w=0; yellow_w=0; green_w=1;
          red_s=1; yellow_s=0; green_s=0;
          for(i=0;i<50;i++){
          counter(count);
          }}   
          for(count=3;count>=0;count--){
          //portd=0b00001010;
          red_w=0; yellow_w=1; green_w=0;
          red_s=1; yellow_s=0; green_s=0;
          for(i=0;i<50;i++){
          counter(count);
          }}
          for(count=15;count>=4;count--){
          //portd=0b00100001;
          red_w=1; yellow_w=0; green_w=0;
          red_s=0; yellow_s=0; green_s=1;
          for(i=0;i<50;i++){
          counter(count);
          }}
          for(count=3;count>=0;count--){
          //portd=0b00010001;
          red_w=1; yellow_w=0; green_w=0;
          red_s=0; yellow_s=1; green_s=0;
          for(i=0;i<50;i++){
          counter(count);
          }}
          }
          */
          void manual_mode(){
               if(green_s){
          for(count=3;count>=0;count--){
          red_w=0; yellow_w=0; green_w=1;
          yellow_s=1;green_s=0;
          for(i=0;i<50;i++){
          //counter(count);
       char left = count/10;
       char right=count%10;
       porta.b0=0;
        porta.b1=0;
       porta.b2=0;
       porta.b3=0;
       display_r=right;
       display_l=left;
       delay_ms(10);
          }}
          red_s=1; yellow_s=0;}
          else if(green_w){
          for(count=3;count>=0;count--){
          red_s=0; yellow_s=0; green_s=1;
          yellow_w=1; green_w=0;
          for(i=0;i<50;i++){
          //counter(count);
       char left = count/10;
       char right=count%10;
       porta.b0=0;
        porta.b1=0;
       porta.b2=0;
       porta.b3=0;
       display_r=right;
       display_l=left;
       delay_ms(10);
          }}
          red_w=1; yellow_w=0;}
          delay_ms(100);
          }
          
          void interrupt(){
          while(INTF_bit){
          display_r=0; display_l=0;
          delay_ms(500);
          if(!portb.b1){
            manual_mode();
          } if(portb.b0){ INTF_bit=0; }
          
          }
          }

void main() {
    adcon1=0x07;
    trisb.b0=1; //sw1
    trisb.b1=1; //sw2
    INTE_bit=1;
    GIE_bit=1;
    INTEDG_bit=0;
    Not_RBPU_bit=0;
    trisa.b0=0; porta.b0=1; //pnp0
    trisa.B1=0; porta.b1=1; //pnp1
    trisa.b2=0; porta.b2=1; //pnp2
    trisa.B3=0; porta.b3=1; //pnp3
    trisc=0; display_r=0;
    trisd=0; display_l=0; //7_seg
    trisb=0b00000011;
    red_w=0; yellow_w=0; green_w=0;
    red_s=0; yellow_s=0; green_s=0;
    delay_ms(100);
    while(1){ 
    for(;;){
    // automatic_mode:
          for(count=23;count>=4;count--){
          //portd=0b00001100;
          red_w=0; yellow_w=0; green_w=1;
          red_s=1; yellow_s=0; green_s=0;
          for(i=0;i<50;i++){
          counter(count);
          }}
          for(count=3;count>=0;count--){
          //portd=0b00001010;
          red_w=0; yellow_w=1; green_w=0;
          red_s=1; yellow_s=0; green_s=0;
          for(i=0;i<50;i++){
          counter(count);
          }}
          for(count=15;count>=4;count--){
          //portd=0b00100001;
          red_w=1; yellow_w=0; green_w=0;
          red_s=0; yellow_s=0; green_s=1;
          for(i=0;i<50;i++){
          counter(count);
          }}
          for(count=3;count>=0;count--){
          //portd=0b00010001;
          red_w=1; yellow_w=0; green_w=0;
          red_s=0; yellow_s=1; green_s=0;
          for(i=0;i<50;i++){
          counter(count);
          }}
          }
    }
    
    
}