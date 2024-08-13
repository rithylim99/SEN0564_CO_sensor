#include <stdio.h>
#include "freertos\FreeRTOS.h"
#include "freertos\task.h"
#include "driver\adc.h"
#include "esp_log.h"
#include "math.h"

#define ADC1_CHANNEL_VS ADC1_CHANNEL_7  // GPIO35
#define ADC1_CHANNEL_VO ADC1_CHANNEL_6  // GPIO34

#define est_a 0.783
#define est_b 0.242

float ppm_co_val;

void adc_init(void){

    // Configure the ADC width
    adc1_config_width(ADC_WIDTH_BIT_12);

    // Configure the ADC1 channels
    adc1_config_channel_atten(ADC1_CHANNEL_VS, ADC_ATTEN_DB_0);
    adc1_config_channel_atten(ADC1_CHANNEL_VO, ADC_ATTEN_DB_0);
}

float get_ppm_co(float Vo, float Vs, float param_a, float param_b){
    float ppm_co = pow(10,((Vs-Vo-param_b)/param_a));
    return ppm_co;
}

void app_main(void)
{

    adc_init();

    while (1) {
        // Read ADC values
        int adc_value_vs = adc1_get_raw(ADC1_CHANNEL_VS);
        int adc_value_vo = adc1_get_raw(ADC1_CHANNEL_VO);

        // Convert ADC values to voltage
        float voltage_vs = (adc_value_vs / 4095.0) * 3.3;
        float voltage_vo = (adc_value_vo / 4095.0) * 3.3;

        ppm_co_val = get_ppm_co(voltage_vo, voltage_vs, est_a, est_b);
        printf("PPM Value of CO = %f ppm \n",ppm_co_val);
        vTaskDelay(1000/portTICK_PERIOD_MS);

    }
}
