7) Escreva um programa em Assembly que leia do teclado dez números inteiros de
2 dígitos e imprima o maior e o menor número da lista e a todos os valores
novamente:

INCLUDE 'emu8086.inc'

ORG 100h                  
MOV CX, 10                               
                              
PRINT 'DIGITE 10 VALORES: '
ENT:   
CALL PULALINHA
MOV BL,0        
MOV AH,01h                   
INT 21H                      
SUB AL,48
MOV Bl,10
MUL BL
MOV BL, AL                                           
MOV AL,0
MOV AH,01h                            
INT 21H                                               
SUB AL,48                             
ADD BL, AL                                                 
MOV VET[SI],BL
INC SI         
CMP CX, 0      
LOOPNE ENT:
MOV SI,0
MOV CX,10    
CALL PULALINHA          
PRINT 'VALORES LIDOS: '  

SAIDA:


PRINT ' '
MOV BX,0 
MOV AH,0
MOV BL,10 
MOV AL, VET[SI]
DIV BL
MOV BH,AH
MOV BL,AL     
MOV AH,2  
ADD BL,48                      
MOV DL,BL
INT 21H
MOV AH,2
ADD BH,48
MOV DL,BH
INT 21H                         
INC SI   
CMP CX, 0                          
LOOPNE SAIDA
MOV SI,0
MOV CX,10

TROCA:
MOV BL,VET[SI]
CMP BL,MAIOR
JA  TROCAMAIOR
CMP BL,MENOR
JB TROCAMENOR
A:
INC SI
CMP CX, 0
LOOPNE TROCA

X:
CALL PULALINHA
PRINT 'MENOR VALOR LIDO: '
MOV AH,0
MOV BL,10
MOV AL,MENOR
DIV BL
MOV BH,AH
MOV BL,AL
MOV AH,2
ADD BL,48
MOV DL,BL
INT 21H
MOV AH,2
ADD BH,48
MOV DL,BH
INT 21H

CALL PULALINHA
PRINT 'MAIOR VALOR LIDO: '
MOV AH,0
MOV BL,10
MOV AL,MAIOR
DIV BL
MOV BH,AH
MOV BL,AL
MOV AH,2
ADD BL,48
MOV DL,BL
INT 21H
MOV AH,2
ADD BH,48
MOV DL,BH
INT 21H

RET
        
PULALINHA:          
PUTC 10                       
PUTC 13
                    
RET

TROCAMAIOR:
MOV MAIOR,BL
JMP A

TROCAMENOR:
MOV MENOR,BL
JMP A

RET
  
   VET   db ?
   MAIOR db 0
   MENOR db 99     

