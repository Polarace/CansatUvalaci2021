EESchema Schematic File Version 4
EELAYER 30 0
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
L Sensor_Pressure:BMP280 U3
U 1 1 61B10E58
P 1500 4950
F 0 "U3" H 1730 5046 50  0000 L CNN
F 1 "BMP280" H 1730 4955 50  0000 L CNN
F 2 "Package_LGA:Bosch_LGA-8_2x2.5mm_P0.65mm_ClockwisePinNumbering" H 1500 4250 50  0001 C CNN
F 3 "https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMP280-DS001.pdf" H 1500 4950 50  0001 C CNN
	1    1500 4950
	1    0    0    -1  
$EndComp
$Comp
L RF_GPS:RXM-GPS-FM U1
U 1 1 61B11E32
P 3100 2750
F 0 "U1" H 3644 2796 50  0000 L CNN
F 1 "RXM-GPS-FM" H 3644 2705 50  0000 L CNN
F 2 "RF_GPS:Linx_RXM-GPS" H 3600 2200 50  0001 C CNN
F 3 "https://linxtechnologies.com/wp/wp-content/uploads/rxm-gps-fm.pdf" H 3400 2450 50  0001 C CNN
	1    3100 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR01
U 1 1 61E9FBF1
P 1600 4550
F 0 "#PWR01" H 1600 4400 50  0001 C CNN
F 1 "+3.3V" H 1615 4723 50  0000 C CNN
F 2 "" H 1600 4550 50  0001 C CNN
F 3 "" H 1600 4550 50  0001 C CNN
	1    1600 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR03
U 1 1 61EA15B3
P 5250 2000
F 0 "#PWR03" H 5250 1850 50  0001 C CNN
F 1 "+3.3V" H 5265 2173 50  0000 C CNN
F 2 "" H 5250 2000 50  0001 C CNN
F 3 "" H 5250 2000 50  0001 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61EA283E
P 5150 3800
F 0 "#PWR02" H 5150 3550 50  0001 C CNN
F 1 "GND" H 5155 3627 50  0000 C CNN
F 2 "" H 5150 3800 50  0001 C CNN
F 3 "" H 5150 3800 50  0001 C CNN
	1    5150 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3050 2600 3550
Wire Wire Line
	2600 3550 4100 3550
Wire Wire Line
	4100 3550 4100 6650
Wire Wire Line
	4100 6650 3650 6650
$Comp
L MCU_ST_STM32F4:STM32F411CEUx U4
U 1 1 61E923A2
P 3050 5750
F 0 "U4" H 3000 7431 50  0000 C CNN
F 1 "STM32F411CEUx" H 3000 7340 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-48-1EP_7x7mm_P0.5mm_EP5.6x5.6mm" H 2450 4250 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00115249.pdf" H 3050 5750 50  0001 C CNN
	1    3050 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2950 2500 2950
Wire Wire Line
	2500 2950 2500 3650
Wire Wire Line
	2500 3650 4000 3650
Wire Wire Line
	4000 3650 4000 6550
Wire Wire Line
	4000 6550 3650 6550
Wire Wire Line
	2350 6550 2100 6550
Wire Wire Line
	850  6550 850  4750
Wire Wire Line
	850  4750 1100 4750
Wire Wire Line
	2350 6650 2150 6650
Wire Wire Line
	700  6650 700  4850
Wire Wire Line
	700  4850 1100 4850
Wire Wire Line
	4450 2600 4250 2600
Wire Wire Line
	5850 2800 6050 2800
Wire Wire Line
	6050 2800 6050 4100
Wire Wire Line
	6050 4100 4250 4100
Wire Wire Line
	4450 2800 4350 2800
Wire Wire Line
	4350 2800 4350 4000
Wire Wire Line
	5850 2900 5950 2900
Wire Wire Line
	4250 3950 2100 3950
Wire Wire Line
	2100 3950 2100 6550
Wire Wire Line
	4250 2600 4250 3950
Connection ~ 4250 3950
Wire Wire Line
	4250 3950 4250 4100
Connection ~ 2100 6550
Wire Wire Line
	2100 6550 850  6550
Wire Wire Line
	4350 4000 2150 4000
Wire Wire Line
	2150 4000 2150 6650
Connection ~ 2150 6650
Wire Wire Line
	2150 6650 700  6650
$Comp
L Sensor_Motion:MPU-9250 U2
U 1 1 61B0E4D1
P 5150 2900
F 0 "U2" H 5150 1911 50  0000 C CNN
F 1 "MPU-9250" H 5150 1820 50  0000 C CNN
F 2 "Sensor_Motion:InvenSense_QFN-24_3x3mm_P0.4mm" H 5150 1900 50  0001 C CNN
F 3 "https://store.invensense.com/datasheets/invensense/MPU9250REV1.0.pdf" H 5150 2750 50  0001 C CNN
	1    5150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2900 5950 4000
Wire Wire Line
	5950 4000 4350 4000
Connection ~ 4350 4000
$Comp
L Connector:Conn_01x06_Female openlog1
U 1 1 6232547F
P 6100 5700
F 0 "openlog1" H 6128 5676 50  0000 L CNN
F 1 "Conn_01x06_Female" H 6128 5585 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 6100 5700 50  0001 C CNN
F 3 "~" H 6100 5700 50  0001 C CNN
	1    6100 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 6350 5650 6350
Wire Wire Line
	5650 6350 5650 5600
Wire Wire Line
	5650 5600 5900 5600
Wire Wire Line
	3650 6250 5750 6250
Wire Wire Line
	5750 6250 5750 5700
Wire Wire Line
	5750 5700 5900 5700
Text Notes 5450 6000 0    55   ~ 0
GRN\nRX\nTX\nVCC\nGND\nBLK
$Comp
L power:GND #PWR0101
U 1 1 6232E610
P 3150 7400
F 0 "#PWR0101" H 3150 7150 50  0001 C CNN
F 1 "GND" H 3155 7227 50  0000 C CNN
F 2 "" H 3150 7400 50  0001 C CNN
F 3 "" H 3150 7400 50  0001 C CNN
	1    3150 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 7350 3150 7400
$Comp
L power:GND #PWR0102
U 1 1 6232F53D
P 3100 3350
F 0 "#PWR0102" H 3100 3100 50  0001 C CNN
F 1 "GND" H 3105 3177 50  0000 C CNN
F 2 "" H 3100 3350 50  0001 C CNN
F 3 "" H 3100 3350 50  0001 C CNN
	1    3100 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 62330045
P 5850 6000
F 0 "#PWR0103" H 5850 5750 50  0001 C CNN
F 1 "GND" H 5855 5827 50  0000 C CNN
F 2 "" H 5850 6000 50  0001 C CNN
F 3 "" H 5850 6000 50  0001 C CNN
	1    5850 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 6000 5900 6000
Wire Wire Line
	5900 5900 5850 5900
Wire Wire Line
	5850 5900 5850 6000
Connection ~ 5850 6000
Wire Wire Line
	5900 5800 5850 5800
Wire Wire Line
	5850 5800 5850 5450
$Comp
L power:VCC #PWR0104
U 1 1 62333329
P 5850 5450
F 0 "#PWR0104" H 5850 5300 50  0001 C CNN
F 1 "VCC" H 5865 5623 50  0000 C CNN
F 2 "" H 5850 5450 50  0001 C CNN
F 3 "" H 5850 5450 50  0001 C CNN
	1    5850 5450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
