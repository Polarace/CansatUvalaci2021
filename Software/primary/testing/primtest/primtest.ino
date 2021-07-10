#include <stdio.h>
#include <string.h>

/* Includes */
#include <Wire.h>
#include <SPI.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h>



/* Defines */

#define LED_PIN       PC13

#define BMP280_ADRESS (0x76)

#define KOREKCE       32                       // konstanta s korekcí měření v hPa
#define HC12_SET_PIN  PB4
/* Variables */
uint32_t MsgCnt = 0;


unsigned long timer = millis();                 // Delay Timer

char UART1ByteIn;                              // Temporary variable
char HC12ByteIn;                                // Temporary variable

char buffer[128];

String HC12ReadBuffer = "";                     // Read/Write Buffer 1 for HC12
String UART1ReadBuffer = "";                   // Read/Write Buffer 2 for UART1

String TempBuffer = "Empty!";
String PresBuffer = "Empty!";


boolean UART1End = false;                      // Flag to indicate End of UART1 String
boolean HC12End = false;                        // Flag to indiacte End of HC12 String
boolean commandMode = false;                    // Send AT commands

float tlak;



/* Peripherals instances */
HardwareSerial HC12(PA3, PA2);
HardwareSerial UART1(PA10, PA9);

Adafruit_BMP280 bmp;

void setup() {

  Wire.setSDA(PB9);
  Wire.setSCL(PB8);

  HC12ReadBuffer.reserve(64);                   // Reserve 64 bytes for Serial message input
  UART1ReadBuffer.reserve(64);                 // Reserve 64 bytes for HC12 message input

  pinMode(HC12_SET_PIN, OUTPUT);                  // Output High for Transparent / Low for Command
  pinMode(LED_PIN, OUTPUT);
  digitalWrite(HC12_SET_PIN, HIGH);               // Enter Transparent mode
  digitalWrite(LED_PIN, HIGH);
  delay(80);                                    // 80 ms delay before operation per datasheet
  UART1.begin(9600);                           // Open serial port to computer

  /* Init bs */
  UART1.println(F("BMP280 Initialization"));
  HC12.begin(9600);                             // Open software UART1 port to HC12


  
  if (!bmp.begin(BMP280_ADRESS)) {  
    UART1.println(F("Could not find a valid BMP280 sensor, check wiring!"));
    while (1);
  }

  digitalWrite(LED_PIN, LOW);

  
}

void loop() {

  digitalWrite(LED_PIN, HIGH);

  // Print message count
  HC12.print(MsgCnt);
  HC12.print(" |");

  // Fetch values
  TempBuffer = " Temp = " + String(bmp.readTemperature());
  
  PresBuffer = String(bmp.readPressure()/100.00 + KOREKCE);

  // Print temperature
  HC12.print(TempBuffer);
  UART1.println(TempBuffer);
  delay(60);
  HC12.print(" *C ");

  delay(60);
  
  UART1.println(PresBuffer);

  HC12.print(" Pressure = ");  
  delay(60);
  HC12.print(PresBuffer);
  delay(60);
  HC12.println(" Pa");

  MsgCnt++;
  
  digitalWrite(LED_PIN, LOW);

  delay(500);

/*
  while (HC12.available()) {                    // While Arduino's HC12 soft UART1 rx buffer has data
    HC12ByteIn = HC12.read();                   // Store each character from rx buffer in byteIn
    HC12ReadBuffer += char(HC12ByteIn);         // Write each character of byteIn to HC12ReadBuffer
    if (HC12ByteIn == '\n') {                   // At the end of the line
      HC12End = true;                           // Set HC12End flag to true
    }
  }

  while (UART1.available()) {                  // If Arduino's computer rx buffer has data
    UART1ByteIn = UART1.read();               // Store each character in byteIn
    UART1ReadBuffer += char(UART1ByteIn);     // Write each character of byteIn to UART1ReadBuffer
    if (UART1ByteIn == '\n') {                 // Check to see if at the end of the line
      UART1End = true;                         // Set UART1End flag to indicate end of line
    }
  }

  if (UART1End) {                              // Check to see if UART1End flag is true

    if (UART1ReadBuffer.startsWith("AT")) {    // Has a command been sent from local computer
      HC12.print(UART1ReadBuffer);             // Send local command to remote HC12 before changing settings
      delay(100);                               //
      digitalWrite(HC12_SET_PIN, LOW);            // Enter command mode
      delay(100);                               // Allow chip time to enter command mode
      UART1.print(UART1ReadBuffer);           // Echo command to UART1
      HC12.print(UART1ReadBuffer);             // Send command to local HC12
      delay(500);                               // Wait 0.5s for a response
      digitalWrite(HC12_SET_PIN, HIGH);           // Exit command / enter transparent mode
      delay(100);                               // Delay before proceeding
    } else {
      HC12.print(UART1ReadBuffer);             // Transmit non-command message
    }
    UART1ReadBuffer = "";                      // Clear UART1ReadBuffer
    UART1End = false;                          // Reset UART1 end of line flag
  }

  if (HC12End) {                                // If HC12End flag is true
    if (HC12ReadBuffer.startsWith("AT")) {      // Check to see if a command is received from remote
      digitalWrite(HC12_SET_PIN, LOW);            // Enter command mode
      delay(100);                               // Delay before sending command
      UART1.print(UART1ReadBuffer);           // Echo command to UART1.
      HC12.print(HC12ReadBuffer);               // Write command to local HC12
      delay(500);                               // Wait 0.5 s for reply
      digitalWrite(HC12_SET_PIN, HIGH);           // Exit command / enter transparent mode
      delay(100);                               // Delay before proceeding
      HC12.println("Remote Command Executed");  // Acknowledge execution
    } else {
      UART1.print(HC12ReadBuffer);             // Send message to screen
    }
    HC12ReadBuffer = "";                        // Empty buffer
    HC12End = false;                            // Reset flag
  }
  */
}
