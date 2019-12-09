//4) Escreva um programa em Assembly que imprima todos os números inteiros de 01
//a 99 (em ordem crescente):

include 'emu8086.inc' 
org 100h

mov cl, 99d
MOV BL, 10d
cont:

add BH, 1
MOV AL, BH
MOV AH, 0
DIV BL
MOV DL, AL
MOV DH, AH
ADD DL, 48
MOV AH, 2
INT 21h
MOV DL, DH
ADD DL, 48D
INT 21h
PRINT 10
PUTC 13
LOOP cont

ret

