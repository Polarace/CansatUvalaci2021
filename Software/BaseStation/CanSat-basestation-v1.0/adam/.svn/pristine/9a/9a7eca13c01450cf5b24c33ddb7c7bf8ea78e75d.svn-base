#include "stm32f4xx.h"


int main(void)
{

// GPIO's Init Def
GPIO_InitTypeDef GPIO_InitDef;

	// Enable the GPIO clock for Ports C on AHB1 for LED
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

	// LED on GPIO C configuration
	GPIO_InitDef.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitDef.GPIO_OType = GPIO_OType_PP;
	GPIO_InitDef.GPIO_Pin = GPIO_Pin_13;
	GPIO_InitDef.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitDef.GPIO_Speed = GPIO_Speed_50MHz;

	// LED on GPIO C initlaziation
	GPIO_Init(GPIOC, &GPIO_InitDef);

	// Turn LED off
	GPIOC->BSRRL |= (1<<13);

	// Enable the GPIO clock for Ports C on AHB1 for Button
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

	// Button on GPIO A configuration
	GPIO_InitDef.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitDef.GPIO_OType = GPIO_OType_PP;
	GPIO_InitDef.GPIO_Pin = GPIO_Pin_0;
	GPIO_InitDef.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitDef.GPIO_Speed = GPIO_Speed_50MHz;

	// Button on GPIO A initialization
	GPIO_Init(GPIOA, &GPIO_InitDef);

	// Loop
	while(1)
	{
		// Check if button isn't pressed
		if(!(GPIO_ReadInputData(GPIOA) & GPIO_Pin_0))
		{
			// Turn LED on
			GPIOC -> BSRRH |= (1<<13);
		} else
		{
			// Turn LED off
			GPIOC -> BSRRL |= (1<<13);
		}
	}
}
