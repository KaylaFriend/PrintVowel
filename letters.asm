;------------------------------------------------------------------------------
;START OF MAIN - This is like main in a Java program.
;                The program will start here.
;                Main should mostly call subroutines.
;------------------------------------------------------------------------------

	;Main portion for submitting part 1 with GETLC.
	;Change this for parts 2, 3, and 4 as specified in the assignment document.
    .orig x3000
	JSR PRINTVOWELS
	HALT

	; .orig 0x3000
; LEA R0, MYSTR
 ; JSR GETSTRING ;Get a string from the user. Note this only works if you finished GETSTRING
 ; LD R0, NEWLINE
 ; OUT ; Print a newline.
 ; LEA R0, MYSTR
 ; JSR PRINTVOWELS ;Print replacing the non-vowels with underscores.
 ; LD R0, NEWLINE
 ; OUT ; Print a newline.
 ; LEA R0, MYSTR
 ; JSR GETSTRING ;Get a second string from the user.
 ; LD R0, NEWLINE
 ; OUT ; Print a newline.
 ; LEA R0, MYSTR
 ; JSR PRINTVOWELS ;Print second string replacing the non-vowels with underscores.
 ; LD R0, NEWLINE
 ; OUT ; Print a newline.
 ; HALT
; NEWLINE .fill 10
; BLOCK1 .blkw 100
; MYSTR .stringz "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
; BLOCK2 .blkw 200

;Storage for MAIN (if needed)
;Use this area for .fill, .stringz, .blkw, or anything that you need stored.
;This area should ONLY be used for labels in MAIN.  Any other data, for 
;subroutines for example, should be saved WITH the subroutine below.

;------------------------------------------------------------------------------
;END OF MAIN
;------------------------------------------------------------------------------        
    
;------------------------------------------------------------------------------
;Subroutines below this line.
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
;START OF NEW SUBROUTINE
;GETLC - Get and print a single lowercase letter. 
;------------------------------------------------------------------------------
GETLC	

	;Save ALL registers that you change except for return Registers.
	ST R7, GL_R7	;Save R7 as an example.  Using GETC forces you to save R7.
	ST R1, GL_R1
	
	;.... PUT YOUR CODE HERE ....
GLC_TOP
	GETC
	ADD R1,R0,#-10
	BRZ GLC_DONE
	LD R1,GLC_a
	ADD R1,R0, R1
	BRN GLC_TOP
	LD R1,GLC_z
	ADD R1,R0,R1
	BRP GLC_TOP
	OUT
GLC_DONE
	;Restore registers you used.
	LD R7,GL_R7	;Restore R7
	LD R1,GL_R1	;Restore R1
	
	
	RET ;This subroutine should ONLY have one return here.

;Storage for GETLC.  
;All .fill, .stringz, .blkw labels used in this subroutine should go here.
GL_R7	.fill 0		;Storage location for R7 in GETLC
GL_R1	.fill 0
GLC_a	.fill #-97
GLC_z	.fill #-122
;------------------------------------------------------------------------------
;END OF GETLC
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
;START OF NEW SUBROUTINE
;GETLETTER - Get and print a single lowercase or uppercase character or a space. 
;------------------------------------------------------------------------------
GETLETTER	
	;Save ALL registers that you change except for return Registers.
	ST R1, GLE_R1	;Save R1 as an example.
	ST R7, GLE_R7


	;.... PUT YOUR CODE HERE ....
GLE_TOP	
	GETC
	ADD R1,R0,#-10	;return 10 if newline character
	BRZ GLE_DONE
	LD R1,GLE_S
	;space
	ADD R1,R0,R1
	BRZ GLE_PRINT
	;lowercase character
	LD R1,GLE_a
	ADD R1,R0,R1
	BRN GLE_UP
	LD R1,GLE_z
	ADD R1,R0,R1
	BRNZ GLE_PRINT
	;uppercase character
GLE_UP
	LD R1,GLE_A
	ADD R1,R0, R1
	BRN GLE_TOP
	LD R1,GLE_Z
	ADD R1,R0,R1
	BRP GLE_TOP
GLE_PRINT
	OUT
GLE_DONE

	LD R1, GLE_R1	;Restore R1 
	LD R7, GLE_R7
	
	RET ;This subroutine should ONLY have one return here.

;Storage for GETLETTER.  
;All .fill, .stringz, .blkw labels used in this subroutine should go here.
GLE_R1	.fill 0		;Storage location for R1 in GETLETTER
GLE_R7	.fill 0
GLE_a	.fill #-97
GLE_z	.fill #-122
GLE_A	.fill #-65
GLE_Z	.fill #-90
GLE_S	.fill #-32
;------------------------------------------------------------------------------
;END OF GETLETTER
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
;START OF NEW SUBROUTINE
;GETSTRING - Input a null terminated string and store in memory.
;------------------------------------------------------------------------------
GETSTRING	
	;Save ALL registers that you change except for return Registers.
	ST R0, GS_R0
	ST R1, GS_R1	;Save R1 as an example.	
	ST R2, GS_R2
	ST R3, GS_R3
	ST R7, GS_R7
	;.... PUT YOUR CODE HERE ....
	ADD R1, R0, #0
GS_TOP
	JSR GETLETTER
	;if newline(BR GR_DONE)
	ADD R2, R0, #-10
	BRZ GS_NEW
	;store and increment memory location
	STR R0, R1, #0
	ADD R1, R1, #1
	BRNZP GS_TOP
GS_NEW
	LD R3, GS_NULL
	STR R3, R1, #0
	ADD R1, R1, #1
GS_DONE
	;Registers registers you used.
	LD R0, GS_R0
	LD R1, GS_R1	;Restore R1
	LD R2, GS_R2
	LD R3, GS_R3
	LD R7, GS_R7
	RET ;This subroutine should ONLY have one return here.

	
;Storage for GETSTRING.
;All .fill, .stringz, .blkw labels used in this subroutine should go here.
GS_R0	.fill 0
GS_R1	.fill 0		;Storage location for R1 in GETSTRING
GS_R2   .fill 0
GS_R3	.fill 0
GS_R7	.fill 0
GS_NULL .fill 0
;------------------------------------------------------------------------------
;END OF GETSTRING
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
;START OF NEW SUBROUTINE
;PRINTVOWELS - Input a null terminated string and store in memory.
;------------------------------------------------------------------------------
PRINTVOWELS	
	;Save ALL registers that you change except for return Registers.
	ST R0, PV_R0
	ST R1, PV_R1	;Save R1 as an example.
	ST R2, PV_R2
	ST R3, PV_R3
	ST R7, PV_R7

	ADD R1, R0, #0 ;move address to R1
	JSR GETSTRING
PV_TOP
	LDR R0, R1, #0 ;load character into R0
	
	ADD R2, R0, #0 ;check for null
	BRZ PV_DONE
	
	ADD R2, R0, #-10
	BRZ PV_DONE ;newline prints nothing, go to end
	LD R3, PV_OFFSET ;load R3 with -32
	
	;check if A or a
	LD R2,PV_A
	ADD R2,R0,R2
	BRZ PV_PRINT
	ADD R2, R2, R3
	BRZ PV_PRINT
	
	;check if E or e
	LD R2,PV_E
	ADD R2,R0,R2
	BRZ PV_PRINT
	ADD R2, R2, R3
	BRZ PV_PRINT
	
	;check if I or i
	LD R2,PV_I
	ADD R2,R0,R2
	BRZ PV_PRINT
	ADD R2, R2, R3
	BRZ PV_PRINT
	
	;check if O or o
	LD R2,PV_O
	ADD R2,R0,R2
	BRZ PV_PRINT
	ADD R2, R2, R3
	BRZ PV_PRINT
	
	;check if U or u
	LD R2,PV_U
	ADD R2,R0,R2
	BRZ PV_PRINT
	ADD R2, R2, R3
	BRZ PV_PRINT
	
	;store underscore if not vowels
	LD R0, PV_UNDERSCORE
PV_PRINT
	OUT
	ADD R1, R1, #1
	BRNZP PV_TOP
PV_DONE
	;Registers registers you used.
	LD R0, PV_R0
	LD R1, PV_R1	
	LD R2, PV_R2
	LD R3, PV_R3
	LD R7, PV_R7
	
	RET ;This subroutine should ONLY have one return here.

	
;Storage for PRINTVOWELS.
;All .fill, .stringz, .blkw labels used in this subroutine should go here.

;PV_vowels here
PV_A	.fill #-65
PV_E	.fill #-69
PV_I	.fill #-73
PV_O	.fill #-79
PV_U	.fill #-85

PV_UNDERSCORE .fill #95
PV_OFFSET .fill #-32

PV_R0	.fill 0
PV_R1	.fill 0		;Storage location for R1 in PRINTVOWELS
PV_R2	.fill 0
PV_R3	.fill 0
PV_R7	.fill 0
;------------------------------------------------------------------------------
;END OF PRINTVOWELS
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
;END OF ASSEMBLY FILE
;------------------------------------------------------------------------------
.end 