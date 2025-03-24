//infinite loop checking the keyboard:
(LOOP)
    @24576      //Keyboard Address
    D=M
    @FILLBLACK
    D;JNE       //if D != 0 jump to FILLBLACK
    @FILLWHITE
    0;JMP       //else jump to FILL_WHITE

//  FILLBLACK fills the entire screen with 0xFFFF
(FILLBLACK)
    //initialize R13 to SCREEN start (16384)
    @16384
    D=A
    @R13
    M=D

    //initialize R14 to SCREEN end (24576)
    @24576
    D=A
    @R14
    M=D

(LOOP_BLACK)
    //clause to check if R13 == R14
    @R13
    D=M        
    @R14
    D=D-M       //D = R13 - R14
    @DONEBLACK
    D;JEQ       //if R13 == R14, we're done filling

    //otherwise, write -1 (black) at RAM[R13]
    @R13
    A=M        
    M=-1       

    //increment R13
    @R13
    M=M+1
    @LOOP_BLACK
    0;JMP      

(DONEBLACK)
    @LOOP
    0;JMP

//FILLWHITE fills the entire screen with white
(FILLWHITE)
    
    @16384
    D=A
    @R13
    M=D

    @24576
    D=A
    @R14
    M=D

(LOOP_WHITE)
    //check if R13 == R14
    @R13
    D=M
    @R14
    D=D-M
    @DONEWHITE
    D;JEQ

    //write 0 (white) at RAM[R13]
    @R13
    A=M
    M=0         //white pixels

    //increment R13
    @R13
    M=M+1
    @LOOP_WHITE
    0;JMP

(DONEWHITE)
    @LOOP
    0;JMP
