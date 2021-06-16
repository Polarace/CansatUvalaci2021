#include "stm32f4xx.h"
			

int main(void)
{

GPIO_InitTypeDef GPIO_InitDef;

// Enable the GPIO clock for Ports C & A using the AHB1 and RCC
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

	//RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);

	// GPIO C
	GPIO_InitDef.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitDef.GPIO_OType = GPIO_OType_PP;
	GPIO_InitDef.GPIO_Pin = GPIO_Pin_13;
	GPIO_InitDef.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitDef.GPIO_Speed = GPIO_Speed_50MHz;

	GPIO_Init(GPIOC, &GPIO_InitDef);

	GPIOC->BSRRL |= (1<<13);

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

	// GPIO A
	GPIO_InitDef.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitDef.GPIO_OType = GPIO_OType_PP;
	GPIO_InitDef.GPIO_Pin = GPIO_Pin_0;
	GPIO_InitDef.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitDef.GPIO_Speed = GPIO_Speed_50MHz;

	GPIO_Init(GPIOA, &GPIO_InitDef);


	// Set USART1 baud rate
	//USART1-> BRR = 0x1D4C;
	// Make GPIO's Alternate function
	// x GPIOA->AFR[1] |= (119<<4);

	//GPIOC -> BSRRH |= (1<<13);

	// Enable	|	RX en		|	TX en	   |	USART en
	//USART1->CR1 |= USART_CR1_RE | USART_CR1_TE | USART_CR1_UE;


	char temp[] = "Hello\n\r";
	char letter = 'x';

	while(1)
	{
		//if(USART1->SR & USART_SR_RXNE)
		//{
			if(!(GPIO_ReadInputData(GPIOA) & GPIO_Pin_0))
			{
				GPIOC -> BSRRH |= (1<<13);

				//USART1->DR = letter;
				//while(!(USART1->SR & USART_SR_TC));
				/*for(int x = 0; x < strlen(temp); x++)
				*{
				*	USART1->DR = temp[x];
				*	while(!(USART1->SR & USART_SR_TC));
				}*/
			} else
			{
				GPIOC -> BSRRL |= (1<<13);
			}
		//}
	}
}


/*
USART_InitTypeDef USART1_Serial;
USART1_Serial.USART_Mode = USART_Mode_Tx;
USART1_Serial.USART_BaudRate = 9600;
USART1_Serial.USART_StopBits = USART_StopBits_1;
USART1_Serial.USART_WordLength = USART_WordLength_8b;
USART_Init(USART1, &USART1_Serial);
*/
