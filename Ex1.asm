//1) Escreva um programa em Assembly que leia do teclado um número inteiro de 0
//até 99 e imprima o seu sucessor e seu antecessor:

include emu8086.inc

org 100h

MOV ah,1         
INT 21h          
SUB Al, 48d      
MOV BL, 10d      
MUL Bl           
MOV Dl,AL        
SUB al,48d       
MOV Al,DL        
MOV ah,1         
INT 21h          
SUB Al, 48d      
ADD AL,DL        
MOV Dl,Al       
CMP DL, 0d
JE negativo

ADD DL ,1d        
MOV DH, Dl        
SUB DL, 2d        
MOV CL, DL

CMP DH, 100d
JE CEM

;escrever SUCESSOR

putc 10 
putc 13
print 10
print "O SUCESSOR EH: "
JMP nor

CEM: 
putc 13
print 10
print "O SUCESSOR EH: "
PRINT " 100"
JMP ant

nor:
MOV AH, 0
MOV BL, 10d
MOV AL, DH
DIV BL          
MOV BH, AH      
MOV BL, AL      
ADD BL, 48d     
ADD BH, 48d     

MOV DL, BL
MOV AH, 2d 
INT 21h

MOV DL, BH
INT 21h
JMP ANT

;ESCREVE ANTECESSOR
negativo:
putc 10
putc 13
print 10
print "O SUCESSOR EH: 1"
putc 13
print 10
print "O ANTECESSOR EH: -1"
JMP SAIDA

ant:

putc 10
putc 13
print 10
print "O ANTECESSOR EH: "

MOV AH, 0
MOV BL, 10d
MOV AL, CL
DIV BL
MOV BH, AH
MOV BL, AL
ADD BL, 48d
ADD BH, 48d

MOV DL,BL
MOV AH, 2d
INT 21h

MOV DL, BH
INT 21h

SAIDA:
ret

///////////////////////////////////////////////////////////////////////////////////////////////
