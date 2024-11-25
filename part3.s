.text
.global _start

_start:
    MOV     R0, #0
    MOV     R5, #0
    LDR     R3, =TEST_NUM

OVERLOOP:                       //Outer loop to check if the new count is bigger, if so move it into R5.
    CMP     R0, R5
    BLE     SKIP
    MOV     R5, R0

SKIP:
    LDR     R4, =BIT_CODES      //Stolen code from seven segment example, registers shifted to match the ones
    LDRB    R6, [R4,R5]         //we are using.
    LDR     R8, =0xFF200020
    STR     R6, [R8]
    LDRB     R1, [R3], #1       //Load the next byte from the array.    
    CMP     R1, #0              //Check if we are done or not.
    BEQ     END
    MOV     R0, #0              //Reset R0 to 0.

LOOP:
    CMP     R1, #0              //Stolen code from part1 slightly modified to jump to the outer loop.
    BEQ     OVERLOOP                  
    LSR     R2, R1, #1          
    AND     R1, R1, R2
    ADD     R0, #1
    B       LOOP

END:
    B       END

TEST_NUM:   .byte   73,169,42,128,154,17,90,144,63,201,0

BIT_CODES:
    .byte   0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110
    .byte   0b01101101, 0b01111101, 0b00000111, 0b01111111, 0b01100111

.end



