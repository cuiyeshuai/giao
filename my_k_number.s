;set DDRB to 0x1f, so pin D12 will output 5th bit of binary number.
;a wire is attached to D12 
;a pair of led and resisitor is added to the circuit just like previous 4 pairs in lab 4.

;  specify labels

.equ SREG ,0x3f
.equ DDRB, 0x04
.equ PORTB, 0x05

; start address
.org 0


main: 	ldi r16, 0      	;set r16 = 0
	out SREG, r16	;set SREG = 0
	
	ldi r16, 0x1f	
	out DDRB, r16	;set pin 1-5 in PORTB output mode
	
	ldi r16, 0x01	;output 1 by led
	out PORTB, r16	
	call delay		;subroutine
		
	ldi r16, 0x09	;output 9 by led
	out PORTB, r16	
	call delay
	
	ldi r16, 0x01	;output 1 by led
	out PORTB, r16	
	call delay
	
	ldi r16, 0x00	;output 0 by led
	out PORTB, r16
	call delay
	
	ldi r16, 0x06	;output 6 by led
	out PORTB, r16
	call delay

	ldi r16, 0x03	;output 3 by led
	out PORTB, r16
	call delay
	
	ldi r16, 0x09	;output 9 by led
	out PORTB, r16
	call delay

	ldi r16, 0x19	;output Y by led
	out PORTB, r16
	call delay
	
	ldi r16, 0x1b	;output . by led
	out PORTB, r16
	call delay
	
	ldi r16, 0x03	;output C by led
	out PORTB, r16
	call delay
	
	ldi r16,0x00	;a longer break that let led off
	out PORTB, r16
	ldi r17, 0xff
	ldi r18, 0xff
	ldi r19, 0x3f
	dec r17
	brne loop
	dec r18
	brne loop
	dec r19
	brne loop	

delay:		ldi r17, 0xff
		ldi r18, 0xff
		ldi r19, 0x1f
	loop:	dec r17
		brne loop
		dec r18
		brne loop
		dec r19
		brne loop
		ret
 ;let led display the information for another loop
rjmp main



    










