#include <spo2_algorithm.h>

/* This code works with MAX30102 + 128x32 OLED i2c + Buzzer and Arduino UNO
 * It's displays the Average BPM on the screen, with an animation and a buzzer sound
 * everytime a heart pulse is detected
 * It's a modified version of the HeartRate library example
 * Refer to www.surtrtech.com for more details or SurtrTech YouTube channel
 */

//#include <Adafruit_GFX.h>        //OLED libraries
//#include <Adafruit_SSD1306.h>
#include <Wire.h>
#include "MAX30105.h"           //MAX3010x library
#include "heartRate.h"          //Heart rate calculating algorithm

MAX30105 particleSensor;

const byte RATE_SIZE = 4; //Increase this for more averaging. 4 is good.
byte rates[RATE_SIZE]; //Array of heart rates
byte rateSpot = 0;
long lastBeat = 0; //Time at which the last beat occurred
float beatsPerMinute;
int beatAvg;

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels
#define OLED_RESET    -1 // Reset pin # (or -1 if sharing Arduino reset pin)

//Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET); //Declaring the display name (display)

void setup() {  
  
  Serial.begin(9600);
  // Initialize sensor
  delay(3000);
  Serial.println("Initializing... ");
  particleSensor.begin(Wire, I2C_SPEED_FAST); //Use default I2C port, 400kHz speed
  particleSensor.setup(); //Configure sensor with default settings
  particleSensor.setPulseAmplitudeRed(0x0A); //Turn Red LED to low to indicate sensor is running

}

void loop() {
 long irValue = particleSensor.getIR();    //Reading the IR value it will permit us to know if there's a finger on the sensor or not
                                           //Also detecting a heartbeat
if(irValue > 7000){                                           //If a finger is detected
    //display.clearDisplay();                                   //Clear the display
    //display.drawBitmap(5, 5, logo2_bmp, 24, 21, WHITE);       //Draw the first bmp picture (little heart)
    //display.setTextSize(2);                                   //Near it display the average BPM you can display the BPM if you want
    //display.setTextColor(WHITE); 
    //display.setCursor(50,0);                
    //display.println("BPM");             
    Serial.print("BPM: ");
    Serial.print(beatAvg);
    //display.setCursor(50,18);                
    //display.println(beatAvg); 
    //display.display();
    Serial.println("");
    
  if (checkForBeat(irValue) == true)                        //If a heart beat is detected
  {
    //display.clearDisplay();                                //Clear the display
    //display.drawBitmap(0, 0, logo3_bmp, 32, 32, WHITE);    //Draw the second picture (bigger heart)
    //display.setTextSize(2);                                //And still displays the average BPM
    //display.setTextColor(WHITE);             
    //display.setCursor(50,0);                
    //display.println("BPM");
    Serial.print("BPM: ");             
    //display.setCursor(50,18);                
    //display.println(beatAvg);
    Serial.print(beatAvg); 
    //display.display();
    //tone(3,1000);                                        //And tone the buzzer for a 100ms you can reduce it it will be better
    delay(100);
    //noTone(3);                                          //Deactivate the buzzer to have the effect of a "bip"
    //We sensed a beat!
    long delta = millis() - lastBeat;                   //Measure duration between two beats
    lastBeat = millis();

    beatsPerMinute = 60 / (delta / 1000.0);           //Calculating the BPM

    if (beatsPerMinute < 255 && beatsPerMinute > 20)               //To calculate the average we strore some values (4) then do some math to calculate the average
    {
      rates[rateSpot++] = (byte)beatsPerMinute; //Store this reading in the array
      rateSpot %= RATE_SIZE; //Wrap variable

      //Take average of readings
      beatAvg = 0;
      for (byte x = 0 ; x < RATE_SIZE ; x++)
        beatAvg += rates[x];
      beatAvg /= RATE_SIZE;
    }
  }

}
  if (irValue < 7000){       //If no finger is detected it inform the user and put the average BPM to 0 or it will be stored for the next measure
     beatAvg=0;
     Serial.println("Please Place Your finger"); 
     //noTone(3);
     }

}