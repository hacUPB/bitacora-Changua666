(LOOP)
@KBD
D=M
@100
D=D-A
@DRAW
D;JEQ
@LOOP
0;JMP
(DRAW)
@SCREEN
D=A
@addr
M=D
@4
D=A
@rows
M=D
(ROW_LOOP)
@15
D=A
@addr
A=M
M=D
@addr
D=M
@32
D=D+A
@addr
M=D
@rows
MD=M-1
@ROW_LOOP
D;JGT
@LOOP
0;JMP