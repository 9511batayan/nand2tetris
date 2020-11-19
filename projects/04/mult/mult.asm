// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    @R1
    D=M
    @R2
    M=0     // R2 = 0 <-- initialize
    @END
    D;JLE   // If R1<=0 Then Jump to (END)
(LOOP)
    @R0
    D=M
    @R2
    M=M+D   // R2 = R2 + R0
    @R1
    D=D-1   // R1 = R1 - 1
    @LOOP
    0;JLT   // If R1>0 Then Jump to (LOOP)
(END)
    @END
    0;JMP   // Infinite loop terminates Hack program.