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

//writing in screen
//RAM[16384 + r*32 + c/16]
//bit= c%16
//256 rows x 32 columns


//RAM[16384 + (256*32)]

//start at address 16384
//evaluate RAM[A]=-1
//end at address 24576

(START)
        @16384
	D=A
	@w	//keep track of the address
	M=D
(KEYBOARD)
	@24576
	D=M
	@BLACK_FILL
	D; JGT
	@WHITE_FILL
	D; JEQ
	@KEYBOARD
	0; JMP

(WHITE_FILL)
	@w
	A=M
	M=0
	@w
        M=M+1
		
	D=M
	@24575
	D=A-D
	@START
	D;JEQ

	@KEYBOARD
	0; JMP

(BLACK_FILL)
	@w
	A=M
	M=-1
	@w
        M=M+1		
	
	D=M
	@24575
	D=A-D
	@START
	D;JEQ

	@KEYBOARD
	0; JMP

(END)
	@END
	0;JMP
	



