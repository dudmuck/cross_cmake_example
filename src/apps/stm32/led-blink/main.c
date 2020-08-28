#include "target_stm32.h"

/* green LED is abstracted among nucleo boards */

int main(void)
{
    HAL_Init();

    SystemClock_Config();

    BSP_LED_Init(LED_GREEN);

    for (;;) {
        HAL_Delay(500);
        BSP_LED_Toggle(LED_GREEN);
    }

}

