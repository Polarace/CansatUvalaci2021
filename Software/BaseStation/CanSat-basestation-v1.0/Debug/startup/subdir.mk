################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../startup/startup_stm32f469xx.S 

OBJS += \
./startup/startup_stm32f469xx.o 

S_UPPER_DEPS += \
./startup/startup_stm32f469xx.d 


# Each subdirectory must supply rules for building sources it contributes
startup/startup_stm32f469xx.o: ../startup/startup_stm32f469xx.S startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/ili9325" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/s25fl512s" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/cs43l22" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/ili9341" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/ampire480272" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/n25q512a" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/s5k5cag" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/mfxstm32l152" -I"E:/STM32/workspace/projects/dsihost-test-5/CMSIS/device" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/n25q128a" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/ts3510" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/st7735" -I"E:/STM32/workspace/projects/dsihost-test-5/HAL_Driver/Inc/Legacy" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/lis302dl" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/otm8009a" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/STM32469I-Discovery" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/stmpe1600" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/Common" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/ov2640" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/l3gd20" -I"E:/STM32/workspace/projects/dsihost-test-5/HAL_Driver/Inc" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/stmpe811" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/lis3dsh" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/wm8994" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Fonts" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/n25q256a" -I"E:/STM32/workspace/projects/dsihost-test-5/inc" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/ls016b8uy" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/ft6x06" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/exc7200" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/st7789h2" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Log" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/ampire640480" -I"E:/STM32/workspace/projects/dsihost-test-5/Utilities/Components/lsm303dlhc" -I"E:/STM32/workspace/projects/dsihost-test-5/CMSIS/core" -x assembler-with-cpp -MMD -MP -MF"startup/startup_stm32f469xx.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

