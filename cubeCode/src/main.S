;   GROUP: ECHO
;   main.S
;======================

#include "../lib/config.inc"
#include "../lib/func.S"


        .section    .text
        .global     main
        .org        0x0000

main:
        ; set up stack
        ldi         r28, (RAMEND & 0x00ff)
        ldi         r29, (RAMEND >> 8)
        out         _SPH, r29
        out         _SPL, r28

        call        init
        ; Enter main loop
1:
        ; All show function calls will happen here
        ; trying out first function
        ; Calling functions from func.S

        call        T_to_B      ; the function descriptions for the first 4 functions
        call        B_to_T      ; can be found in the func.S file
        call        R_to_L      
        call        L_to_R
        ; loop is done -- continue
        ; start loop for pulseing cube
        ldi         r27, 5          ; makes the cube pulse for 5 times
2:      call        toggle_cube     ; toggle_cube is described in the func.S file
        ; dec r27
        dec         r27
        ; check to see if 0, branch back if not
        brne        2b

        call        shooting_stars  ; this function is described in the stars.S file
        call        delay           ; this delay is a function from the func.S
        ; End of show
        rjmp        1b

init:
        ; set up the chip
        eor         r1, r1
        out         _SREG, r1
        ldi         r24, 0x80
        sts         CLKPR, r24  ; allow access to clock set up
        sts         CLKPR, r1   ; run at full speed

        ; setting up our data direction registers
        ldi         r24, 0b111111   ; turn pins a0-a5 to output
        out         C_DIR, r24
        out         B_DIR, r24      ; turn ports b0-b5 to output
        ldi         r24, 0b11111111 ; turn ports d0-d7 to output
        out         D_DIR, r24
        ret

