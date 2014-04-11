	; CSCI250 Assignment 6-1
	; Christopher Moore
	.ORIG x3200
	; begin subroutine code
	ADD R6, R6, #-1		; R6 <- location of return value for calling routine
	ADD R6, R6, #-1		; R6 <- location of return address of calling routine
	STR R7, R6, #0		; store return address (which is in R7)
	ADD R6, R6, #-1		; R6 <- location for calling routine's frame pointer
	STR R5, R6, #0		; store frame pointer (which is in R5)
	ADD R6, R6, #-1		; R6 <- location for saving R3's value
	STR R3, R6, #0		; save R3's value
	ADD R6, R6, #-1		; R6 <- location for saving R2's value
	STR R2, R6, #0		; save R2's value
	ADD R6, R6, #-1		; R6 <- location for saving R1's value
	STR R1, R6, #0		; save R1's value
	ADD R6, R6, #-1		; R6 <- location for saving R0's value
	STR R0, R6, #0		; save R0's value
	ADD R6, R6, #-1		; R6 <- location for local variable dVal
	ADD R5, R6, #0		; R5 <- frame pointer for calling routine's local variables
	LDR R0, R5, #8		; load value of AtoD's parameter into R0

	; start code for AtoD
	ADD R0, R0, #-15	; R0 = R0 - 15 (= aVal-48)
	ADD R0, R0, #-15	; R0 = R0 - 15
	ADD R0, R0, #-15	; R0 = R0 - 15
	ADD R0, R0, #-3		; R0 = R0 - 3
	STR R0, R5, #0		; dVal = (aVal-48)

	; prepare for AtoD to return
	STR R1, R5, #7		; write ret value (in R1) in ret value location

	; restore values of registers of calling routine
	ADD R6, R5, #1		; R6 <- location where R0 is saved
	LDR R0, R6, #0		; restore R0
	ADD R6, R6, #1		; R6 <- location where R1 is saved
	LDR R1, R6, #0		; restore R1
	ADD R6, R6, #1		; R6 <- location where R2 is saved
	LDR R2, R6, #0		; restore R2
	ADD R6, R6, #1		; R6 <- location where R3 is saved
	LDR R3, R6, #0		; restore R3
	ADD R6, R6, #1		; R6 <- location for calling routine's frame pointer
	LDR R5, R6, #0		; restore value of previous frame pointer
	ADD R6, R6, #1		; 
	LDR R7, R6, #0		; R7 has return value to calling routine
	ADD R6, R6, #1		; R6 now references location of return value
	RET			; return to calling routine
	.END