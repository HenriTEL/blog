# Embedded Systems Level 1

> I'm doing my first embedded systems project with an ESP32 board.
> This blog series covers my learnings on the way.

[TOC]

## Breadboard

Below is a breadboard with examples of what the underlying "solderless wiring" aka  look like drawn on it.  
It consists of 4 blocks:
* On the sides we have 2 bus strips noted by the - and + symbols for ground and supply voltage respectively.
* In the middle we have 2 terminal strips separated by a notch at the middle of the borad. Each row on those terminal strips are labelled with a row number corresponding to 5 electrically conected clips.

![image](https://github.com/user-attachments/assets/6d2a2a62-ee36-4944-aa38-2bdce43a9eed)

## LEDs

⚠️ LEDs need to be connected in a specific way with the longer leg connected to the + side and the shorter one to the -.  
This property makes an easy way to find which wire corresponds to the ground on an power supply.  
⚠️ LEDs have an operating voltage range that depends on the color. If you have 3.3v choose white, green and blue LEDs over red that operate below 3v. Use resistors if needed.  
![image](https://github.com/user-attachments/assets/ec365f11-c2b2-44c7-9924-f37fbd7cde73)  
Not following the above rules will destroy the LED.  

## ESP32

To navigate your ESP32 board you'll need 2 maps.
1. The datasheet for your ESP32 chip variant, for example my ESP32-PICO-V3-02 is covered by the ESP32-PICO Series datasheet.  
You can find it on the official [espressif website](https://www.espressif.com/en/support/documents/technical-documents).  
Most importantly you'll find the pin layout and for each pin its capabilities.  
2. The pinout schematics for your board. Your ESP32 will be soldered on a board with other components. You'll need this map to know which ESP32 pin is actually available and its position on the board. This documentation is typically available on the board vendor's website.

Once you find the right pin for your usecase, use the number from the chip's datasheet in your code and use the corresponding label in the board's schematics for wiring.

## Programming tools

**TL;DR** for your first projects, stick to the Arduino IDE and C.

At first I thought that rust would be a good fit for this project but after hours spent reading the official documentation, installing requirements, setting up VS code, looking for crates and examples, etc. I decided to give Arduino a try.  
In a few minutes I was able install the IDE, set it up for ESP32 and run one of the provided examples on my board.  
Then I simply used the libraries suggested by the board's vendor to integrate with my sensor, and in a few lines of code I got my humididy levels printed in real time in the serial console.  
Then when I had an issue it was either about Electronics, Arduino IDE, C or ESP32 and each of those has decades old communities (ok, almost 1 decade for ESP32).  
Which mean plenty of answers for each of my problem, and more knowledgable LLMs.  
