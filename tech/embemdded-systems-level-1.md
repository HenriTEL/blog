# Embedded Systems Level 1

> I'm doing my first embedded systems project with an ESP32 board.
> This blog series covers my learnings on the way.

[TOC]

## Wireing and parts

Below is an image of a breadboard used to wire electronic parts.  
I've drawed on it what the underlying wireing looks like.  
![image](https://github.com/user-attachments/assets/6d2a2a62-ee36-4944-aa38-2bdce43a9eed)

⚠️ LEDs need to be connected in a specific way with the longer leg connected to the + side and the shorter one to the -.  
⚠️ LEDs have an operating voltage range that depends on the color. If you have 3.3v choose white, green and blue LEDs over red that operate below 3v. Use resistors if needed.  
If you don't follow the above rules you'll destroy the LED.
![image](https://github.com/user-attachments/assets/ec365f11-c2b2-44c7-9924-f37fbd7cde73)

## Programming tools

**TL;DR** for your first projects, stick to the Arduino IDE and C.

At first I thought this project would be a good opportunity to deepen my knowledge of rust.  
Well... After a few hours spent reading the official documentation, installing requirements, setting up VS code, looking for crates and examples, etc.  
I decided to simply install the arduino IDE, set it up for ESP32 in a few clicks and run one of the provided examples.  
And it worked! And then I simply used the libraries suggested by my vendor to integrate with my sensor, and it worked too.  
Then when I had an issue it was either about electroncs, arduino, c or ESP32 and each of those has huge decades old communities (ok, almost 1 decade for ESP32).  
Which mean plenty of answers for each of my problem, and more knowledgable LLMs.

