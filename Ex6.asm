6) Escreva um programa em Assembly que leia do teclado um número de dois dígitos
e imprima uma das mensagens: “é múltiplo de 3” ou “não é múltiplo de 3” :

include 'emu8086.inc' 
org 100h
MOV AH, 1
INT 21h
SUB AL, 48d
MOV BL, 10d
MUL BL
MOV DL, AL

MOV AH, 1
INT 21h
SUB AL, 48d
ADD AL, DL          
MOV AH, 0d

MOV BL, 3d
DIV BL
CMP AH, 0d
JE MULT_3

PRINT 10
PUTC 13
PRINT "O NUMERO NAO E MULTIPLO DE 3" 
JMP EXIT

MULT_3:
PRINT 10
PUTC 13
PRINT "O NUMERO EH MULTIPLO DE 3"

EXIT:
ret

