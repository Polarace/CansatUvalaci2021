################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include startup/subdir.mk
-include src/subdir.mk
-include Utilities/STM32469I-Discovery/subdir.mk
-include Utilities/Log/subdir.mk
-include Utilities/Components/wm8994/subdir.mk
-include Utilities/Components/ts3510/subdir.mk
-include Utilities/Components/stmpe811/subdir.mk
-include Utilities/Components/stmpe1600/subdir.mk
-include Utilities/Components/st7789h2/subdir.mk
-include Utilities/Components/st7735/subdir.mk
-include Utilities/Components/s5k5cag/subdir.mk
-include Utilities/Components/ov2640/subdir.mk
-include Utilities/Components/otm8009a/subdir.mk
-include Utilities/Components/mfxstm32l152/subdir.mk
-include Utilities/Components/lsm303dlhc/subdir.mk
-include Utilities/Components/ls016b8uy/subdir.mk
-include Utilities/Components/lis3dsh/subdir.mk
-include Utilities/Components/lis302dl/subdir.mk
-include Utilities/Components/l3gd20/subdir.mk
-include Utilities/Components/ili9341/subdir.mk
-include Utilities/Components/ili9325/subdir.mk
-include Utilities/Components/ft6x06/subdir.mk
-include Utilities/Components/exc7200/subdir.mk
-include Utilities/Components/cs43l22/subdir.mk
-include HAL_Driver/Src/Legacy/subdir.mk
-include HAL_Driver/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := CanSat-basestation-v1.0
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX := 
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME).$(BUILD_ARTIFACT_EXTENSION)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
CanSat-basestation-v1.0.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
CanSat-basestation-v1.0.list \

OBJCOPY_BIN += \
CanSat-basestation-v1.0.bin \


# All Target
all: main-build

# Main-build Target
main-build: CanSat-basestation-v1.0.elf secondary-outputs

# Tool invocations
CanSat-basestation-v1.0.elf: $(OBJS) $(USER_OBJS) E:\STM32\workspace\projects\dsihost-test-5\LinkerScript.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "CanSat-basestation-v1.0.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"E:\STM32\workspace\projects\dsihost-test-5\LinkerScript.ld" --specs=nosys.specs -Wl,-Map="CanSat-basestation-v1.0.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

CanSat-basestation-v1.0.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "CanSat-basestation-v1.0.list"
	@echo 'Finished building: $@'
	@echo ' '

CanSat-basestation-v1.0.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "CanSat-basestation-v1.0.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents fail-specified-linker-script-missing warn-no-linker-script-specified
.SECONDARY:

-include ../makefile.targets
