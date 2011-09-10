int ledPin [] = {4, 5, 6, 7, 8, 9, 10, 11, 12}; // assign pins to LEDs
int inputPin1 = 3;                     // button 1 Off
int inputPin2 = 2;                     // button 2 On

int buttonPushCounter = 0;
int buttonState = 0;
int lastButtonState = 0;

int buttonPushCounter1 = 0;
int buttonState1 = 0;
int lastButtonState1 = 0;


void setup() {

  for(int i = 0; i < 10; i++){         //when i is 0 and less than 10 add 1
    pinMode(ledPin[i],OUTPUT);       //set LED as output
  }                                   


  pinMode(inputPin1, INPUT);         // set button 1 as input
  pinMode(inputPin2, INPUT);         // set button 2 as input

  Serial.begin(9600);
}

void loop(){

  buttonState = digitalRead(inputPin2);

  if (buttonState != lastButtonState) {
    if (buttonState == HIGH) {
      buttonPushCounter++;
      Serial.println("on");
      Serial.print("number of button pushes:   ");
      Serial.println(buttonPushCounter, DEC);
      
      digitalWrite(ledPin[buttonPushCounter-1], HIGH);
    }
  }

 lastButtonState = buttonState;
 
 
   if (buttonState != lastButtonState) {
    if (buttonState == HIGH) {
      buttonPushCounter--;
      Serial.println("on");
      Serial.print("number of button pushes:   ");
      Serial.println(buttonPushCounter, DEC);
      
      digitalWrite(ledPin[buttonPushCounter-1], HIGH);
    }
  }
  
buttonState1 = digitalRead(inputPin1);

  if (buttonState1 != lastButtonState1) {
    if (buttonState1 == HIGH) {
      buttonPushCounter--;
      Serial.println("on");
      Serial.print("number of button pushes:   ");
      Serial.println(buttonPushCounter1, DEC);
      
      digitalWrite(ledPin[buttonPushCounter1-1], HIGH);
    }
  }

 lastButtonState1 = buttonState1;
 
 
   if (buttonState1 != lastButtonState1) {
    if (buttonState1 == HIGH) {
      buttonPushCounter1++;
      Serial.println("on");
      Serial.print("number of button pushes:   ");
      Serial.println(buttonPushCounter1, DEC);
      
      digitalWrite(ledPin[buttonPushCounter1-1], HIGH);
    }
  }  
}
 
/* if (buttonPushCounter % 1 == 0) {
 
 for(int i = 0; i <= 9; i++){
 digitalWrite (ledPin[i], HIGH);
 }
 } 
 else {
 for(int i = 9; i >= 0; i--){  
 digitalWrite(ledPin[i], LOW);
 }
 }
 }
 */

// if (digitalRead(inputPin2) == LOW) {

//   for(int i = 0; i <= 9; i++){
//       digitalRead(inputPin2);
//      digitalWrite(ledPin[i], HIGH);  //Turns on LED #i each time this runs i

//   }    
// } 

// else if (digitalRead(inputPin1) == LOW) {

//   for(int i = 9; i >= 0; i--){  
//      digitalRead(inputPin1);
//      digitalWrite(ledPin[i], LOW);  //Turns off LED #i each time this runs i

//   }                                  
//  } 

//}

