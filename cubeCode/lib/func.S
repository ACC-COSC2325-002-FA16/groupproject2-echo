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

; This function will turn on the top layer of the cube
lvl_4:
        ldi     r24, 0b001000       ; applies power to just the 4th level(pin A3 on the board), and turns on LED's at pin A4 and A5
        ldi     r25, 0b00000000     ; turns on LED's at pins D0-D7
        ldi     r23, 0b000000       ; turns on LED's at pins B0-B5
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

; This functions turns on row 3 of the cube. The only difference between this function and lvl_4 is the 1 in the 
; r24 register, which gets output to C_PORT, is over one bit. The rest is the same.
lvl_3:
        ldi     r24, 0b000100       ; 3rd layer on
        ldi     r25, 0b00000000
        ldi     r23, 0b000000
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r26
        ret

; Again, only the 1 is being moved in C_PORT. This turns on the 2nd level of the cube.
lvl_2:
        ldi     r24, 0b000010       ; 2nd layer on
        ldi     r25, 0x00
        ldi     r23, 0b000000
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

; This turns on the bottom level of the cube. The 1 is all the way at the begining of the binary value(reading from right to left).
lvl_1:
        ldi     r24, 0b000001       ; bottom layer on
        ldi     r25, 0x00
        ldi     r23, 0b000000
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

; The next four functions turn on the rows of the LED's. Because our wires were different lengths, some of the pins are out of order, so
; the resulting rows get a little fun to figure out which LED's we need on for each row.
row_a:
        ; A4, D13, D12, D9  -- > These are the pins needed to turn on the first row. Row_A is situated by the resisters
        ldi     r24, 0b101111   ; This value turns on A4 and applies power to all 4 levels, so lvl_1 -> lvl_4 will have LED's on
        ldi     r25, 0xff       ; None of the D_PORT pins are used for this row, so they are all off
        ldi     r23, 0b001101   ; There are three B_PORT pins(D13, D12, D9) used in this row, so they have been turned on with 0's
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

row_b:
        ; A5, D4, D11, D8  
        ldi     r24, 0b011111   ; This is the second row, and A5 is needed, so it has been turned on. Also, power is applied to all 4 levels
        ldi     r25, 0b11101111 ; This time, D_PORT has one light that is on, pin D4, and the others are off
        ldi     r23, 0b110110   ; And now, since pins D8 and D11 are on port b, We have to turn them on and send them off to port b
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

row_c:
        ; D1, D3, D10, D7 --  The next two functions are pretty simular, I'm just picking and chosing which LED's need to be on based on the pins
        ldi     r24, 0b111111   ; no c_port LEDs
        ldi     r25, 0b01110101 ; d_port Leds: D7, D3, and D1
        ldi     r23, 0b111011   ; b_port LEDs: D10
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret

row_d:
        ; D0, D2, D5, D6
        ldi     r24, 0b111111   ; no c_port LEDs
        ldi     r25, 0b10011010 ; d_port LEDs: D6, D5, D2, D0
        ldi     r23, 0b111111   ; no b_port LEDs
        out     C_PORT, r24
        out     D_PORT, r25
        out     B_PORT, r23
        ret 

L_to_R:
        ; This function calls the previous functions in order to turn on the correct sequence of LEDs for the pattern
        ; The pattern goes from left to right, and each call is spaced by a delay so we can see the pattern multiple times
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
        ; This function calls the rows in order to send the LED lights from right to left.
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
        ; uses the level functions to have the levels of the LEDs turn on and off going from lvl 4 to lvl 1
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
        ; uses the level functions to have the levels of the LEDDs turn on and off going from lvl 1 to lvl 4
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
        ; fast delay used for turning the cube on and off and used by the shooting stars and the inner_outter cube functions.
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
        ; all_on turns on all 64 LED's in the cube.
        ldi     r23, 0b001111
        ldi     r24, 0b00000000
        ldi     r25, 0b000000
        out     C_PORT, r23
        out     D_PORT, r24
        out     B_PORT, r25
        ret
all_off:
        ; pretty easy to guess what this function does, turns off all 64 LEDs in the cube.
        ldi     r23, 0b000000
        out     C_PORT, r23
        ret

toggle_cube:
        ; this function calls all on and all off with the pulse delay to quickly turn on and off the LEDs.
        call    all_on
        call    pulse
        call    all_off
        call    pulse
        ret
        
