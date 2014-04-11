			; CSCI250 Assignment 5-1
			; Christopher Moore
			.ORIG	x3000
	
	LEA R0, x	; get the address of the variable
	ST R0, p	; store it in the pointer variable
	
	AND R1,R1,x00	; init R1 to 0
	ADD R1,R1,#5	; R1 = 5
	ST R1, x	; store R1 value into x
	
	LD R2, x	; load x from memory to register ( y = x )
	ST R2, y	; store x from register to memory

	AND R3,R3,x00	; init R3 to 0
	ADD R3,R3,#8	; R3 = 8
	STI R3, p	; store 8 at the address stored in p
			
	x		.BLKW 1
	y		.BLKW 1
	p		.BLKW 1
			.END