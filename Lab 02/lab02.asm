;Class:CSE 313 Machine Organization Lab
;Instructor: Taline Georgiou
;Term: Spring 2012
;Name(s): Cristobal Guerrero, Jose Padilla
;Lab#2: Arithmetic Functions
;Description: This program uses branches to determine the absolute value of a number 
;as well as determining its sign. By doing so it uses the branch operations that include
;n, z, and p. These branch conditions are for negative, zero and positive values. Using 
;branches it is demonstrated how they work by even placing branches at the bottom of the
;file before the actual HALT operation. This program uses branches to determine if a number
;absolute value was computed correctly which it is reflected in the output of the program.

	.ORIG x3000
	LDI R0, X		;R0 <- X(x3120)
	
	LDI R1, Y		;R1 <- Y(x3121)

	
	
	;Simple subtraction function
	
	NOT R3, R1		;Stores the value of R1 into R3
	ADD R3, R3, #1				
	ADD R3, R0, R3				
	STI R3, X_Y		;Stores indirectly into 	
	
	;Function for absolute value of x and stores it into R2
	ADD R2, R0, #0		;Stores R0 value into R2	
	BRzp ABS_X		;Branches to ABS_X if the number is 0 or positive		
	NOT R2, R2		;negates the value of R2
	ADD R2, R2, #1		;adding 1 gets the correct negative value	
ABS_X	STI R2, ABX		;ABS_X branch if called it will go here and return to previous line	

	;Absolute value function that stores into R4
	ADD R4, R1, #0		;Stores R1 value into R4	
	BRzp ABS_Y		;Branches to the ABS_Y branch			
	NOT R4, R4		;negates the value of R4
	ADD R4, R4, #1		;adding 1 gets the correct negative value
ABS_Y	STI R4, ABY		;ABS_Y branch if called it will go here and return to previous line
		
	;Subtraction from absolute x and y values and place into Z
	NOT R4, R4		;Nots the value of R4 into R4
	ADD R4, R4, #1	   	;Adds a 1 to the value of R4 for the correct positive val     
	ADD R5, R2, R4		;Adds the value of R2 and R4 and stores into R5	
	BRzp FORW		;branches to next if the value of R5 is zero or positive		
	AND R5, R5, x0000	;reset and clears R5 register	
	ADD R5, R5, #2		;sets the value of Z to positive 2	
	BRp ZVAL		;branch to SETZ if positive	

FORW	BRz ZVAL		;NEXT branch if called it will go here and return to previous line
	AND R5, R5, x0000	;resets register 5
	ADD R5, R5, #1		;adds 1 to R5	
	BRp ZVAL		;branch to SETZ if positive

ZVAL	STI R5, Z		;SETZ branch if called it will go here and return to previous line

	HALT		
X	.FILL x3120		;X
	
Y	.FILL x3121		;Y
	
X_Y	.FILL x3122		;X-Y

ABX	.FILL x3123		;|X|
	
ABY	.FILL x3124		;|Y|
	
Z	.FILL x3125		;Z
	
	.END





	