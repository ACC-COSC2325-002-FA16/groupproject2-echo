#############################################################
        4x4x4 LED Light Cube -- Project AVR Assembly
#############################################################

--> set up mapping with lights and leds

    ( A4 )  ( A5)   ( D1 )  ( D0 )
    

    ( D13)  ( D4 )  ( D3 )  ( D2 )


    ( D12)  ( D11)  ( D10)  ( D5 )


    ( D9 )  ( D8 )  ( D7 )  ( D6 )

----> A4 and A5 are the analog pins
----> D0 -> D13 are the digital pins

--> set up binary values for each pin
--> 0's indicate pins off and the 1 is the pin referred to

--> A4 - 0b010000 -> C_PORT Pin 4
--> A5 - 0b100000 -> C_PORT PIN 5

----> The D_PORT covers only Digital Pins 0-7 on the arduino board

--> D0 - 0b00000001 -> D_PORT pin 0
--> D1 - 0b00000010 -> D_PORT Pin 1
--> D2 - 0b00000100 -> D_PORT Pin 2
--> D3 - 0b00001000 -> D_PORT Pin 3
--> D4 - 0b00010000 -> D_PORT Pin 4
--> D5 - 0b00100000 -> D_PORT Pin 5
--> D6 - 0b01000000 -> D_PORT Pin 6
--> D7 - 0b10000000 -> D_PORT Pin 7

----> The first 6 pins on the B_PORT cover Digital pins 8-13 on the arduino board
--
--> D8  - 0b000001  -> B_PORT Pin 0
--> D9  - 0b000010  -> B_PORT Pin 1
--> D10 - 0b000100  -> B_PORT Pin 2
--> D11 - 0b001000  -> B_PORT Pin 3
--> D12 - 0b010000  -> B_PORT Pin 4
--> D13 - 0b100000  -> B_PORT Pin 5

----> Keep in mind that on the C_PORT, aplying a 1 to any of the first (reading right to left)
----> 4 pins will result in 0's, everywhere else, turning on the LED.
----> For example, If I want to turn all the LED's on the top row on, I would used the
----> following lines of code:
--> ldi r23, 0b001000       ;Turns on A4 and A5 on top
--> ldi r24, 0b00000000     ;Turns on D_PORT Pins 0-7
--> ldi r25, 0b000000       ;Turns on B_PORT Pins 0-5
--> out C_PORT, r23
--> out D_PORT, r24
--> out B_PORT, r25
----> Because C_PORT has a pin sending the positive signal from pin A3,
----> the other pins have to be a 0 so they dont send any signals to block
----> the flow of electrons to the LED.


