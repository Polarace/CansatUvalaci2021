#include <Arduino.h>
#include <WiFi.h>
#include <motor_driver.h>


#define LMOTOR_PLUS   14  
#define LMOTOR_MINUS  27

#define RMOTOR_PLUS   13  
#define RMOTOR_MINUS  12

//#define LED_BUILTIN 2

MotorDef motorL;
MotorDef motorR;

char rxByte = 0x00;

void setup()
{
  Serial.begin(115200);

  motorL.Direction = MOTOR_DIRECTION_LEFT;
  motorL.PinPlus = LMOTOR_PLUS;
  motorL.PinMinus = LMOTOR_MINUS;
  motor_init(&motorL);

  motorR.Direction = MOTOR_DIRECTION_RIGHT;
  motorR.PinPlus = RMOTOR_PLUS;
  motorR.PinMinus = RMOTOR_MINUS;
  motor_init(&motorR);


  pinMode(LED_BUILTIN, OUTPUT);


  Serial.println("Setupus");
  Serial.println("Enter a key");
}

void loop()
{
  //delay(500);

  if (Serial.available() > 0) {
  rxByte = Serial.read();

  switch (rxByte) {
    case 'w':
      motor_forward(&motorR);
      motor_forward(&motorL);
    break;
    case 's':
      motor_backward(&motorR);
      motor_backward(&motorL);
    break;
    case 'x':
      motor_stop(&motorR);
      motor_stop(&motorL);
    break;
  }

  }

}
