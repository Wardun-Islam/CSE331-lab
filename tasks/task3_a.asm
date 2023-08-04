.MODEL SMALL
.STACK 100h

.CODE
    MOV AH, 01H   ;moving 01h into ah for Single-key input
    INT 21H       ;input1 in AL
    MOV BL, AL    ;input1 move to BL
    
    INT 21H       ;input2 in AL
    MOV BH, AL    ;input2 move to BH
    
    MOV AH, 02H   ;moving 02h into ah for Single-key output
    MOV DL, BH    ;moving input2 from BH to DL for print
    INT 21H       ;output from DL
    
    MOV DL, BL    ;moving input2 from BL to DL for print
    INT 21H       ;output from DL
    
    EXIT:
    MOV AH, 4CH
    INT 21H
