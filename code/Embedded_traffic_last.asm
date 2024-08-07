
_counter:

;Embedded_traffic_last.c,12 :: 		void counter(signed char count){
;Embedded_traffic_last.c,13 :: 		char left = count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__counter+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;Embedded_traffic_last.c,15 :: 		porta.b0=0;
	BCF        PORTA+0, 0
;Embedded_traffic_last.c,16 :: 		porta.b1=0;
	BCF        PORTA+0, 1
;Embedded_traffic_last.c,17 :: 		porta.b2=0;
	BCF        PORTA+0, 2
;Embedded_traffic_last.c,18 :: 		porta.b3=0;
	BCF        PORTA+0, 3
;Embedded_traffic_last.c,19 :: 		display_r=right;
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;Embedded_traffic_last.c,20 :: 		display_l=left;
	MOVF       FLOC__counter+0, 0
	MOVWF      PORTD+0
;Embedded_traffic_last.c,21 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_counter0:
	DECFSZ     R13+0, 1
	GOTO       L_counter0
	DECFSZ     R12+0, 1
	GOTO       L_counter0
	NOP
;Embedded_traffic_last.c,22 :: 		}
L_end_counter:
	RETURN
; end of _counter

_manual_mode:

;Embedded_traffic_last.c,56 :: 		void manual_mode(){
;Embedded_traffic_last.c,57 :: 		if(green_s){
	BTFSS      PORTB+0, 7
	GOTO       L_manual_mode1
;Embedded_traffic_last.c,58 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_manual_mode2:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_manual_mode3
;Embedded_traffic_last.c,59 :: 		red_w=0; yellow_w=0; green_w=1;
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
	BSF        PORTB+0, 4
;Embedded_traffic_last.c,60 :: 		yellow_s=1;green_s=0;
	BSF        PORTB+0, 6
	BCF        PORTB+0, 7
;Embedded_traffic_last.c,61 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_manual_mode5:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_manual_mode6
;Embedded_traffic_last.c,63 :: 		char left = count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__manual_mode+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;Embedded_traffic_last.c,65 :: 		porta.b0=0;
	BCF        PORTA+0, 0
;Embedded_traffic_last.c,66 :: 		porta.b1=0;
	BCF        PORTA+0, 1
;Embedded_traffic_last.c,67 :: 		porta.b2=0;
	BCF        PORTA+0, 2
;Embedded_traffic_last.c,68 :: 		porta.b3=0;
	BCF        PORTA+0, 3
;Embedded_traffic_last.c,69 :: 		display_r=right;
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;Embedded_traffic_last.c,70 :: 		display_l=left;
	MOVF       FLOC__manual_mode+0, 0
	MOVWF      PORTD+0
;Embedded_traffic_last.c,71 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_manual_mode8:
	DECFSZ     R13+0, 1
	GOTO       L_manual_mode8
	DECFSZ     R12+0, 1
	GOTO       L_manual_mode8
	NOP
;Embedded_traffic_last.c,61 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;Embedded_traffic_last.c,72 :: 		}}
	GOTO       L_manual_mode5
L_manual_mode6:
;Embedded_traffic_last.c,58 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;Embedded_traffic_last.c,72 :: 		}}
	GOTO       L_manual_mode2
L_manual_mode3:
;Embedded_traffic_last.c,73 :: 		red_s=1; yellow_s=0;}
	BSF        PORTB+0, 5
	BCF        PORTB+0, 6
	GOTO       L_manual_mode9
L_manual_mode1:
;Embedded_traffic_last.c,74 :: 		else if(green_w){
	BTFSS      PORTB+0, 4
	GOTO       L_manual_mode10
;Embedded_traffic_last.c,75 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_manual_mode11:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_manual_mode12
;Embedded_traffic_last.c,76 :: 		red_s=0; yellow_s=0; green_s=1;
	BCF        PORTB+0, 5
	BCF        PORTB+0, 6
	BSF        PORTB+0, 7
;Embedded_traffic_last.c,77 :: 		yellow_w=1; green_w=0;
	BSF        PORTB+0, 3
	BCF        PORTB+0, 4
;Embedded_traffic_last.c,78 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_manual_mode14:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_manual_mode15
;Embedded_traffic_last.c,80 :: 		char left = count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__manual_mode+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;Embedded_traffic_last.c,82 :: 		porta.b0=0;
	BCF        PORTA+0, 0
;Embedded_traffic_last.c,83 :: 		porta.b1=0;
	BCF        PORTA+0, 1
;Embedded_traffic_last.c,84 :: 		porta.b2=0;
	BCF        PORTA+0, 2
;Embedded_traffic_last.c,85 :: 		porta.b3=0;
	BCF        PORTA+0, 3
;Embedded_traffic_last.c,86 :: 		display_r=right;
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;Embedded_traffic_last.c,87 :: 		display_l=left;
	MOVF       FLOC__manual_mode+0, 0
	MOVWF      PORTD+0
;Embedded_traffic_last.c,88 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_manual_mode17:
	DECFSZ     R13+0, 1
	GOTO       L_manual_mode17
	DECFSZ     R12+0, 1
	GOTO       L_manual_mode17
	NOP
;Embedded_traffic_last.c,78 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;Embedded_traffic_last.c,89 :: 		}}
	GOTO       L_manual_mode14
L_manual_mode15:
;Embedded_traffic_last.c,75 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;Embedded_traffic_last.c,89 :: 		}}
	GOTO       L_manual_mode11
L_manual_mode12:
;Embedded_traffic_last.c,90 :: 		red_w=1; yellow_w=0;}
	BSF        PORTB+0, 2
	BCF        PORTB+0, 3
L_manual_mode10:
L_manual_mode9:
;Embedded_traffic_last.c,91 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_manual_mode18:
	DECFSZ     R13+0, 1
	GOTO       L_manual_mode18
	DECFSZ     R12+0, 1
	GOTO       L_manual_mode18
	DECFSZ     R11+0, 1
	GOTO       L_manual_mode18
	NOP
;Embedded_traffic_last.c,92 :: 		}
L_end_manual_mode:
	RETURN
; end of _manual_mode

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Embedded_traffic_last.c,94 :: 		void interrupt(){
;Embedded_traffic_last.c,95 :: 		while(INTF_bit){
L_interrupt19:
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt20
;Embedded_traffic_last.c,96 :: 		display_r=0; display_l=0;
	CLRF       PORTC+0
	CLRF       PORTD+0
;Embedded_traffic_last.c,97 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_interrupt21:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt21
	DECFSZ     R12+0, 1
	GOTO       L_interrupt21
	DECFSZ     R11+0, 1
	GOTO       L_interrupt21
	NOP
	NOP
;Embedded_traffic_last.c,98 :: 		if(!portb.b1){
	BTFSC      PORTB+0, 1
	GOTO       L_interrupt22
;Embedded_traffic_last.c,99 :: 		manual_mode();
	CALL       _manual_mode+0
;Embedded_traffic_last.c,100 :: 		} if(portb.b0){ INTF_bit=0; }
L_interrupt22:
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt23
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
L_interrupt23:
;Embedded_traffic_last.c,102 :: 		}
	GOTO       L_interrupt19
L_interrupt20:
;Embedded_traffic_last.c,103 :: 		}
L_end_interrupt:
L__interrupt57:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Embedded_traffic_last.c,105 :: 		void main() {
;Embedded_traffic_last.c,106 :: 		adcon1=0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;Embedded_traffic_last.c,107 :: 		trisb.b0=1; //sw1
	BSF        TRISB+0, 0
;Embedded_traffic_last.c,108 :: 		trisb.b1=1; //sw2
	BSF        TRISB+0, 1
;Embedded_traffic_last.c,109 :: 		INTE_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;Embedded_traffic_last.c,110 :: 		GIE_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Embedded_traffic_last.c,111 :: 		INTEDG_bit=0;
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;Embedded_traffic_last.c,112 :: 		Not_RBPU_bit=0;
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;Embedded_traffic_last.c,113 :: 		trisa.b0=0; porta.b0=1; //pnp0
	BCF        TRISA+0, 0
	BSF        PORTA+0, 0
;Embedded_traffic_last.c,114 :: 		trisa.B1=0; porta.b1=1; //pnp1
	BCF        TRISA+0, 1
	BSF        PORTA+0, 1
;Embedded_traffic_last.c,115 :: 		trisa.b2=0; porta.b2=1; //pnp2
	BCF        TRISA+0, 2
	BSF        PORTA+0, 2
;Embedded_traffic_last.c,116 :: 		trisa.B3=0; porta.b3=1; //pnp3
	BCF        TRISA+0, 3
	BSF        PORTA+0, 3
;Embedded_traffic_last.c,117 :: 		trisc=0; display_r=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;Embedded_traffic_last.c,118 :: 		trisd=0; display_l=0; //7_seg
	CLRF       TRISD+0
	CLRF       PORTD+0
;Embedded_traffic_last.c,119 :: 		trisb=0b00000011;
	MOVLW      3
	MOVWF      TRISB+0
;Embedded_traffic_last.c,120 :: 		red_w=0; yellow_w=0; green_w=0;
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 4
;Embedded_traffic_last.c,121 :: 		red_s=0; yellow_s=0; green_s=0;
	BCF        PORTB+0, 5
	BCF        PORTB+0, 6
	BCF        PORTB+0, 7
;Embedded_traffic_last.c,122 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
;Embedded_traffic_last.c,124 :: 		for(;;){
L_main27:
;Embedded_traffic_last.c,126 :: 		for(count=23;count>=4;count--){
	MOVLW      23
	MOVWF      _count+0
L_main30:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main31
;Embedded_traffic_last.c,128 :: 		red_w=0; yellow_w=0; green_w=1;
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
	BSF        PORTB+0, 4
;Embedded_traffic_last.c,129 :: 		red_s=1; yellow_s=0; green_s=0;
	BSF        PORTB+0, 5
	BCF        PORTB+0, 6
	BCF        PORTB+0, 7
;Embedded_traffic_last.c,130 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_main33:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main34
;Embedded_traffic_last.c,131 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;Embedded_traffic_last.c,130 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;Embedded_traffic_last.c,132 :: 		}}
	GOTO       L_main33
L_main34:
;Embedded_traffic_last.c,126 :: 		for(count=23;count>=4;count--){
	DECF       _count+0, 1
;Embedded_traffic_last.c,132 :: 		}}
	GOTO       L_main30
L_main31:
;Embedded_traffic_last.c,133 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_main36:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main37
;Embedded_traffic_last.c,135 :: 		red_w=0; yellow_w=1; green_w=0;
	BCF        PORTB+0, 2
	BSF        PORTB+0, 3
	BCF        PORTB+0, 4
;Embedded_traffic_last.c,136 :: 		red_s=1; yellow_s=0; green_s=0;
	BSF        PORTB+0, 5
	BCF        PORTB+0, 6
	BCF        PORTB+0, 7
;Embedded_traffic_last.c,137 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_main39:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main40
;Embedded_traffic_last.c,138 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;Embedded_traffic_last.c,137 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;Embedded_traffic_last.c,139 :: 		}}
	GOTO       L_main39
L_main40:
;Embedded_traffic_last.c,133 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;Embedded_traffic_last.c,139 :: 		}}
	GOTO       L_main36
L_main37:
;Embedded_traffic_last.c,140 :: 		for(count=15;count>=4;count--){
	MOVLW      15
	MOVWF      _count+0
L_main42:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main43
;Embedded_traffic_last.c,142 :: 		red_w=1; yellow_w=0; green_w=0;
	BSF        PORTB+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 4
;Embedded_traffic_last.c,143 :: 		red_s=0; yellow_s=0; green_s=1;
	BCF        PORTB+0, 5
	BCF        PORTB+0, 6
	BSF        PORTB+0, 7
;Embedded_traffic_last.c,144 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_main45:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main46
;Embedded_traffic_last.c,145 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;Embedded_traffic_last.c,144 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;Embedded_traffic_last.c,146 :: 		}}
	GOTO       L_main45
L_main46:
;Embedded_traffic_last.c,140 :: 		for(count=15;count>=4;count--){
	DECF       _count+0, 1
;Embedded_traffic_last.c,146 :: 		}}
	GOTO       L_main42
L_main43:
;Embedded_traffic_last.c,147 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_main48:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main49
;Embedded_traffic_last.c,149 :: 		red_w=1; yellow_w=0; green_w=0;
	BSF        PORTB+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 4
;Embedded_traffic_last.c,150 :: 		red_s=0; yellow_s=1; green_s=0;
	BCF        PORTB+0, 5
	BSF        PORTB+0, 6
	BCF        PORTB+0, 7
;Embedded_traffic_last.c,151 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_main51:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main52
;Embedded_traffic_last.c,152 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;Embedded_traffic_last.c,151 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;Embedded_traffic_last.c,153 :: 		}}
	GOTO       L_main51
L_main52:
;Embedded_traffic_last.c,147 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;Embedded_traffic_last.c,153 :: 		}}
	GOTO       L_main48
L_main49:
;Embedded_traffic_last.c,154 :: 		}
	GOTO       L_main27
;Embedded_traffic_last.c,158 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
