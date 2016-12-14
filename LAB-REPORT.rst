===========================
Lab report for group 'echo'
===========================

:Echo:    
          Natalie Garza

          Derrick Jewell

          Gregory Wilde

          Travis  Neel

--------------------------------
4x4x4 LED Cube using Arduino Uno
--------------------------------

:Table of Contents:
                    Introduction

                    Microcontroller Platform

                    The Device

                    Development Tools

                    Experiment

                    Conclusions

                    Contributions

Introduction
------------
    The LED Cube is basically a 3D array of LED lights that works because of something called persistance of vision. Persistance of vision is when the led light flickers so fast that our human eyes cannot see it flickering so it seems as if its continuously on. Using code we flicker the lights so fast and in a specific way so that the Cube looks like it is putting on a light show.

Microcontroller Platform
------------------------
    The microcontroller we are using to power the Cube is called an Arduino Uno. It can be obtained easily online or at any local elecronics store. The Arduino Uno isa small board that can be talked through a USB port, it comes with its own IDE and can be programmed using C. The capabilities of this board are truly endless, there are a lot of accesories that can be used to do a variety of things. In our case we used the LEDs to make the light show. The most essential part of the Arduino Uno to our project was the I/O pins. The Cube needed to be connected to a lot of pins to get it to work, that included 14 digital I/O pins and 6 analog I/O pins. The other feature useful to our project was the clock speed of 16 Mhz. By slowing this down using delays in our code we can get to a speed we want so that we can flicker the lights at that speed and succesfully give us a persistance of vision effect. 

The Device
----------
    Our Device consisted of 64 LED lights, 3 breadboards, 24 wires, 4 330 ohm resistors, and of course the Arduino Uno. We started by soldering the lights together to get the Cube shape going, after the Cube was built we soldered 1 wire to each level, so a total of 4 wires used to talk to each level. Next we set the cube up on top of 2 small breadboards, then we connected 1 wire to each column of LEDs using a total of 16 wires. We then set up the third breadboard next to where the level wires are so that we could apply the resistors to them. Lastly to finish it off we connected the 4 level wires and placed them into the analog pins 0 to 3. The rest of the wires were plugged into the 14 digital pins and the 2 will go into the analog pins 4 and 5. 

Development Tools
-----------------
    Typically to work with an Arduino the IDE would be the place to go to develop code. But since we were to use assembly in our project we had to use a different set of development tools. To write our code we used a text editor, in our case vim. To compile our code we used the gnu/gcc compiler along with the avrdude to load the code onto the arduino. To wrap it all together we configured the Makefile.

Experiment
----------









