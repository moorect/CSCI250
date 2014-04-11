			; CSCI250 Assignment 5-3
			; Christopher Moore
			.ORIG	x3000
	
	LEA R0, ptr	; get the address of the variable
	ST R0, ind	; store it in the pointer variable
	
	LEA R1, apple	; get the address of apple from memory to register
	ST R1, ind	; store apple at the address stored in ind

	LDI R2, ind	; load the value of the address ind is pointing to from memory to register
	ST R2, temp	; store the value from register to memory
	AND R3,R3,x00	; init R3 to 0
	ADD R3,R3,#12	; R3 = 12
	STI R3, temp	; store 12 at the address stored in temp
			
	apple		.BLKW 1
	ptr		.BLKW 1
	ind		.BLKW 1
	temp		.BLKW 1
			.END