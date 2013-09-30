	 .ORIG x3000		;loads at the specific register
LOOPER	 LEA R0, QUEST	 	;loads from address the prompt
	 PUTS			;outputs the question
	 GETC			;retrieves the input and places it into r1
	
	 ;to not alter the original value we make a copy of r0 into r2
	 ADD R2, R0, #0		;copy r0 into r2 without moving 
	 ADD R2, R2, #-16	;subtraction of ASCII value to get the integer form
	 ADD R2, R2, #-16	;could have used a possible loop to do this part
	 ADD R2, R2, #-16	;r2 contains the integer value of the input 

	 LEA R0, WEEK		;sets the address of the first day "sunday" into r0	 
	 ADD R3, R2, x-7	;sets R3 to see if it is a positive number
	 BRp INCORR
	 BRz INCORR

LOOP	 BRz DISPLAY
	 ADD R0, R0, #10	;goes to the next day
	 ADD R2, R2, #-1	;decrement the loop var
	 BR  LOOP		;loop branch to jump back up where loop begins

DISPLAY  PUTS			;anytime display is called in a branch
	 BR LOOPER

INCORR   LEA R0, INCOR		;loads the error into r0
	 PUTS			;outputs the error string from r0
	 BR STOP
 	 
STOP	 HALT			;halts the program

QUEST 	 .STRINGZ "\nPlease enter number: "
WEEK	 .STRINGZ "Sunday   "
	 .STRINGZ "Monday   "
	 .STRINGZ "Tuesday  "
	 .STRINGZ "Wednesday"
	 .STRINGZ "Thursday "
	 .STRINGZ "Friday   "
	 .STRINGZ "Saturday "
INCOR	 .STRINGZ "Incorrect input needs to be (0-6) only: "
	 .END