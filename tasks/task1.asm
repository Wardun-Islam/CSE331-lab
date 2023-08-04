.MODEL SMALL
.STACK 100h

.CODE
    MOV AH, 01H   ;moving 01h into ah for Single-key input
    INT 21H       ;input in AL
    MOV BL, AL    ;input move to BL
    
    MOV AH, 02H   ;moving 02h into ah for Single-key output
    MOV DL, 20H   ;moving ascii value of space to dl for printing
    INT 21H
    
    MOV DL, BL    ;moving input from BL to DL for print
    INT 21H       ;output from DL
    
    EXIT:
    MOV AH, 4CH
    INT 21H
