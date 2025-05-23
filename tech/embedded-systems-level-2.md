# Embedded Systems Level 2

> I'm doing my first embedded systems project with an ESP32 board.
> This blog series covers my learnings on the way.

[TOC]

My journey continues with this first version of a <abbr title="Pulse Width Modulation">PWM</abbr> controlled fan that triggers when humidity reach some threshold.  

## Connecting parts

![image](https://github.com/user-attachments/assets/ca43b867-d240-461c-9ccd-d64176a22680)

I used the built-in STEMMA QT connectors for the SHT45 humidity sensor.  
For the power, a 12v charger is connected to the 5v usb-c converter and the corresponding pins of the fan connector (yellow and black wires). I just soldered wires togethers and covered with electrical tape.  
I'm using a noctua fan and despite the specs recommanding 5v for PWM control, the 3.3v GPIO output of the ESP32 works perfectly. 

> [!IMPORTANT]
> The logic low must stay below 0.8v for PWM to work proreply. Make sure to share a common ground for the different components for that, notaly by soldering the GND pin on the board.
  
I'm not making use of the Tachometer output to get the actual fan speed, so the green wire is left disconnected.  


## The code

```c
#include <Adafruit_SHT4x.h>
#include <Wire.h>

// General constants
#define ONE_MIN_IN_US             60e6

// Speed at which logs will be sent to the serial console
#define SERIAL_BAUDS              115200

// I2C bus for temp & humidity sensor
#define SHT4_WIRE                 Wire1 

// Fan control
#define FAN_PWM_PIN               A2
#define FAN_PWM_FREQ_HZ           25000
#define FAN_PWM_RESOLUTION_BITS   8
#define FAN_STOPPED               0
#define FAN_HIGH_SPEED            178
#define FAN_MAX_SPEED             255

Adafruit_SHT4x sht4 = Adafruit_SHT4x();

void loop() {
  sensors_event_t humidity, temp;

  sht4.getEvent(&humidity, &temp);
  Serial.print("Humidity: "); Serial.print(humidity.relative_humidity); Serial.println("% rH"); Serial.flush();

  // Fan control
  if (humidity.relative_humidity > 60.0) {
    // Unhealthy humidity level
    ledcWrite(FAN_PWM_PIN, FAN_MAX_SPEED);
  } else if (humidity.relative_humidity > 55.0) {
    // High humidity level
    ledcWrite(FAN_PWM_PIN, FAN_HIGH_SPEED);
  } else {
    // Acceptable humidity level
    ledcWrite(FAN_PWM_PIN, FAN_STOPPED);
  }

  // Sleep for 1 minute
  esp_light_sleep_start();
}


void setup() {
  Serial.begin(SERIAL_BAUDS);
  esp_sleep_enable_timer_wakeup(ONE_MIN_IN_US);
  sht4x_setup();
  ledcAttach(FAN_PWM_PIN, FAN_PWM_FREQ_HZ, FAN_PWM_RESOLUTION_BITS);
}

void sht4x_setup() {
  if (! sht4.begin(&SHT4_WIRE)) {
    Serial.println("Couldn't find SHT4x");
    while (1) delay(10);
  }
  sht4.setPrecision(SHT4X_HIGH_PRECISION);
  // Heater not needed as our environment should never reach 90% rH
  sht4.setHeater(SHT4X_NO_HEATER);
}
```
