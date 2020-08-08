.equ SREG, 0x3f
.equ DDRB, 0x04
.equ PORTB, 0x05
.org 0

main:	ldi r16, 0x00
	out SREG, r16	;clear SREG
	ldi r16, 0x01	
	out DDRB, r16	;set pin D8 to output mode
	ldi r20, 0x01	;r20 is used to record loop number 
	
mainloop:	call check2	
	call check5	
	inc r20		;increment loop number
	cpi r20, 0x33	;check if have finished 50 times
	brne mainloop	;run this mainloop again
	rjmp finish	;finish the porgram

check2: 	mov r21, r20	;copy data in r20 to r21
	cpi r21, 0x02	;check if r21 is greater than 2
	brlo test2		
	rjmp sub2		

sub2: 	subi r21, 0x02	;subtract 2 until r21 is lower than 2
	cpi r21, 0x02
	brsh sub2
	rjmp test2	

test2:	cpi r21, 0x00	;whether the the result is 0 or 1
	breq reverse	;even, reverse order
	rjmp normal	;odd, normal order
	
check5:	mov r21, r20	;copy data in r20 to r21
	cpi r21, 0x05	;check if r21 is greater than 5
	brlo test5
	rjmp sub5

sub5:	subi r21, 0x05	;subtract 5 until r21 is lower than 5
	cpi r21, 0x05
	brsh sub5
	rjmp test5

test5:	cpi r21,0x00	;whether the result is 0
	breq append5	;append 5 after when divisible by 5
	ret		;return to mainloop

normal:	call letter_y	;display the normal order
	call letter_e
	call letter_s
	ret		;return to mainloop

reverse: 	call letter_s	;display the reverse order
	call letter_e
	call letter_y
	ret		;return to mainloop

append5:	call dot		;display 5
	call break_s	
	call dot
	call break_s	
	call dot
	call break_s
	call dot	
	call break_s	
	call dot
	call break_l	
	ret		;return to mainloop

letter_y:	call slash		
	call break_s	
	call dot
	call break_s
	call slash
	call break_s	
	call slash
	call break_l
	ret	

letter_e:	call dot
	call break_l
	ret	
	
letter_s:	call dot
	call break_s	
	call dot
	call break_s	
	call dot
	call break_l
	ret
	
dot:	ldi r16, 0x01	;short light
	out PORTB, r16
	call delay1
	ret

slash:	ldi r16, 0x01	;long light
	out PORTB, r16
	call delay2
	ret

break_s: 	ldi r16, 0x00	;short break
	out PORTB, r16
	call delay1
	ret

break_l: 	ldi r16, 0x00	;long break
	out PORTB, r16
	call delay2
	ret

delay1:	ldi r17, 0xfd	;200ms delay
	ldi r18, 0xfd
	ldi r19, 0x0a
	loop:	nop
		dec r17
		cpi r17, 0
		brne loop
		ldi r17,0xfd
		dec r18
		cpi r18, 0
		brne loop
		ldi r18, 0xfd
		dec r19
		cpi r19, 0
		brne loop
		ret

delay2:	ldi r17, 0xfd	;600ms delay
	ldi r18, 0xfd
	ldi r19, 0x1e
	loop1:	nop
		dec r17
		cpi r17, 0
		brne loop1
		ldi r17,0xfd
		dec r18
		cpi r18, 0
		brne loop1
		ldi r18, 0xfd
		dec r19
		cpi r19, 0
		brne loop1
		ret

finish: 	rjmp finish	;finish the program



