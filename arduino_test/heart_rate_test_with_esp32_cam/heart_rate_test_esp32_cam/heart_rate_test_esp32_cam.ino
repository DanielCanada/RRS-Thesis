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
int noReadings = 0;
bool incap = false;
int isSent = 0;
const int SensorSignal = 12;


void setup() {  
  Serial.begin(115200);
  Serial.println("Initializing... ");
  delay(1000);
  I2CSensors.begin(I2C_SDA, I2C_SCL, I2C_FREQ);
  delay(500);
  particleSensor.begin(I2CSensors, I2C_SPEED_FAST); //Use new I2C port, 400kHz speed
  particleSensor.setup(); //Configure sensor with default settings
  particleSensor.setPulseAmplitudeRed(0x0A); //Turn Red LED to low to indicate sensor is running
  pinMode(2, OUTPUT);
  pinMode(SensorSignal, INPUT);
}

void getMeasurements() {
    long irValue = particleSensor.getIR();    //Reading the IR value it will permit us to know if there's a finger on the sensor or not
    if(irValue > 7000){                                           //If a finger is detected           
      if (checkForBeat(irValue) == true)                        //If a heart beat is detected
      {
        Serial.println("-------------");
        Serial.print("BPM: ");             
        Serial.print(beatAvg);
        Serial.println("");
        Serial.println("-------------");
        Serial.println("");
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
        if (beatAvg > 100){   // high BPM tolerance value
          Serial.println("HIGH BPM DETECTED!");
          isSent = 1;        // signal pic to send transmission
          if(isSent == 1){
            digitalWrite(2, HIGH);
            delay(5000);
            digitalWrite(2, LOW);
            isSent = 2;
          }
        }else{
          incap = false;
          isSent = 0;
          if(isSent == 0){
            digitalWrite(2, LOW);
            delay(500);
          }
        }
      }

    }
    if (irValue < 7000){       //If no finger is detected or is not attached to wrist, it inform the user and put the average BPM to 0 or it will be stored for the next measure
      beatAvg=0;
      noReadings++;
      if (noReadings > 950){ // about 10 seconds of not detecting
        incap = true;
        noReadings = 0;
      }
      Serial.println("--------------------------------------------------");
      if(incap){
          Serial.println("person in danger!");
          isSent = 1;        // signal pic to send transmission
          if(isSent == 1){
            digitalWrite(2, HIGH);
            delay(5000);
            digitalWrite(2, LOW);
            isSent = 2;
          }
      }else{
          Serial.println("Please Place Your finger");
      }
      Serial.println("--------------------------------------------------");  
    }
}

void loop() {
  int sensor_state = digitalRead(SensorSignal);
  if(sensor_state == HIGH){
    getMeasurements();
  }else{
    Serial.println("IDLE... awaiting signal from System Controller...");
    delay(2000);
  }
}