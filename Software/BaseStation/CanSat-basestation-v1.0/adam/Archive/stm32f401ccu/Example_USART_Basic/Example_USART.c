#include "stm32f4xx.h"
#include "string.h"



void serialSendString(USART_TypeDef* USARTx, char string[]);

int main(void)
{

// InitTypeDef's
GPIO_InitTypeDef GPIO_InitDef;
USART_InitTypeDef USART_InitDef;

	// Enable the GPIO C clock on AHB1 for LED
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

	// Enable the GPIO A clock on AHB1 for Button
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

	// Enable the USART1 clock on APB2
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);

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


	// Button on GPIO A configuration
	GPIO_InitDef.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitDef.GPIO_OType = GPIO_OType_PP;
	GPIO_InitDef.GPIO_Pin = GPIO_Pin_0;
	GPIO_InitDef.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitDef.GPIO_Speed = GPIO_Speed_50MHz;

	// Button on GPIO A initialization
	GPIO_Init(GPIOA, &GPIO_InitDef);

	// TX on GPIO A configuration
	GPIO_InitDef.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitDef.GPIO_OType = GPIO_OType_PP;
	GPIO_InitDef.GPIO_Pin = GPIO_Pin_9;
	GPIO_InitDef.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitDef.GPIO_Speed = GPIO_Speed_50MHz;


	// TX on GPIO A initialization
	GPIO_Init(GPIOA, &GPIO_InitDef);


	// RX on GPIO A configuration
	GPIO_InitDef.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitDef.GPIO_OType = GPIO_OType_PP;
	GPIO_InitDef.GPIO_Pin = GPIO_Pin_10;
	GPIO_InitDef.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitDef.GPIO_Speed = GPIO_Speed_50MHz;

	// RX on GPIO A initialization
	GPIO_Init(GPIOA, &GPIO_InitDef);

	// Setup AF
	GPIOA->AFR[1] |= (119<<4);

	// USART1 Configuration
	USART_InitDef.USART_BaudRate = 9600;
	USART_InitDef.USART_WordLength = USART_WordLength_8b;
	USART_InitDef.USART_StopBits = USART_StopBits_1;
	USART_InitDef.USART_Parity = USART_Parity_No ;
	USART_InitDef.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_InitDef.USART_HardwareFlowControl = USART_HardwareFlowControl_None;

	// USART1 initilization
	USART_Init(USART1, &USART_InitDef);

	// USART1 Enable
	USART1->CR1 |= (1<<13);

	// String
	char string[] = "Hello World!\n\r";

	// Loop
	while(1)
	{
		// Check if button is pressed
		if(!(GPIO_ReadInputData(GPIOA) & GPIO_Pin_0))
		{
			// Turn LED on
			GPIOC -> BSRRH |= (1<<13);

			// Send a message
			serialSendString(USART1, string);

		} else
		{
			// Turn LED off
			GPIOC -> BSRRL |= (1<<13);
		}
	}
}



void serialSendString(USART_TypeDef* USARTx, char string[])
{
	for(int i = 0; i < strlen(string); i++){
		USARTx->DR = (string[i]);
		while(!(USARTx->SR & USART_SR_TC));
	}
}