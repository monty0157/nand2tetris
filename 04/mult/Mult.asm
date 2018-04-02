// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Initialize product to 0
@R2
M = 0

// Check whether mulitplier is negative and execute correct loop accordingly
@R1
D = M

// Execute negative loop if R1 is negative (e.g. -2)
@LOOPNegative
D;JLT

// Execute positive loop if R1 is positive (e.g. +2)
@LOOPPositive
D;JGT

// End if R1 is 0 (since x * 2 = 0)
@END
D;JEQ


(LOOPPositive)
	// Get value at R2 and store it in register
	@R2
	D = M

	// Increment register value with value at R0
	@R0
	D = D + M

	// Assign the new value to R2
	@R2
	M = D

	// Decrement the value at R1 because we already multiplied once
	@R1
	M = M - 1
	D = M

	// If R1 ins't positive anymore, end the program
	@END
	D;JEQ
	D;JLT

	@LOOPPositive
	0;JMP


// Same as positive loop, but inverted
(LOOPNegative)
	@R2
	D = M

	@R0
	D = D - M

	@R2
	M = D

	@R1
	M = M + 1
	D = M

	@END
	D;JEQ
	D;JGT

	@LOOPNegative
	0;JMP

// End the program with an infitie loop
(END)
	@END
	0;JMP // Infinite loop