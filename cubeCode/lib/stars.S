; stars.S will shoot a few different leds across the cube
;       GROUP: ECHO
;========================================================
#include <avr/io.h>
#include "config.inc"

        .section    .text
        .global     shooting_stars

;   This file defines a light show called shooting_stars. The first four functions
;   start a "star" and then moves it across the the rows(horizontal movement) of the LED cube.


; defining stars
star_1:
        ; This first star starts at pin A4 on level 4. Also, to make sure the only LED we want on is on,
        ; D_Port and B_PORT are cleared so that this show can be used at any time after any other show.
        ldi     r23, 0b101000
        ldi     r24, 0b11111111
        ldi     r25, 0b111111
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ; move star over
        ; To move the star over, we look at the pin directly next to it, in this case, it's pin A5.
        ; Since we have alreaddy cleared D_PORT, and B_PORT, and the star is just moving to the last
        ; pin on C_PORT, that is the only port we need to make a change to.
        ldi     r23, 0b011000
        out     C_PORT, r23         ; Star has been moved
        call    pulse
        ; move star to d1
        ; Now the star is moving off a pin from C_PORT and onto one on D_PORT.
        ; So we clear C_PORT by placing 1's in pins A5 and A4, then, in D_PORT, place a zero where D1 is located
        ldi     r23, 0b111000
        ldi     r24, 0b11111101     ; pin D1 on, New position of star
        out     C_PORT, r23
        out     D_PORT, r24
        call    pulse
        ; move star over
        ; Now the star goes to it's last position, pin D0. Since A5 and A4 are off, and the level isn't changing
        ; we just have to change the D_PORT from pin D1 ro pin D0.
        ldi     r24, 0b11111110
        out     D_PORT, r24
        call    pulse
        ; This star has gone all the way across and is now done.
        ret
star_2:
        ; star two starts on B_PORT pin D9. The procedure is exactly the same as the previous star.
        ; We make sure all the LEDs are off except for D9, and on C_PORT, we just assign the level in which
        ; we want the star to start at, in this case, level 2. After each pulse, we just make the changes
        ; needed to move the start from pin to pin.
       ldi      r23, 0b110010
       ldi      r24, 0b11111111
       ldi      r25, 0b111101
       out      C_PORT, r23
       out      D_PORT, r24
       out      B_PORT, r25     ; star starts at pin D9
       call     pulse
       ; move star over
       ldi      r25, 0b111110
       out      B_PORT, r25     ; star has moved to pin D8
       call     pulse
       ; move star over
       ldi      r24, 0b01111111
       ldi      r25, 0b111111
       out      D_PORT, r24     ; star has moved to D_PORT on pin D7
       out      B_PORT, r25
       call     pulse
       ; move star over
       ldi      r24, 0b10111111
       out      D_PORT, r24     ; star has moved to pin D6
       call     pulse
       ret
star_3:
        ; Again, the procedure is the same as the last two stars. Clear out all the LEDs except for the ones that we want on
        ; and then apply to the power to the level. Star 3 start at pin D13 on B_PORT and level 3.
        ldi     r23, 0b110100
        ldi     r24, 0b11111111
        ldi     r25, 0b011111       ; star on pin D13 on B_PORT
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ; move star over
        ldi     r24, 0b11101111     ; star moves from B_PORT to D_PORT, pin D4
        ldi     r25, 0b111111
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ; move star over
        ldi     r24, 0b11110111     ; star stays on D_PORT and moves over to pin D3
        out     D_PORT, r24
        call    pulse
        ; move star over
        ldi     r24, 0b11111011     ; star still on D_PORT, moves to last position ar pin D2
        out     D_PORT, r24
        call    pulse
        ret
star_4:
        ; This star starts on B_PORT like star 2 and ends up at D_PORT like all the other stars.
        ldi     r23, 0b110001
        ldi     r24, 0b11111111
        ldi     r25, 0b101111       ; star on B_PORT, pin D12
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ; move star over
        ldi     r25, 0b110111       ; star has been moved over to B_PORT pin D11
        out     B_PORT, r25
        call    pulse
        ; - move star over
        ldi     r25, 0b111011       ; star is still on B_PORT, but has been moved to pin D10
        out     B_PORT, r25
        call    pulse
        ; move star over
        ldi     r24, 0b11011111     ; here, the star is moved to D_PORT, and ends at pin D5
        ldi     r25, 0b111111
        out     D_PORT, r24
        out     B_PORT, r25
        call    pulse
        ret

shooting_stars:
        ; This function just calls the stars in the order we want them to move across the cube.
        ; Nothing special about it, and we can define more stars or just call the same ones in different
        ; patterns. No delays are needed between star calls because each star function ends with a delay
        ; and we want it to appear as if there is no time between when the last star moves off the cube
        ; and the next one appears on the cube.
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
