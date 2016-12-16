; beat.S will do something 
;       GROUP: ECHO
;========================================================
#include <avr/io.h>
#include "config.inc"

        .section    .text
        .global     in_out_beat


in_out_beat:
        ldi     r27, 5
1:
        ldi     r23, 0b000110
        ldi     r24, 0b00011000
        ldi     r25, 0b001100
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25

        call delay

        call    row_a
        call    row_d

        ldi     r23, 0b011111
        ldi     r24, 0b00000000
        ldi     r25, 0b000000
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25

        ldi     r23, 0b001111
        ldi     r24, 0b00000010
        ldi     r25, 0b000000
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25

        ldi     r23, 0b001111
        ldi     r24, 0b00000000
        ldi     r25, 0b000001
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25

        ldi     r23, 0b001111
        ldi     r24, 0b10000000
        ldi     r25, 0b000000
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25

        call delay

        dec     r27
        brne    1b
        ret










