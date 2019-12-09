//3) Escreva um programa em Assembly que leia do teclado dois dígitos e imprima se
//o valor é Par ou Ímpar e informe o valor que foi dado na entrada de dados:

include emu8086.inc
org 100h

MOV AH, 1
INT 21h
SUB AL, 48d
MOV BL, 10d
MUL BL
MOV DL, AL

MOV AH, 1
INT 21h 
MOV DH, AL
SUB DH, 48d

ADD DL, DH    ;SALVA O NUMERO LIDO EM DL
MOV BL, 2d
MOV AL, DL
DIV BL
CMP AH, 0d
JE PAR

PRINT 10
PUTC 13
print "O NUMERO EH IMPAR."
PRINT 10
JMP ESC 

par: 
PRINT 10
PUTC 13
PRINT "O NUMERO EH PAR."
PRINT 10 

ESC:
PUTC 13 
PRINT "O NUMERO LIDO FOI: "


MOV AH, 0
MOV BL, 10d
MOV AL, DL
DIV BL
MOV DL, AL
MOV DH, AH
ADD DL, 48d
MOV AH, 2
INT 21h

MOV DL, DH
ADD DL, 48d
INT 21h
ret

