; Func.S holds functions used by main
#include <avr/io.h>
#include "config.inc"

        .section    .text
        ; global functions go here
        .global     delay, L_to_R, R_to_L, T_to_B, B_to_T, toggle_cube, pulse

        ; start function definitions
delay:
        ; this delay is set up the same way as the one from class, just faster
        ldi         r16, 100        
6:
        ldi         r17, 100
7:
        ldi         r18, 100
8:
        dec         r18
        brne        8b      ; this checks to see if r18 is equal to 0, if not, it jumps back to the dec r18 command. If it is zero, it moves on
        dec         r17
        brne        7b      ; this checks to see if r17 == 0. If no, jumps up to loading r18 and goes through everything until r17 == 0.
        dec         r16
        brne        6b      ; this checks
        ret

lvl_4:
        ldi     r24, 0b001000
        ldi     r25, 0b00000000
        ldi     r23, 0b000000
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

lvl_3:
        ldi     r24, 0b000100
        ldi     r25, 0b00000000
        ldi     r23, 0b000000
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r26
        ret

lvl_2:
        ldi     r24, 0b000010
        ldi     r25, 0x00
        ldi     r23, 0b000000
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

lvl_1:
        ldi     r24, 0b000001
        ldi     r25, 0x00
        ldi     r23, 0b000000
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

row_a:
        ; A4, D13, D12, D9
        ldi     r24, 0b101111
        ldi     r25, 0xff
        ldi     r23, 0b001101
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

row_b:
        ; A5, D4, D11, D8
        ldi     r24, 0b011111
        ldi     r25, 0b11101111
        ldi     r23, 0b110110
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

row_c:
        ; D1, D3, D10, D7
        ldi     r24, 0b111111
        ldi     r25, 0b01110101
        ldi     r23, 0b111011
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

row_d:
        ; D0, D2, D5, D6
        ldi     r24, 0b111111
        ldi     r25, 0b10011010
        ldi     r23, 0b111111
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret 

L_to_R:
        call        row_a
        call        delay
        call        row_b
        call        delay
        call        row_c
        call        delay
        call        row_d
        call        delay
        ret

R_to_L:
        call        row_d
        call        delay
        call        row_c
        call        delay
        call        row_b
        call        delay
        call        row_a
        call        delay
        ret

T_to_B:
        call        lvl_4
        call        delay
        call        lvl_3
        call        delay
        call        lvl_2
        call        delay
        call        lvl_1
        call        delay
        ret

B_to_T:
        call        lvl_1
        call        delay
        call        lvl_2
        call        delay
        call        lvl_3
        call        delay
        call        lvl_4
        call        delay
        ret

pulse:
        ldi     r16, 75
1:
        ldi     r17, 75
2:
        ldi     r18, 75
3:
        dec     r18
        brne    3b
        dec     r17
        brne    2b
        dec     r16
        brne    1b
        ret

all_on:
        ldi     r23, 0b001111
        ldi     r24, 0b00000000
        ldi     r25, 0b000000
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25
        ret
all_off:
        ldi     r23, 0b000000
        out     C_PORT, r23
        ret
toggle_cube:
        call    all_on
        call    pulse
        call    all_off
        call    pulse
        ret
        
