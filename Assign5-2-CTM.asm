			; CSCI250 Assignment 5-2
			; Christopher Moore
			.ORIG	x3000
	
	LEA R0, x	; get the address of the variable
	ST R0, p	; store it in the pointer variable
	
	LD R1, p	; load p from memory to register
	ST R1, q	; store p from register to memory

	AND R2,R2,x00	; init R2 to 0
	ADD R2,R2,#5	; R2 = 5
	ST R2, x	; store R2 value into x
	
	LDI R3, q	; load the value of the address q is pointing to from memory to register
	ST R3, y	; store the value from register to memory

	AND R4,R4,x00	; init R4 to 0
	ADD R4,R4,#8	; R4 = 8
	STI R4, p	; store 8 at the address stored in p
			
	x		.BLKW 1
	y		.BLKW 1
	p		.BLKW 1
	q		.BLKW 1
			.END