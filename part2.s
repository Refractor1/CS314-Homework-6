.text
.global _start

_start:
    MOV     R0, #0
    MOV     R5, #0
    LDR     R3, =TEST_NUM

OVERLOOP:                   //Outer loop to check if the new count is bigger, if so move it into R5.
    CMP     R0, R5
    BLE     SKIP
    MOV     R5, R0

SKIP:
    LDRB     R1, [R3], #1   //Load the next byte from the array.
    CMP     R1, #0          //Check if we are done or not.
    BEQ     END
    MOV     R0, #0          //Reset R0 to 0.

LOOP:
    CMP     R1, #0          //Stolen code from part1 slightly modified to jump to the outer loop.
    BEQ     OVERLOOP                  
    LSR     R2, R1, #1          
    AND     R1, R1, R2
    ADD     R0, #1
    B       LOOP

END:
    B       END

TEST_NUM:   .byte   73,169,42,128,154,17,90,144,63,201,0

.end