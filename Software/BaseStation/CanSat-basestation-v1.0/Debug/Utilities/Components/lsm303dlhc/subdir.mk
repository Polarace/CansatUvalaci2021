################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Utilities/Components/lsm303dlhc/lsm303dlhc.c 

OBJS += \
./Utilities/Components/lsm303dlhc/lsm303dlhc.o 

C_DEPS += \
./Utilities/Components/lsm303dlhc/lsm303dlhc.d 


# Each subdirectory must supply rules for building sources it contributes
Utilities/Components/lsm303dlhc/lsm303dlhc.o: ../Utilities/Components/lsm303dlhc/lsm303dlhc.c Utilities/Components/lsm303dlhc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DSTM32 -DSTM32F4 -DSTM32F469NIHx -DSTM32F469I_DISCO -DDEBUG -DSTM32F469xx -DUSE_HAL_DRIVER -c -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ili9325" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/s25fl512s" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/cs43l22" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ili9341" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ampire480272" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/n25q512a" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/s5k5cag" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/mfxstm32l152" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/CMSIS/device" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/n25q128a" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ts3510" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/st7735" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/HAL_Driver/Inc/Legacy" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/lis302dl" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/otm8009a" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/STM32469I-Discovery" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/stmpe1600" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/Common" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ov2640" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/l3gd20" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/HAL_Driver/Inc" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/stmpe811" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/lis3dsh" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/wm8994" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Fonts" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/n25q256a" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/inc" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ls016b8uy" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ft6x06" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/exc7200" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/st7789h2" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Log" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ampire640480" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/lsm303dlhc" -I"E:/Projects/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/CMSIS/core" -O0 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Utilities/Components/lsm303dlhc/lsm303dlhc.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

