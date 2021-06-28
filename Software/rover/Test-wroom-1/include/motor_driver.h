#include "stdint.h"

#ifndef MOTOR_DRIVER_H
#define MOTOR_DRIVER_H

/* Important code */  
#ifdef __cplusplus
extern "C" {
#endif



typedef struct 
{
    uint8_t             Direction;      /* Can be any of MOTOR_DIRECTION_X */

    uint8_t             PinPlus;        /* Pin at which '+' is connected */ 

    uint8_t             PinMinus;       /* Pin at which '-' is connected */ 

} MotorDef;

/* ************ Function prototypes ************ */

/* Initialization function */
void motor_init(MotorDef *motor);

/* Forward move function */
void motor_forward(MotorDef *motor);

/* Backward move function */
void motor_backward(MotorDef *motor);

/* Stop motor function */
void motor_stop(MotorDef *motor);

/* Direction defines */
#define MOTOR_DIRECTION_LEFT                0x00
#define MOTOR_DIRECTION_RIGHT               0x01

#ifdef __cplusplus
}
#endif

#endif