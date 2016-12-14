; stars.S will shoot a few different leds across the cube
;       GROUP: ECHO
;========================================================
#include <avr/io.h>
#include "config.inc"

        .section    .text
        .global     shooting_stars

; defining stars
star_1:
        ldi     r23, 0b101000
        ldi     r24, 0b11111111
        ldi     r25, 0b111111
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ; move star over
        ldi     r23, 0b011000
        out     C_PORT, r23
        call    pulse
        ; move star to d1
        ldi     r23, 0b111000
        ldi     r24, 0b11111101
        out     C_PORT, r23
        out     D_PORT, r24
        call    pulse
        ; move star over
        ldi     r24, 0b11111110
        out     D_PORT, r24
        call    pulse
        ret
star_2:
       ldi      r23, 0b110010
       ldi      r24, 0b11111111
       ldi      r25, 0b111101
       out      C_PORT, r23
       out      D_PORT, r24
       out      B_PORT, r25
       call     pulse
       ; move star over
       ldi      r25, 0b111110
       out      B_PORT, r25
       call     pulse
       ; move star over
       ldi      r24, 0b01111111
       ldi      r25, 0b111111
       out      D_PORT, r24
       out      B_PORT, r25
       call     pulse
       ; move star over
       ldi      r24, 0b10111111
       out      D_PORT, r24
       call     pulse
       ret
star_3:
        ldi     r23, 0b110100
        ldi     r24, 0b11111111
        ldi     r25, 0b011111
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ; move star over
        ldi     r24, 0b11101111
        ldi     r25, 0b111111
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ; move star over
        ldi     r24, 0b11110111
        out     D_PORT, r24
        call    pulse
        ; move star over
        ldi     r24, 0b11111011
        out     D_PORT, r24
        call    pulse
        ret
star_4:
        ldi     r23, 0b110001
        ldi     r24, 0b11111111
        ldi     r25, 0b101111
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ; move star over
        ldi     r25, 0b110111
        out     B_PORT, r25
        call    pulse
        ; - move star over
        ldi     r25, 0b111011
        out     B_PORT, r25
        call    pulse
        ; move star over
        ldi     r24, 0b11011111
        ldi     r25, 0b111111
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ret

shooting_stars:
        ; loop 3 times
        ldi     r27, 3
1:
        call    star_1
        call    star_4
        call    star_2
        call    star_3
        
        dec     r27
        brne    1b
        ret
