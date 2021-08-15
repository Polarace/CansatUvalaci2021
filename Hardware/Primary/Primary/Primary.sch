EESchema Schematic File Version 4
LIBS:Primary-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_ST_STM32F4:STM32F411CEUx U3
U 1 1 6118111B
P 6050 2950
F 0 "U3" H 6000 4628 50  0000 C CNN
F 1 "STM32F411CEUx" H 6000 4537 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-48-1EP_7x7mm_P0.5mm_EP5.6x5.6mm" H 5450 1450 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00115249.pdf" H 6050 2950 50  0001 C CNN
	1    6050 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 1450 5950 1150
$Comp
L power:+3.3V #PWR0101
U 1 1 61181193
P 5950 1150
F 0 "#PWR0101" H 5950 1000 50  0001 C CNN
F 1 "+3.3V" H 5965 1323 50  0000 C CNN
F 2 "" H 5950 1150 50  0001 C CNN
F 3 "" H 5950 1150 50  0001 C CNN
	1    5950 1150
	1    0    0    -1  
$EndComp
Text GLabel 6900 3050 2    50   Input ~ 0
UART2_TX
Text GLabel 6900 3150 2    50   Input ~ 0
UART2_RX
Text GLabel 6900 3850 2    50   Input ~ 0
UART1_RX
Text GLabel 6900 4050 2    50   Input ~ 0
UART6_RX
Text GLabel 6900 3750 2    50   Input ~ 0
UART1_TX
Text GLabel 6900 3950 2    50   Input ~ 0
UART6_TX
Text GLabel 5100 4150 0    50   Input ~ 0
SD_RST
Text GLabel 5100 3750 0    50   BiDi ~ 0
I2C1_SCL
Text GLabel 5100 3850 0    50   BiDi ~ 0
I2C1_SDA
$Comp
L Sensor_Pressure:BMP280 U2
U 1 1 611824DD
P 3150 1750
F 0 "U2" V 3517 1800 50  0000 C CNN
F 1 "BMP280" V 3426 1800 50  0000 C CNN
F 2 "Package_LGA:Bosch_LGA-8_2x2.5mm_P0.65mm_ClockwisePinNumbering" H 3150 1050 50  0001 C CNN
F 3 "https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMP280-DS001-19.pdf" H 3150 1750 50  0001 C CNN
	1    3150 1750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61182654
P 6050 4700
F 0 "#PWR0102" H 6050 4450 50  0001 C CNN
F 1 "GND" H 6055 4527 50  0000 C CNN
F 2 "" H 6050 4700 50  0001 C CNN
F 3 "" H 6050 4700 50  0001 C CNN
	1    6050 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4550 6050 4700
Wire Wire Line
	2750 1650 2650 1650
Wire Wire Line
	2650 1650 2650 1500
$Comp
L power:+3.3V #PWR0103
U 1 1 611828E6
P 2650 1500
F 0 "#PWR0103" H 2650 1350 50  0001 C CNN
F 1 "+3.3V" H 2665 1673 50  0000 C CNN
F 2 "" H 2650 1500 50  0001 C CNN
F 3 "" H 2650 1500 50  0001 C CNN
	1    2650 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1750 3650 1750
Wire Wire Line
	3650 1750 3650 1900
$Comp
L power:GND #PWR0104
U 1 1 61182A40
P 3650 1900
F 0 "#PWR0104" H 3650 1650 50  0001 C CNN
F 1 "GND" H 3655 1727 50  0000 C CNN
F 2 "" H 3650 1900 50  0001 C CNN
F 3 "" H 3650 1900 50  0001 C CNN
	1    3650 1900
	1    0    0    -1  
$EndComp
Text GLabel 2950 2250 3    50   BiDi ~ 0
I2C1_SCL
Text GLabel 3050 2250 3    50   BiDi ~ 0
I2C1_SDA
$Comp
L Sensor_Motion:MPU-9250 U1
U 1 1 61182E21
P 3000 4100
F 0 "U1" H 3000 3114 50  0000 C CNN
F 1 "MPU-9250" H 3000 3023 50  0000 C CNN
F 2 "Sensor_Motion:InvenSense_QFN-24_3x3mm_P0.4mm" H 3000 3100 50  0001 C CNN
F 3 "https://store.invensense.com/datasheets/invensense/MPU9250REV1.0.pdf" H 3000 3950 50  0001 C CNN
	1    3000 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 61182ED4
P 3000 5250
F 0 "#PWR0105" H 3000 5000 50  0001 C CNN
F 1 "GND" H 3005 5077 50  0000 C CNN
F 2 "" H 3000 5250 50  0001 C CNN
F 3 "" H 3000 5250 50  0001 C CNN
	1    3000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5250 3000 5000
$Comp
L power:+3.3V #PWR0106
U 1 1 6118303C
P 3100 3100
F 0 "#PWR0106" H 3100 2950 50  0001 C CNN
F 1 "+3.3V" H 3115 3273 50  0000 C CNN
F 2 "" H 3100 3100 50  0001 C CNN
F 3 "" H 3100 3100 50  0001 C CNN
	1    3100 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3100 3100 3200
Text GLabel 2150 4000 0    50   BiDi ~ 0
I2C1_SCL
Text GLabel 3850 4100 2    50   BiDi ~ 0
I2C1_SCL
Text GLabel 3850 4000 2    50   BiDi ~ 0
I2C1_SDA
Text GLabel 2150 3800 0    50   BiDi ~ 0
I2C1_SDA
$Comp
L RF_GPS:RXM-GPS-RM U4
U 1 1 61183E8C
P 9300 2050
F 0 "U4" H 9841 2096 50  0000 L CNN
F 1 "GT-U7" H 9841 2005 50  0000 L CNN
F 2 "RF_Module:Linx_RXM-GPS" H 9900 1450 50  0001 C CNN
F 3 "https://linxtechnologies.com/wp/wp-content/uploads/rxm-gps-rm.pdf" H 9600 1750 50  0001 C CNN
	1    9300 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1450 9200 1300
$Comp
L power:+3.3V #PWR0107
U 1 1 61184354
P 9200 1300
F 0 "#PWR0107" H 9200 1150 50  0001 C CNN
F 1 "+3.3V" H 9215 1473 50  0000 C CNN
F 2 "" H 9200 1300 50  0001 C CNN
F 3 "" H 9200 1300 50  0001 C CNN
	1    9200 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 611843BA
P 9300 2800
F 0 "#PWR0108" H 9300 2550 50  0001 C CNN
F 1 "GND" H 9305 2627 50  0000 C CNN
F 2 "" H 9300 2800 50  0001 C CNN
F 3 "" H 9300 2800 50  0001 C CNN
	1    9300 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2650 9300 2800
Text GLabel 8650 2250 0    50   Input ~ 0
UART1_TX
Text GLabel 8650 2350 0    50   Input ~ 0
UART1_RX
$Comp
L utility:OpenLog U5
U 1 1 61185537
P 9300 3950
F 0 "U5" H 9300 4365 50  0000 C CNN
F 1 "OpenLog" H 9300 4274 50  0000 C CNN
F 2 "" H 9200 4250 50  0001 C CNN
F 3 "" H 9200 4250 50  0001 C CNN
	1    9300 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 61185625
P 9900 4000
F 0 "#PWR0109" H 9900 3750 50  0001 C CNN
F 1 "GND" H 9905 3827 50  0000 C CNN
F 2 "" H 9900 4000 50  0001 C CNN
F 3 "" H 9900 4000 50  0001 C CNN
	1    9900 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 6118569E
P 9900 3900
F 0 "#PWR0110" H 9900 3750 50  0001 C CNN
F 1 "+3.3V" H 9915 4073 50  0000 C CNN
F 2 "" H 9900 3900 50  0001 C CNN
F 3 "" H 9900 3900 50  0001 C CNN
	1    9900 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 3900 9700 3900
Wire Wire Line
	9700 4000 9900 4000
Text GLabel 8800 4100 0    50   Output ~ 0
SD_RST
Text GLabel 8800 4000 0    50   Input ~ 0
UART6_TX
Text GLabel 8800 3900 0    50   Output ~ 0
UART6_RX
$Comp
L Device:Buzzer BZ1
U 1 1 61186919
P 8400 5050
F 0 "BZ1" H 8406 4725 50  0000 C CNN
F 1 "Buzzer" H 8406 4816 50  0000 C CNN
F 2 "" V 8375 5150 50  0001 C CNN
F 3 "~" V 8375 5150 50  0001 C CNN
	1    8400 5050
	-1   0    0    1   
$EndComp
Text GLabel 5100 4250 0    50   Input ~ 0
BUZZER
Text GLabel 8700 4950 2    50   Input ~ 0
BUZZER
Wire Wire Line
	8700 4950 8500 4950
Wire Wire Line
	8500 5150 8700 5150
Wire Wire Line
	8700 5150 8700 5200
$Comp
L power:GND #PWR0111
U 1 1 611876DC
P 8700 5200
F 0 "#PWR0111" H 8700 4950 50  0001 C CNN
F 1 "GND" H 8705 5027 50  0000 C CNN
F 2 "" H 8700 5200 50  0001 C CNN
F 3 "" H 8700 5200 50  0001 C CNN
	1    8700 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 4100 8900 4100
Wire Wire Line
	8800 3900 8900 3900
Wire Wire Line
	8800 4000 8900 4000
Wire Wire Line
	6650 3050 6900 3050
Wire Wire Line
	6650 3150 6900 3150
Wire Wire Line
	6650 3750 6900 3750
Wire Wire Line
	6650 3850 6900 3850
Wire Wire Line
	6650 3950 6900 3950
Wire Wire Line
	6650 4050 6900 4050
Wire Wire Line
	5100 3750 5350 3750
Wire Wire Line
	5100 3850 5350 3850
Wire Wire Line
	5100 4150 5350 4150
Wire Wire Line
	5100 4250 5350 4250
Wire Wire Line
	8650 2250 8800 2250
Wire Wire Line
	8800 2350 8650 2350
Wire Wire Line
	2950 2150 2950 2250
Wire Wire Line
	3050 2150 3050 2250
Wire Wire Line
	3700 4000 3850 4000
Wire Wire Line
	3850 4100 3700 4100
Wire Wire Line
	2150 3800 2300 3800
Wire Wire Line
	2150 4000 2300 4000
NoConn ~ 9400 1450
NoConn ~ 8800 1850
NoConn ~ 8800 1950
NoConn ~ 9800 2050
NoConn ~ 5850 4550
NoConn ~ 5950 4550
NoConn ~ 6150 4550
NoConn ~ 6250 4550
NoConn ~ 6650 4350
NoConn ~ 6650 4250
NoConn ~ 6650 4150
NoConn ~ 6650 3650
NoConn ~ 6650 3550
NoConn ~ 6650 3450
NoConn ~ 6650 3350
NoConn ~ 6650 3250
NoConn ~ 6650 2950
NoConn ~ 6650 2850
NoConn ~ 5350 3350
NoConn ~ 5350 3250
NoConn ~ 5350 3150
NoConn ~ 5350 3050
NoConn ~ 5350 2950
NoConn ~ 5350 2250
NoConn ~ 5350 2350
NoConn ~ 5350 2550
NoConn ~ 5350 2650
NoConn ~ 5350 2750
NoConn ~ 5350 1650
NoConn ~ 5350 1850
NoConn ~ 5350 2050
NoConn ~ 5850 1450
NoConn ~ 6050 1450
NoConn ~ 6150 1450
NoConn ~ 6250 1450
NoConn ~ 3150 2150
NoConn ~ 3250 2150
NoConn ~ 3450 1650
NoConn ~ 2750 1750
NoConn ~ 2900 3200
NoConn ~ 2300 3900
NoConn ~ 2300 4100
NoConn ~ 2300 4300
NoConn ~ 3700 4300
NoConn ~ 3700 4400
NoConn ~ 3700 4500
NoConn ~ 3700 3800
NoConn ~ 1050 2400
NoConn ~ 5350 3450
NoConn ~ 5350 3550
NoConn ~ 5350 3650
NoConn ~ 5350 3950
NoConn ~ 5350 4050
NoConn ~ 5350 4350
$EndSCHEMATC
