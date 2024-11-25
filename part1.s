.text
.global _start

_start:
    LDRB     R1, TEST_NUM
    MOV     R0, #0

LOOP:
    CMP     R1, #0              // All zeroes remain?
    BEQ     END                  
    LSR     R2, R1, #1          // Shift R1 by 1 and put in R2
    AND     R1, R1, R2
    ADD     R0, #1
    B       LOOP

END:
    B       END

TEST_NUM:   .byte   0x0f

.end