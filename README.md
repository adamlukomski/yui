# About yui
Yet-another Unicycle Interface - yui

# Youtube

General communication with Matlab: <https://www.youtube.com/watch?v=UxeqtVeoOOI>

First speed test: <https://www.youtube.com/watch?v=seSP-oLR1t4>

# Sketch

Yui is a unicycle project, probably one of many. Goal is to design a small, two-wheeled robot with as few electronic elements as possible and using only off-the-shelf components. And, of course, link it to Matlab for control.

Basic elements:
* two micro servos (9g, continuous rotation)
* wifi (esp8266 with at least 2 GPIOs)
* lipo battery 3.7v
* voltage regulator 3.3V for esp8266 (up/down regulator)

Other needed tools:
* lipo charger
* usb-uart communication

# Example

My current generation 0.1 of the robot is:

* two micro servos 9g modified for continuous rotation

  <https://www.olimex.com/Products/RobotParts/ServoMotors/MS-R-1.3-9/> are already pre-modified, meaning they have been unlocked (little bit of plastic cut out) and the potentiometer is disconnected from the motor/gear axis BUT still is used for control -  I soldered two 2.2Kohm 0805 smd resistors in there and the speed regulation is rock-solid now

  problems: this is a 4.8V-6.0V servo, so driving it from a 3.7V battery will not output much powers

  note: yes, electronics can output only a 3.3V pwm signals and it will work

*  wifi - esp8266

  now that's a little bugger - you need pins, the more the better

  why? in theory esp8266 has ADC pin and several GPIO/PWM/SPI pins (can output a max of 3 PWM signals at a time), but not on all boards they are ready for usage

  also, if you will buy a cheap 2$-one from China there is a good chance it it will be soldered incorrectly, upside-down or just in a bad manner

  I am using NodeMCU firmware, so a board with a good amount of SPI flash is recommended

  my choice: <https://www.olimex.com/Products/IoT/MOD-WIFI-ESP8266-DEV/open-source-hardware> is good enough

* lipo battery

  my initial choice was a 3.7V 1400mAh battery <https://www.olimex.com/Products/Power/BATTERY-LIPO1400mAh/> but for the final build I will use 1600mAh (no reason really, just easier to obtain) - my first experimental estimation of robot uptime on the battery when running in circles (using both motors AND all-the-time communication over wifi) is 6h50min

* voltage step-up/down regulator

  I honestly don't know if it is really necessary, but I added it as a precaution

  I'm using <http://botland.com.pl/przetwornice-impulsowe/1427-przetwornica-step-up-step-down-s7v8f3-5v-1a.html> because I will need a good 3.3V for the electronics - and since I am using a lipo battery I can even face 2.9V-4.2V voltage range (not recommended, but possible scenario) - thus a step up/down version

  and if the next generation of robots will get a lipo 7.4V upgrade - the regulator can be the same

Other tools I needed:

* usb-uart communication

  for uploading the firmware and main program

  I used <http://botland.com.pl/konwertery-usb-uart-rs232/3003-adafruit-ft232h-konwerter-usb-na-uart-spi-i2c-gpio.html> for communication (since it has a lot more features) and it worked flawlessly, but other FTDI-like boards should work too

