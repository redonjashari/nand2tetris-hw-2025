@R0
D=M
@R1
D=M
@R2
M=0
@END
D;JEQ
(LOOP)
    @R1
    D=M
    @END
    D;JEQ

    @R0
    D=M

    @R2
    M=D+M

    @R1
    M=M-1
    @LOOP
    0;JMP
(END)
@END
0;JMP


