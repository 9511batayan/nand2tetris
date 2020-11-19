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

(LOOP)
    //Keyboard input
    @keyboard
    D=M

    //Jump to ON if pressed
    @ON
    D;JGT

    //If no pressed, set R0 to 0(0(0b0000000000000000)
    @R0
    M=0

    //Jump to FILL
    @FILL
    0;JMP

(ON)
    //Set R0 to -1(0b1111111111111111)
    @R0
    M=-1

(FILL)
    //Initialize the drawing start position (lower right of the screen) and go to R1
    @SCREEN
    D=A
    @8191   //8192 = (512 / 16) * 256 - 1
    D=D+A
    @R1
    M=0

    (FILLLOOP)
        //Value to draw
        @R0
        D=M

        //Draw on R1
        @R1
        A=M //Set the drawing position address in the A register
        M=0

        //Decrement the address of the drawing position
        @R1
        MD=M-1

        //Jump to FILLLOOP until you reach the top left of the screen
        @SCREEN
        D=D-A
        @FILLLOOP
        D;JGE

@LOOP
0;JMP