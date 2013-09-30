;Class:CSE 313 Machine Organization Lab
;Instructor: Taline Georgiou
;Term: Spring 2012
;Name(s): Cristobal Guerrero
;Lab#1: ALU Operations
;Description: This program does very basic instructions ALU Operations. Such operations consist
;of AND, ADD, and NOT. The OR operation had to be constructed using NOT and AND ALU Operations.
;The first block of the program loads the values from data1.asm file which the initial values 
;are x = 9 and y = -13. The following block adds x and y and stores it into the the address +2 
;of the original value. The next block of code does the AND operation and NOT to do an OR operation.
;Finally we take the value and NOT-ing them and storing them into different address'.

	.ORIG x3000

	LEA	R0, xFF		;R0 has memory location of other file
	LDR	R1, R0, x0	;R1 is loaded with R0 address +0 which is what X was 3100
	LDR	R2, R0, x1	;R2 is loaded with R0 address +1 which is what Y was 3101

	ADD	R3, R1, R2	;Add R1 and R2 val into R3
	STR	R3, R0, x2	;Store R3 into R0 address +2 x3102

	AND	R4, R1, R2	;and operation into storage location R4
	STR	R4, R0, x3	;Stores R4 into address of R0 +3 which is x3103

	NOT 	R3, R1 		;R3   NOT(R1 )
 	NOT 	R4, R2 		;R4   NOT(R2 )
 	AND 	R5, R3 ,R4 	;R5   NOT(R1 ) AND NOT(R2 )
 	NOT 	R5, R5 		;R5   R1 OR R2
	STR	R5, R0, x4	;Store R5 value into R0 address +4 which is x3104

	
	NOT 	R3, R1 		;R3   NOT(R1 )
	STR	R3, R0, x5	;Store R3 value into R0 address +5 which is x3105

	NOT 	R4, R2 		;R4   NOT(R2 )
	STR	R4, R0, x6	;Store R4 value into R0 address +6 which is x3106

	ADD	R3, R1, x3	;Add 3 to R1(X) and store it in R3
	STR	R3, R0, x7	;Store R3 value into R0 address +7 which is x3107

	ADD	R3, R2, x-3	;Add -3 to R1(X) and store it in R3
	STR	R3, R0, x8	;Store R3 value into R0 address +8 which is x3108

	AND	R3, R1, x0001	;And value R1 and store into R3
	STR	R3, R0, x9	;Store R3 value into R0 address +9 which is x3109

	HALT
	.END
	