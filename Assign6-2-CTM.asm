	; CSCI250 Assignment 6-2
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
	ADD R6, R6, #-1		; R6 <- location for local variable maxVal
	ADD R5, R6, #0		; R5 <- frame pointer for calling routine's local variables
	LDR R0, R5, #8		; load address of A to R0
	LDR R1, R5, #9		; load value of N to R1

	; start code for max
	AND R2, R2, x00		; R2 <- 0
	ADD R2, R1, #0		; prep for test of N = 0
	BRp NOK			; if (n > 0), branch to NOK
	LD R6, EXIT		; return x8000
	BRnzp RETVAL		; if (n = 0), branch to RETVAL
NOK	AND R2, R2, x00		; R2 <- 0
LOOP	ADD R1, R1, #-1		; R1 <- (n - 1)
	BRn RETVAL		; if (n < 0), branch to RETVAL
	ADD R0, R1, R0		; R0 <- address of A[n-1]
	LDR R3, R0, #0		; R3 <- value of A[n-1]
	NOT R3, R3		; 2's comp -R3
	ADD R3, R3, #1		; 2's comp -R3
	ADD R3, R2, R3		; R3 <- A[n-1] - maxVal
	BRp LOOP		; if (A[n-1] - max > 0), branch to LOOP
	LDR R2, R0, #0		; R2 <- A[n-1]
	BRnzp LOOP		; branch to LOOP

	; prepare for max to return
RETVAL	STR R2, R6, #0		; write ret value (in R2) in ret value location

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
EXIT	.FILL x8000
	.END