// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Init the counter with screen memory map size
@INIT
0;JMP

// Initialize a loop
(LOOP)
	// Decrement counter
	@i
	M = M - 1
	D = M

	// Re-init if counter is less than 0
	@INIT
	D;JLT

	// Get register at Screen address + counter (e.g. 16834 + 8191 = 24575)
	@SCREEN
	D = D + A

	// Asign this register number to address variable
	@address
	M = D

	// Get keyboard value
	@KBD
	D = M

	// If keyboard is pressed, blacken screen
	@BlackenScreen
	D;JGT

	// Else whiten screen
	@WhitenScreen
	D;JEQ

// Function to blacken screen
(BlackenScreen)
	// Get the address value we stored at var address (e.g. 24575) and set it to -1
	@address
	A = M
	M = -1

	// Continue with the loop
	@LOOP
	0;JMP

// Function to whiten screen
(WhitenScreen)
	// Get the address value we stored at var address (e.g. 24575) and set it to 0
	@address
	A = M
	M = 0

	// Continue with the loop
	@LOOP
	0;JMP

// Init "i" variable with screen memory map size + 1 and start loop
(INIT)
	@8192
	D = A

	@i
	M = D

	@LOOP
	0;JMP