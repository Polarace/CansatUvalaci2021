#include <motor_driver.h>
#include "stdint.h"
#include <esp32-hal-gpio.h>

/* Initialize motor pins and to left / right side */
void motor_init(MotorDef *motor)
{
    pinMode(motor->PinPlus, OUTPUT);
    pinMode(motor->PinMinus, OUTPUT);
    
    digitalWrite(motor->PinPlus, LOW);
    digitalWrite(motor->PinMinus, LOW);
}

/* Make motor move forward relative to facing direction */
void motor_forward(MotorDef *motor)
{
    // if motor is right-sided
    if(motor->Direction)
    {
        digitalWrite(motor->PinPlus, HIGH);
        digitalWrite(motor->PinMinus, LOW);
    }
    // if motor is left-sided
    else
    {
        digitalWrite(motor->PinPlus, LOW);
        digitalWrite(motor->PinMinus, HIGH);
    }
}

/* Make motor move backward relative to facing direction */
void motor_backward(MotorDef *motor)
{
    // if motor is right-sided
    if(motor->Direction)
    {
        digitalWrite(motor->PinPlus, LOW);
        digitalWrite(motor->PinMinus, HIGH);
    }
    // if motor is left-sided
    else
    {
        digitalWrite(motor->PinPlus, HIGH);
        digitalWrite(motor->PinMinus, LOW);
    }
}

/* Make motor stop */
void motor_stop(MotorDef *motor)
{
    digitalWrite(motor->PinPlus, LOW);
    digitalWrite(motor->PinMinus, LOW);
}
