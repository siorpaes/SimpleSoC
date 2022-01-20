#include <stdint.h>

void SystemInit(void)
{

}


void delay(void)
{
	volatile unsigned int i = 100000;
	while(i--);
}

int main(void)
{
	unsigned int val = 1;
	*((volatile uint32_t*)0x40000004) = 0;

	while(1){
		*((volatile uint32_t*)0x40000000) = ( 1 << val);
		val++;
		val &= 0x3;
		delay();
	}
}


void HardFault_Handler(void)
{
	while(1);
}
