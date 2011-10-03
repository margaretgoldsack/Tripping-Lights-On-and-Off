
/*
*
 * dfescribe sketch
 */

#include <Firmata.h>

int ledPin [] = {
  4, 5, 6, 7, 8, 9, 10, 11, 12}; // assign pins to LEDs
int inputPin1 = 3;                     // button 1 Off
int inputPin2 = 2;                     // button 2 On

int buttonPushCounter = 0;             // set button 2 counter to 0
int buttonState = 0;                   // set button 2 state to 0
int lastButtonState = 0;               // set last button 2 state to 0

int buttonPushCounter1 = 0;            // set button 1 counter to 0
int buttonState1 = 0;                  // set button 1 state to 0
int lastButtonState1 = 0;              // set last button 2 state to 0


void setup() {

  Firmata.setFirmwareVersion(0, 1);
  Firmata.begin(57600);  

  for(int i = 0; i < 10; i++){         //when i is 0 and less than 10 add 1
    pinMode(ledPin[i],OUTPUT);         //set LED as output
  }                                   


  pinMode(inputPin1, INPUT);           // set button 1 as input
  pinMode(inputPin2, INPUT);           // set button 2 as input

  //Serial.begin(9600);                  // set serial monitor to work
}

void loop(){

  buttonState = digitalRead(inputPin2);                    // set buttonState to button 2 

    if (buttonPushCounter < 9){                             // if the push button counter is less than 9 do the following

    if (buttonState != lastButtonState) {                 // if the button state is not equal to the last button state then do following

      if (buttonState == HIGH) {                          //  if button state is on then 
        buttonPushCounter++;                              // get counter to add one more

        Firmata.sendAnalog(0, 1); 

        //Serial.println("on");                             // print 'on' to serial monitor
        //Serial.print("number of button pushes:   ");      // print number of button pushes on serial monitor
        //Serial.println(buttonPushCounter, DEC);           // make the counter decimal

        digitalWrite(ledPin[buttonPushCounter-1], HIGH);  // turn on lights one by one but -1 so as to start with all of the lights off
      } 

      else {
        Firmata.sendAnalog(0, 0); 
      }

    }
  }

  lastButtonState = buttonState;                          // set the last button state to equal the current button state

    if (buttonState != lastButtonState) {                // if the button state does not equal the last button state 

      if (buttonState == HIGH) {                           // if the button state is on
      buttonPushCounter--;                               // minus 1 from the button counter

      Firmata.sendAnalog(0, 1); // send as pin a0, 1; 

      //Serial.println("on");                             // print 'on' to serial monitor
      //Serial.print("number of button pushes:   ");      // print number of button pushes on serial monitor
      //Serial.println(buttonPushCounter, DEC);           // make the counter decimal

      digitalWrite(ledPin[buttonPushCounter-1], HIGH);  // turn on lights one by one but -1 so as to start with all of the lights off
    }
    else {
      Firmata.sendAnalog(0, 0);
    }
  }

  buttonState1 = digitalRead(inputPin1);                  // set buttonState to button 1

    if (buttonPushCounter > 0){                             // if the push button counter is more than 0 do the following

    if (buttonState1 != lastButtonState1) {               // if the button state is not equal to the last button state then do following

      if (buttonState1 == HIGH) {                         //  if button state is on then 
        buttonPushCounter--;                              // minus 1 from the button counter

        Firmata.sendAnalog(1, 1);

        //Serial.println("on");
        //Serial.print("number of button pushes:   ");
        //Serial.println(buttonPushCounter, DEC);

        digitalWrite(ledPin[buttonPushCounter], LOW);
      }

      else {
        Firmata.sendAnalog(1, 0); 
      }

    }
  }

  lastButtonState1 = buttonState1;

}




