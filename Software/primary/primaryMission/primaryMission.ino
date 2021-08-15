// Source: https://github.com/jrowberg/i2cdevlib

#include <Wire.h>
#include <I2Cdev.h>
#include <Adafruit_Sensor.h>
#include <TinyGPS++.h>
#include <Adafruit_BMP280.h>
#include <MPU6050_6Axis_MotionApps20.h>
#include <AK8963.h>



/* =========================================================================
   NOTE: In addition to connection 3.3v, GND, SDA, and SCL, this sketch
   depends on the MPU-6050's INT pin being connected to the Arduino's
   external interrupt pin. 
 * ========================================================================= */


// Print params
#define OUTPUT_READABLE_YAWPITCHROLL
#define OUTPUT_READABLE_WORLDACCEL

// Pins
#define BUZZER_PIN          PB13
#define SD_RESET_PIN        PB14
#define LED_PIN             PC13


#define BMP280_ADDRESS      0x76
#define MPU6500_ADDRESS     0x68
#define COMPASS_ADDRESS     0x0C

#define GPSBaud             9600
#define SDBaud              57600

// konstanta s korekcí měření v hPa
int korekce = 32;

bool blinkState = false;

// MPU control/status vars
bool dmpReady = false;  // set true if DMP init was successful
uint8_t mpuIntStatus;   // holds actual interrupt status byte from MPU
uint8_t devStatus;      // return status after each device operation (0 = success, !0 = error)
uint16_t packetSize;    // expected DMP packet size (default is 42 bytes)
uint16_t fifoCount;     // count of all bytes currently in FIFO
uint8_t fifoBuffer[64]; // FIFO storage buffer

// orientation/motion vars
Quaternion q;           // [w, x, y, z]         quaternion container
VectorInt16 aa;         // [x, y, z]            accel sensor measurements
VectorInt16 aaReal;     // [x, y, z]            gravity-free accel sensor measurements
VectorInt16 aaWorld;    // [x, y, z]            world-frame accel sensor measurements
VectorFloat gravity;    // [x, y, z]            gravity vector
float euler[3];         // [psi, theta, phi]    Euler angle container
float ypr[3];           // [yaw, pitch, roll]   yaw/pitch/roll container and gravity vector

// BMP280 vars
float pressure;
float temperature;

// Compass values
int16_t mx, my, mz;



// ===                      INITIAL SETUP                       ===

// GPS  Serial
HardwareSerial SerialGPS(PA10, PA9);

// SD card Serial
HardwareSerial SerialSD(PA12, PA11);


// TinyGPS++ GPS object
TinyGPSPlus gps;

// BMP280 Temp/Pressure object
Adafruit_BMP280 bmp;

// MPU6500 Gyro/Accel object
MPU6050 mpu;

// AK8963 Compass object
AK8963 compass;

void setup() {
    
    Wire.setSDA(PB9);
    Wire.setSCL(PB8);
    
    Wire.begin();
    Wire.setClock(400000); // 400kHz I2C clock. Comment this line if having compilation difficulties

    pinMode(LED_PIN, OUTPUT);
    pinMode(BUZZER_PIN, OUTPUT);
    digitalWrite(BUZZER_PIN, LOW);
    pinMode(SD_RESET_PIN, OUTPUT);
    digitalWrite(SD_RESET_PIN, HIGH);
    
    
    SerialGPS.begin(GPSBaud);
    
    Serial.begin(115200);

    SerialSD.begin(SDBaud);
    
    // initialize device
    Serial.println(F("Initializing all devices..."));
    
    mpu.initialize();

    if (!bmp.begin(BMP280_ADDRESS)) {  
      Serial.println(F("Could not find a valid BMP280 sensor, check wiring!"));
      while (1);
    }

    CompassInit();
    
    uint8_t whoamibyte;
    
    // verify connection
    Serial.println(F("Testing device connections..."));
    //Serial.println(mpu.getDeviceID(), HEX);
    Serial.println(mpu.getDeviceID() ? F("MPU6500 connection successful") : F("MPU6500 connection failed"));
    Serial.println(compass.testConnection() ? F("Compass connection successful") : F("Compass connection failed"));
    Serial.println(BMP280TestConnection() ? F("BMP280 connection successful") : F("BMP280 connection failed"));
    
    Serial.println("Testing GPS connection");
    while(SerialGPS.available() < 1);
    Serial.println("GPS online");

    Serial.println("Testing SD card connection");
    
    testSD();
    
      
    DMPInit();

    digitalWrite(BUZZER_PIN, HIGH);
    delay(100);
    digitalWrite(BUZZER_PIN, LOW);
    delay(10);
    digitalWrite(BUZZER_PIN, HIGH);
    delay(100);
    digitalWrite(BUZZER_PIN, LOW);
    delay(10);
    digitalWrite(BUZZER_PIN, HIGH);
    delay(100);
    digitalWrite(BUZZER_PIN, LOW);
    delay(10);
}

// ===                    MAIN PROGRAM LOOP                     ===

void loop() {

    delay(100);
    sendAndLogMPU6500Data();
    sendAndLogBMPData();

    if(compass.getDataReady())
    {
      compass.getHeading(&mx, &my, &mz);
      Serial.println("Data:");
      Serial.print(mx);
      Serial.print('\t');
      Serial.print(my);
      Serial.print('\t');
      Serial.println(mz);
      compass.getOverflowStatus();
    }
    
}


bool BMP280TestConnection()
{
    uint8_t buffer[8];
    if (I2Cdev::readByte(BMP280_ADDRESS, 0xD0, buffer) == 1) {
        return (buffer[0] == 0x58);
    }
    return false;
}

void DMPInit()
{
    // wait for ready
    Serial.println(F("\nSend any character to begin DMP programming and demo: "));
    /*
    while (Serial.available() && Serial.read()); // empty buffer
    while (!Serial.available());                 // wait for data
    while (Serial.available() && Serial.read()); // empty buffer again
    */
    // load and configure the DMP
    Serial.println(F("Initializing DMP..."));
    devStatus = mpu.dmpInitialize();

    // supply your own gyro offsets here, scaled for min sensitivity
    mpu.setXGyroOffset(220);
    mpu.setYGyroOffset(76);
    mpu.setZGyroOffset(-85);
    mpu.setZAccelOffset(1788); // 1688 factory default for my test chip

    // make sure it worked (returns 0 if so)
    if (devStatus == 0) {
        // Calibration Time: generate offsets and calibrate our MPU6050
        mpu.CalibrateAccel(6);
        mpu.CalibrateGyro(6);
        mpu.PrintActiveOffsets();
        // turn on the DMP, now that it's ready
        Serial.println(F("Enabling DMP..."));
        mpu.setDMPEnabled(true);

        // set our DMP Ready flag so the main loop() function knows it's okay to use it
        //Serial.println(F("DMP ready! Waiting for first interrupt..."));
        dmpReady = true;

        // get expected DMP packet size for later comparison
        packetSize = mpu.dmpGetFIFOPacketSize();
    } else {
        // ERROR!
        // 1 = initial memory load failed
        // 2 = DMP configuration updates failed
        // (if it's going to break, usually the code will be 1)
        Serial.print(F("DMP Initialization failed (code "));
        Serial.print(devStatus);
        Serial.println(F(")"));
    }
}

void sendAndLogBMPData()
{  
    // get temperature
    temperature = bmp.readTemperature();
    // Get pressure
    pressure = (bmp.readPressure()/100.00) + korekce;
    // Print data
    Serial.print("\nTemperature: ");
    Serial.print(temperature);
    Serial.println(" °C");
    Serial.print("Barometric pressure: ");
    Serial.print(pressure);
    Serial.println(" hPa");
    Serial.println();
    //SerialSD.print()
}

void sendAndLogMPU6500Data()
{

    // if programming failed, don't try to do anything
    if (!dmpReady) return;
    // read a packet from FIFO
    
    if (mpu.dmpGetCurrentFIFOPacket(fifoBuffer)) // Get the Latest packet 
    { 
        
        // display Euler angles in degrees
        mpu.dmpGetQuaternion(&q, fifoBuffer);
        mpu.dmpGetGravity(&gravity, &q);
        mpu.dmpGetYawPitchRoll(ypr, &q, &gravity);
        Serial.print("ypr\t");
        Serial.print(ypr[0] * 180/M_PI);
        Serial.print("\t");
        Serial.print(ypr[1] * 180/M_PI);
        Serial.print("\t");
        Serial.println(ypr[2] * 180/M_PI);
        
        // display initial world-frame acceleration, adjusted to remove gravity
        // and rotated based on known orientation from quaternion
        mpu.dmpGetQuaternion(&q, fifoBuffer);
        mpu.dmpGetAccel(&aa, fifoBuffer);
        mpu.dmpGetGravity(&gravity, &q);
        mpu.dmpGetLinearAccel(&aaReal, &aa, &gravity);
        mpu.dmpGetLinearAccelInWorld(&aaWorld, &aaReal, &q);
        Serial.print("aworld\t");
        Serial.print(aaWorld.x);
        Serial.print("\t");
        Serial.print(aaWorld.y);
        Serial.print("\t");
        Serial.println(aaWorld.z);

        // blink LED to indicate activity
        blinkState = !blinkState;
        digitalWrite(LED_PIN, blinkState);
    
    }
  
}

void getGPSData()
{

    while (SerialGPS.available() > 0)
    gps.encode(SerialGPS.read());

    if (gps.location.isUpdated())
    {
      Serial.print(F("LOCATION: "));
      
      Serial.print(F("ms Raw Lat="));
      Serial.print(gps.location.rawLat().negative ? "-" : "+");
      Serial.print(gps.location.rawLat().deg);
      Serial.print("[+");
      Serial.print(gps.location.rawLat().billionths);
      Serial.print(F(" billionths],  Raw Long="));
      Serial.print(gps.location.rawLng().negative ? "-" : "+");
      Serial.print(gps.location.rawLng().deg);
      Serial.print("[+");
      Serial.print(gps.location.rawLng().billionths);
      Serial.print(F(" billionths],  Lat="));
      Serial.print(gps.location.lat(), 6);
      Serial.print(F(" Long="));
      Serial.println(gps.location.lng(), 6);
    }
  
    else if (gps.date.isUpdated())
    {
      Serial.print(F("DATE       Fix Age="));
      Serial.print(gps.date.age());
      Serial.print(F("ms Raw="));
      Serial.print(gps.date.value());
      Serial.print(F(" Year="));
      Serial.print(gps.date.year());
      Serial.print(F(" Month="));
      Serial.print(gps.date.month());
      Serial.print(F(" Day="));
      Serial.println(gps.date.day());
    }
  
    else if (gps.time.isUpdated())
    {
      Serial.print(F("TIME       Fix Age="));
      Serial.print(gps.time.age());
      Serial.print(F("ms Raw="));
      Serial.print(gps.time.value());
      Serial.print(F(" Hour="));
      Serial.print(gps.time.hour());
      Serial.print(F(" Minute="));
      Serial.print(gps.time.minute());
      Serial.print(F(" Second="));
      Serial.print(gps.time.second());
      Serial.print(F(" Hundredths="));
      Serial.println(gps.time.centisecond());
    }
  
    else if (gps.speed.isUpdated())
    {
      Serial.print(F("SPEED      Fix Age="));
      Serial.print(gps.speed.age());
      Serial.print(F("ms Raw="));
      Serial.print(gps.speed.value());
      Serial.print(F(" Knots="));
      Serial.print(gps.speed.knots());
      Serial.print(F(" MPH="));
      Serial.print(gps.speed.mph());
      Serial.print(F(" m/s="));
      Serial.print(gps.speed.mps());
      Serial.print(F(" km/h="));
      Serial.println(gps.speed.kmph());
    }
  
    else if (gps.course.isUpdated())
    {
      Serial.print(F("COURSE     Fix Age="));
      Serial.print(gps.course.age());
      Serial.print(F("ms Raw="));
      Serial.print(gps.course.value());
      Serial.print(F(" Deg="));
      Serial.println(gps.course.deg());
    }
  
    else if (gps.altitude.isUpdated())
    {
      Serial.print(F("ALTITUDE   Fix Age="));
      Serial.print(gps.altitude.age());
      Serial.print(F("ms Raw="));
      Serial.print(gps.altitude.value());
      Serial.print(F(" Meters="));
      Serial.print(gps.altitude.meters());
      Serial.print(F(" Miles="));
      Serial.print(gps.altitude.miles());
      Serial.print(F(" KM="));
      Serial.print(gps.altitude.kilometers());
      Serial.print(F(" Feet="));
      Serial.println(gps.altitude.feet());
    }
  
    else if (gps.satellites.isUpdated())
    {
      Serial.print(F("SATELLITES Fix Age="));
      Serial.print(gps.satellites.age());
      Serial.print(F("ms Value="));
      Serial.println(gps.satellites.value());
    }
  
    else if (gps.hdop.isUpdated())
    {
      Serial.print(F("HDOP       Fix Age="));
      Serial.print(gps.hdop.age());
      Serial.print(F("ms raw="));
      Serial.print(gps.hdop.value());
      Serial.print(F(" hdop="));
      Serial.println(gps.hdop.hdop());
    } 
  
}

void testSD() {

  digitalWrite(SD_RESET_PIN, LOW);
  delay(100);
  digitalWrite(SD_RESET_PIN, HIGH);
  
  // Put OpenLog into command mode
  SerialSD.print('\x1A');
  SerialSD.print('\x1A');
  SerialSD.print('\x1A');
  
  //Wait for OpenLog to respond with '>' to indicate command mode
  while(1) {
    if(SerialSD.available())
      if(SerialSD.read() == '>') break;
  }
  
  // Read control.txt file
  SerialSD.print("read ");
  SerialSD.println("control.txt"); 

  // Wait until command is echoed
  while(1) {
    if(SerialSD.available())
      if(SerialSD.read() == '\r') break;
  }  

  //This loop will stop listening after 1 second of no characters received
  for(int timeOut = 0 ; timeOut < 1000 ; timeOut++) {
    while(SerialSD.available()) {
      char tempString[100];
      
      int spot = 0;
      while(SerialSD.available()) {
        tempString[spot++] = SerialSD.read();
        if(spot > 98) break;
      }
      tempString[spot] = '\0';
      Serial.write(tempString); //Take the string from OpenLog and push it to the Arduino terminal
      timeOut = 0;
    }

    delay(1);
  }

  // Set OpenLog back to default (logging) mode
  SerialSD.print("reset");

}

void CompassInit()
{

    compass.setMode(AK8963_MODE_CONTINUOUS_100HZ);  // Set magnetometer data resolution and sample ODR
    compass.setResolution(AK8963_RES_16_BIT);

  
}
