.MODEL SMALL
.STACK 100H
.DATA
L1 DB ? 
C DB ?
M1 DB 'Enter 4 numbers to find 2nd large number: $' 
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA AX,M1
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,013
    INT 21H
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,013
    INT 21H
    
    ;INPUT
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ;SPACE
    MOV AH,2
    MOV DL,009
    INT 21H
   
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,2
    MOV DL,009
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    MOV AH,2
    MOV DL,009
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CH,AL
    
    ;NEW LINE
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,013
    INT 21H    
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,013
    INT 21H
        
    ;COMPARE
    CMP BL,BH
    JGE BLL 
    
    CMP BH,CL
    JGE BHH
    
    CMP CL,CH
    JGE CLLG
    JLE CHLG
    
    BLL:
    CMP BL,CL
    JGE BLL1
    
    CMP CL,CH
    JGE CLLG
    JLE CHLG
    
    BLL1:
    CMP BL,CH
    JGE BLLG
    JLE CHLG
    
    BHH:
    CMP BH,CH
    JGE BHLG
    JLE CHLG
    
    BLLG:
    MOV L1,BL
    SUB BL,BH
    ADD BL,48
    MOV C,BL
  
    MOV BL,L1
    SUB BL,CH
    ADD BL,48
    MOV AH,BL
    
    MOV BL,L1
    SUB BL,CL
    ADD BL,48
    MOV DH,BL
    
    CMP C,AH
    JLE BLLG1
    
    CMP AH,DH
    JLE BLLG2
    JGE BLLG3
    
    BLLG1:
    CMP C,DH
    JGE BLLG3
    
    MOV BL,L1
    SUB BL,C
    ADD BL,48
    JMP BLP
    
    BLLG2:
    MOV BL,L1
    SUB BL,AH
    ADD BL,48
    JMP BLP 
    
    BLLG3:
    MOV BL,L1
    SUB BL,DH
    ADD BL,48
    JMP BLP
    
    BLP:
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
   
    BHLG:
    MOV L1,BH
    SUB BH,BL
    ADD BH,48
    MOV C,BH
  
    MOV BH,L1
    SUB BH,CH
    ADD BH,48
    MOV AH,BH
    
    MOV BH,L1
    SUB BH,CL
    ADD BH,48
    MOV DH,BH
    
    CMP C,AH
    JLE BHLG1
    
    CMP AH,DH
    JLE BHLG2
    JGE BHLG3
    
    BHLG1:
    CMP C,DH
    JGE BHLG3
    
    MOV BH,L1
    SUB BH,C
    ADD BH,48
    JMP BHP
    
    BHLG2:
    MOV BH,L1
    SUB BH,AH
    ADD BH,48
    JMP BHP 
    
    BHLG3:
    MOV BH,L1
    SUB BH,DH
    ADD BH,48
    JMP BLP
    
    BHP:
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP EXIT
    
    CLLG:
    MOV L1,CL
    SUB CL,BH
    ADD CL,48
    MOV C,CL
  
    MOV CL,L1
    SUB CL,CH
    ADD CL,48
    MOV AH,CL
    
    MOV CL,L1
    SUB CL,BL
    ADD CL,48
    MOV DH,CL
    
    CMP C,AH
    JLE CLLG1
    
    CMP AH,DH
    JLE CLLG2
    JGE CLLG3
    
    CLLG1:
    CMP C,DH
    JGE CLLG3
    
    MOV CL,L1
    SUB CL,C
    ADD CL,48
    JMP CLP
    
    CLLG2:
    MOV CL,L1
    SUB CL,AH
    ADD CL,48
    JMP CLP 
    
    CLLG3:
    MOV CL,L1
    SUB CL,DH
    ADD CL,48
    JMP CLP
    
    CLP:
    MOV AH,2
    MOV DL,CL
    INT 21H
    JMP EXIT
    
    CHLG:
    MOV L1,CH
    SUB CH,BH
    ADD CH,48
    MOV C,CH
  
    MOV CH,L1
    SUB CH,BL
    ADD CH,48
    MOV AH,CH
    
    MOV CH,L1
    SUB CH,CL
    ADD CH,48
    MOV DH,CH
    
    CMP C,AH
    JLE CHLG1
    
    CMP AH,DH
    JLE CHLG2
    JGE CHLG3
    
    CHLG1:
    CMP C,DH
    JGE CHLG3
    
    MOV CH,L1
    SUB CH,C
    ADD CH,48
    JMP CHP
    
    CHLG2:
    MOV CH,L1
    SUB CH,AH
    ADD CH,48
    JMP CHP 
    
    CHLG3:
    MOV CH,L1
    SUB CH,DH
    ADD CH,48
    JMP CHP
    
    CHP:
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
