################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Utilities/Components/wm8994/wm8994.c 

OBJS += \
./Utilities/Components/wm8994/wm8994.o 

C_DEPS += \
./Utilities/Components/wm8994/wm8994.d 


# Each subdirectory must supply rules for building sources it contributes
Utilities/Components/wm8994/wm8994.o: ../Utilities/Components/wm8994/wm8994.c Utilities/Components/wm8994/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DSTM32 -DSTM32F4 -DSTM32F469NIHx -DSTM32F469I_DISCO -DDEBUG -DSTM32F469xx -DUSE_HAL_DRIVER -c -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ili9325" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/s25fl512s" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/cs43l22" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ili9341" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ampire480272" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/n25q512a" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/s5k5cag" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/mfxstm32l152" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/CMSIS/device" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/n25q128a" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ts3510" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/st7735" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/HAL_Driver/Inc/Legacy" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/lis302dl" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/otm8009a" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/STM32469I-Discovery" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/stmpe1600" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/Common" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ov2640" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/l3gd20" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/HAL_Driver/Inc" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/stmpe811" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/lis3dsh" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/wm8994" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Fonts" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/n25q256a" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/inc" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ls016b8uy" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ft6x06" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/exc7200" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/st7789h2" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Log" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/ampire640480" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/Utilities/Components/lsm303dlhc" -I"C:/Users/adam/Desktop/git/CansatUvalaci2021/Software/BaseStation/CanSat-basestation-v1.0/CMSIS/core" -O0 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"Utilities/Components/wm8994/wm8994.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

