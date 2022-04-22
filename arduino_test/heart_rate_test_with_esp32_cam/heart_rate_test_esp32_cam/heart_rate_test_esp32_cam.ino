#include "Arduino.h"
#include <Wire.h>
#include "MAX30105.h"           //MAX3010x library
#include "heartRate.h"          //Heart rate calculating algorithm

MAX30105 particleSensor;
#define I2C_SDA 14 // SDA Connected to GPIO 14
#define I2C_SCL 15 // SCL Connected to GPIO 15
TwoWire I2CSensors = TwoWire(0);
uint32_t I2C_FREQ = 1000000;

const byte RATE_SIZE = 4; //Increase this for more averaging. 4 is good.
byte rates[RATE_SIZE]; //Array of heart rates
byte rateSpot = 0;
long lastBeat = 0; //Time at which the last beat occurred
float beatsPerMinute;
int beatAvg;
int read = 0;


void setup() {  
  Serial.begin(115200);
  Serial.println("Initializing... ");
  delay(1000);
  I2CSensors.begin(I2C_SDA, I2C_SCL, I2C_FREQ);
  delay(500);
  particleSensor.begin(I2CSensors, I2C_SPEED_FAST); //Use new I2C port, 400kHz speed
  particleSensor.setup(); //Configure sensor with default settings
  particleSensor.setPulseAmplitudeRed(0x0A); //Turn Red LED to low to indicate sensor is running
}

void loop() {
  long irValue = particleSensor.getIR();    //Reading the IR value it will permit us to know if there's a finger on the sensor or not
  if(irValue > 7000){                                           //If a finger is detected           
    //Serial.print("BPM: ");
    //Serial.print(beatAvg);
    //Serial.println("");
    if (checkForBeat(irValue) == true)                        //If a heart beat is detected
    {
      //Serial.print("BPM: ");             
      //Serial.print(beatAvg);
      Serial.println("**************************************************");
      Serial.print("BPM: ");             
      Serial.print(beatAvg);
      Serial.println("");
      Serial.println("**************************************************");


      delay(100);
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
  if (irValue < 7000){       //If no finger is detected or is not attached to wrist, it inform the user and put the average BPM to 0 or it will be stored for the next measure
     beatAvg=0;
     Serial.println("Please Place Your finger");   
  }
}