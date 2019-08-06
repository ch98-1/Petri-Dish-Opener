EESchema Schematic File Version 4
LIBS:Petri Dish Opener-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "lun. 30 mars 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8950 1450 1    60   ~ 0
Vin
Text Label 9350 1450 1    60   ~ 0
IOREF
Text Label 8900 2500 0    60   ~ 0
A0
Text Label 8900 2600 0    60   ~ 0
A1
Text Label 8900 2700 0    60   ~ 0
A2
Text Label 8900 2800 0    60   ~ 0
A3
Text Label 8900 2900 0    60   ~ 0
A4(SDA)
Text Label 8900 3000 0    60   ~ 0
A5(SCL)
Text Label 10550 3000 0    60   ~ 0
0(Rx)
Text Label 10550 2800 0    60   ~ 0
2
Text Label 10550 2900 0    60   ~ 0
1(Tx)
Text Label 10550 2700 0    60   ~ 0
3(**)
Text Label 10550 2600 0    60   ~ 0
4
Text Label 10550 2500 0    60   ~ 0
5(**)
Text Label 10550 2400 0    60   ~ 0
6(**)
Text Label 10550 2300 0    60   ~ 0
7
Text Label 10550 2100 0    60   ~ 0
8
Text Label 10550 2000 0    60   ~ 0
9(**)
Text Label 10550 1900 0    60   ~ 0
10(**/SS)
Text Label 10550 1800 0    60   ~ 0
11(**/MOSI)
Text Label 10550 1700 0    60   ~ 0
12(MISO)
Text Label 10550 1600 0    60   ~ 0
13(SCK)
Text Label 10550 1400 0    60   ~ 0
AREF
NoConn ~ 9400 1600
Text Label 10550 1300 0    60   ~ 0
A4(SDA)
Text Label 10550 1200 0    60   ~ 0
A5(SCL)
Text Notes 10850 1000 0    60   ~ 0
Holes
Text Notes 8550 750  0    60   ~ 0
Shield for Arduino that uses\nthe same pin disposition\nlike "Uno" board Rev 3.
$Comp
L Connector_Generic:Conn_01x08 P1
U 1 1 56D70129
P 9600 1900
F 0 "P1" H 9600 2350 50  0000 C CNN
F 1 "Power" V 9700 1900 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 9750 1900 20  0000 C CNN
F 3 "" H 9600 1900 50  0000 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
Text Label 8650 1800 0    60   ~ 0
Reset
$Comp
L power:+3.3V #PWR01
U 1 1 56D70538
P 9150 1450
F 0 "#PWR01" H 9150 1300 50  0001 C CNN
F 1 "+3.3V" V 9150 1700 50  0000 C CNN
F 2 "" H 9150 1450 50  0000 C CNN
F 3 "" H 9150 1450 50  0000 C CNN
	1    9150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 56D707BB
P 9050 1350
F 0 "#PWR02" H 9050 1200 50  0001 C CNN
F 1 "+5V" V 9050 1550 50  0000 C CNN
F 2 "" H 9050 1350 50  0000 C CNN
F 3 "" H 9050 1350 50  0000 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 56D70CC2
P 9300 3150
F 0 "#PWR03" H 9300 2900 50  0001 C CNN
F 1 "GND" H 9300 3000 50  0000 C CNN
F 2 "" H 9300 3150 50  0000 C CNN
F 3 "" H 9300 3150 50  0000 C CNN
	1    9300 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 56D70CFF
P 10300 3150
F 0 "#PWR04" H 10300 2900 50  0001 C CNN
F 1 "GND" H 10300 3000 50  0000 C CNN
F 2 "" H 10300 3150 50  0000 C CNN
F 3 "" H 10300 3150 50  0000 C CNN
	1    10300 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P2
U 1 1 56D70DD8
P 9600 2700
F 0 "P2" H 9600 2300 50  0000 C CNN
F 1 "Analog" V 9700 2700 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 9750 2750 20  0000 C CNN
F 3 "" H 9600 2700 50  0000 C CNN
	1    9600 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D71177
P 10800 650
F 0 "P5" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10721 724 20  0000 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D71274
P 10900 650
F 0 "P6" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10900 650 20  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P7
U 1 1 56D712A8
P 11000 650
F 0 "P7" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" V 11000 650 20  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P8
U 1 1 56D712DB
P 11100 650
F 0 "P8" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 11024 572 20  0000 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L Connector_Generic:Conn_01x08 P4
U 1 1 56D7164F
P 10000 2600
F 0 "P4" H 10000 2100 50  0000 C CNN
F 1 "Digital" V 10100 2600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 10150 2550 20  0000 C CNN
F 3 "" H 10000 2600 50  0000 C CNN
	1    10000 2600
	-1   0    0    -1  
$EndComp
Wire Notes Line
	8525 825  9925 825 
Wire Notes Line
	9925 825  9925 475 
Wire Wire Line
	9350 1450 9350 1700
Wire Wire Line
	9350 1700 9400 1700
Wire Wire Line
	9400 1900 9150 1900
Wire Wire Line
	9400 2000 9050 2000
Wire Wire Line
	9400 2300 8950 2300
Wire Wire Line
	9400 2100 9300 2100
Wire Wire Line
	9400 2200 9300 2200
Connection ~ 9300 2200
Wire Wire Line
	8950 2300 8950 1450
Wire Wire Line
	9050 2000 9050 1350
Wire Wire Line
	9150 1900 9150 1450
Wire Wire Line
	9400 2500 8900 2500
Wire Wire Line
	9400 2600 8900 2600
Wire Wire Line
	9400 2700 8900 2700
Wire Wire Line
	9400 2800 8900 2800
Wire Wire Line
	9400 2900 8900 2900
Wire Wire Line
	9400 3000 8900 3000
$Comp
L Connector_Generic:Conn_01x10 P3
U 1 1 56D721E0
P 10000 1600
F 0 "P3" H 10000 2150 50  0000 C CNN
F 1 "Digital" V 10100 1600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 10150 1600 20  0000 C CNN
F 3 "" H 10000 1600 50  0000 C CNN
	1    10000 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10200 2100 10550 2100
Wire Wire Line
	10200 2000 10550 2000
Wire Wire Line
	10200 1900 10550 1900
Wire Wire Line
	10200 1800 10550 1800
Wire Wire Line
	10200 1700 10550 1700
Wire Wire Line
	10200 1600 10550 1600
Wire Wire Line
	10200 1400 10550 1400
Wire Wire Line
	10200 1300 10550 1300
Wire Wire Line
	10200 1200 10550 1200
Wire Wire Line
	10200 3000 10550 3000
Wire Wire Line
	10200 2900 10550 2900
Wire Wire Line
	10200 2800 10550 2800
Wire Wire Line
	10200 2700 10550 2700
Wire Wire Line
	10200 2600 10550 2600
Wire Wire Line
	10200 2500 10550 2500
Wire Wire Line
	10200 2400 10550 2400
Wire Wire Line
	10200 2300 10550 2300
Wire Wire Line
	10200 1500 10300 1500
Wire Wire Line
	10300 1500 10300 3150
Wire Wire Line
	9300 2100 9300 2200
Wire Wire Line
	9300 2200 9300 3150
Wire Notes Line
	8500 500  8500 3450
Wire Notes Line
	8500 3450 11200 3450
Wire Wire Line
	9400 1800 8650 1800
Text Notes 9700 1600 0    60   ~ 0
1
Wire Notes Line
	11200 1000 10700 1000
Wire Notes Line
	10700 1000 10700 500 
$Comp
L Transistor_FET:BSS138 Q1
U 1 1 5D47D045
P 7000 4250
F 0 "Q1" V 7250 4250 50  0000 C CNN
F 1 "BSS138" V 7341 4250 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7200 4175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 7000 4250 50  0001 L CNN
	1    7000 4250
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q2
U 1 1 5D47D2DC
P 7500 4600
F 0 "Q2" V 7750 4600 50  0000 C CNN
F 1 "BSS138" V 7841 4600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7700 4525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 7500 4600 50  0001 L CNN
	1    7500 4600
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:LM1084-5.0 U2
U 1 1 5D47DF12
P 5550 1300
F 0 "U2" H 5550 1542 50  0000 C CNN
F 1 "LM1084-5.0" H 5550 1451 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 5550 1550 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm1084.pdf" H 5550 1300 50  0001 C CNN
	1    5550 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5D47E2AD
P 3200 1300
F 0 "J1" V 3260 1440 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 1440 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 1300 50  0001 C CNN
F 3 "~" H 3200 1300 50  0001 C CNN
	1    3200 1300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5D47E5E1
P 3200 1800
F 0 "J2" V 3260 1940 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 1940 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 1800 50  0001 C CNN
F 3 "~" H 3200 1800 50  0001 C CNN
	1    3200 1800
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5D47E693
P 3200 2300
F 0 "J3" V 3260 2440 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 2440 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 2300 50  0001 C CNN
F 3 "~" H 3200 2300 50  0001 C CNN
	1    3200 2300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5D47E76F
P 3200 2800
F 0 "J4" V 3260 2940 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 2940 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 2800 50  0001 C CNN
F 3 "~" H 3200 2800 50  0001 C CNN
	1    3200 2800
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 5D47E848
P 3200 3300
F 0 "J5" V 3260 3440 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 3440 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 3300 50  0001 C CNN
F 3 "~" H 3200 3300 50  0001 C CNN
	1    3200 3300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J6
U 1 1 5D47EA50
P 3200 3800
F 0 "J6" V 3260 3940 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 3940 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 3800 50  0001 C CNN
F 3 "~" H 3200 3800 50  0001 C CNN
	1    3200 3800
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 5D47EB7A
P 3200 4300
F 0 "J7" V 3260 4440 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 4440 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 4300 50  0001 C CNN
F 3 "~" H 3200 4300 50  0001 C CNN
	1    3200 4300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J8
U 1 1 5D47ED9C
P 3200 4800
F 0 "J8" V 3260 4940 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 4940 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 4800 50  0001 C CNN
F 3 "~" H 3200 4800 50  0001 C CNN
	1    3200 4800
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J9
U 1 1 5D47EEFA
P 3200 5300
F 0 "J9" V 3260 5440 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 5440 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 5300 50  0001 C CNN
F 3 "~" H 3200 5300 50  0001 C CNN
	1    3200 5300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J10
U 1 1 5D47F12D
P 3200 5800
F 0 "J10" V 3260 5940 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 5940 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 5800 50  0001 C CNN
F 3 "~" H 3200 5800 50  0001 C CNN
	1    3200 5800
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J11
U 1 1 5D47F255
P 3200 6300
F 0 "J11" V 3260 6440 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 6440 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 6300 50  0001 C CNN
F 3 "~" H 3200 6300 50  0001 C CNN
	1    3200 6300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J12
U 1 1 5D47F373
P 3200 6800
F 0 "J12" V 3260 6940 50  0000 L CNN
F 1 "Conn_01x03_Male" V 3351 6940 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3200 6800 50  0001 C CNN
F 3 "~" H 3200 6800 50  0001 C CNN
	1    3200 6800
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 1500 3300 2000
Connection ~ 3300 2000
Wire Wire Line
	3300 2000 3300 2500
Connection ~ 3300 2500
Wire Wire Line
	3300 2500 3300 3000
Connection ~ 3300 3000
Wire Wire Line
	3300 3000 3300 3500
Connection ~ 3300 3500
Wire Wire Line
	3300 3500 3300 4000
Connection ~ 3300 4000
Wire Wire Line
	3300 4000 3300 4500
Connection ~ 3300 4500
Wire Wire Line
	3300 4500 3300 5000
Connection ~ 3300 5000
Wire Wire Line
	3300 5000 3300 5500
Connection ~ 3300 5500
Wire Wire Line
	3300 5500 3300 6000
Connection ~ 3300 6000
Wire Wire Line
	3300 6000 3300 6500
Connection ~ 3300 6500
Wire Wire Line
	3300 6500 3300 7000
Connection ~ 3300 7000
Wire Wire Line
	3300 7000 3300 7250
$Comp
L power:GND #PWR06
U 1 1 5D482CC3
P 3300 7250
F 0 "#PWR06" H 3300 7000 50  0001 C CNN
F 1 "GND" H 3305 7077 50  0000 C CNN
F 2 "" H 3300 7250 50  0001 C CNN
F 3 "" H 3300 7250 50  0001 C CNN
	1    3300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 7000 3200 6500
Connection ~ 3200 1500
Wire Wire Line
	3200 1500 3200 1100
Connection ~ 3200 2000
Wire Wire Line
	3200 2000 3200 1500
Connection ~ 3200 2500
Wire Wire Line
	3200 2500 3200 2000
Connection ~ 3200 3000
Wire Wire Line
	3200 3000 3200 2500
Connection ~ 3200 3500
Wire Wire Line
	3200 3500 3200 3000
Connection ~ 3200 4000
Wire Wire Line
	3200 4000 3200 3500
Connection ~ 3200 4500
Wire Wire Line
	3200 4500 3200 4000
Connection ~ 3200 5000
Wire Wire Line
	3200 5000 3200 4500
Connection ~ 3200 5500
Wire Wire Line
	3200 5500 3200 5000
Connection ~ 3200 6000
Wire Wire Line
	3200 6000 3200 5500
Connection ~ 3200 6500
Wire Wire Line
	3200 6500 3200 6000
$Comp
L Connector:Conn_01x02_Female J13
U 1 1 5D48A393
P 4500 1400
F 0 "J13" H 4394 1075 50  0000 C CNN
F 1 "Conn_01x02_Female" H 4394 1166 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PTSM-0,5-2-2.5-H-THR_1x02_P2.50mm_Horizontal" H 4500 1400 50  0001 C CNN
F 3 "~" H 4500 1400 50  0001 C CNN
	1    4500 1400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5D48CA04
P 5550 1800
F 0 "#PWR09" H 5550 1550 50  0001 C CNN
F 1 "GND" H 5555 1627 50  0000 C CNN
F 2 "" H 5550 1800 50  0001 C CNN
F 3 "" H 5550 1800 50  0001 C CNN
	1    5550 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1400 4700 1800
Wire Wire Line
	4700 1800 5100 1800
Wire Wire Line
	5550 1800 6050 1800
Connection ~ 5550 1800
Wire Wire Line
	4700 1300 5100 1300
Wire Wire Line
	5850 1300 6050 1300
$Comp
L Device:C C2
U 1 1 5D497138
P 5100 1550
F 0 "C2" H 5215 1596 50  0000 L CNN
F 1 "22uF" H 5215 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5138 1400 50  0001 C CNN
F 3 "~" H 5100 1550 50  0001 C CNN
	1    5100 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5D4971EA
P 6050 1550
F 0 "C3" H 6165 1596 50  0000 L CNN
F 1 "22uF" H 6165 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6088 1400 50  0001 C CNN
F 3 "~" H 6050 1550 50  0001 C CNN
	1    6050 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1400 5100 1300
Connection ~ 5100 1300
Wire Wire Line
	5100 1300 5250 1300
Wire Wire Line
	5100 1700 5100 1800
Connection ~ 5100 1800
Wire Wire Line
	5100 1800 5550 1800
Wire Wire Line
	6050 1400 6050 1300
Connection ~ 6050 1300
Wire Wire Line
	6050 1300 6300 1300
Wire Wire Line
	6050 1700 6050 1800
$Comp
L Device:C C1
U 1 1 5D4A6B92
P 4600 4500
F 0 "C1" H 4715 4546 50  0000 L CNN
F 1 "100nF" H 4715 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4638 4350 50  0001 C CNN
F 3 "~" H 4600 4500 50  0001 C CNN
	1    4600 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5D4A744E
P 6300 4100
F 0 "R1" H 6370 4146 50  0000 L CNN
F 1 "10k" H 6370 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6230 4100 50  0001 C CNN
F 3 "~" H 6300 4100 50  0001 C CNN
	1    6300 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5D4A7B13
P 6650 4100
F 0 "R2" H 6720 4146 50  0000 L CNN
F 1 "10k" H 6720 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6580 4100 50  0001 C CNN
F 3 "~" H 6650 4100 50  0001 C CNN
	1    6650 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5D4A7C67
P 8400 4100
F 0 "R4" H 8470 4146 50  0000 L CNN
F 1 "10k" H 8470 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8330 4100 50  0001 C CNN
F 3 "~" H 8400 4100 50  0001 C CNN
	1    8400 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5D4A7DA7
P 8000 4100
F 0 "R3" H 8070 4146 50  0000 L CNN
F 1 "10k" H 8070 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7930 4100 50  0001 C CNN
F 3 "~" H 8000 4100 50  0001 C CNN
	1    8000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1500 2600 1500
Wire Wire Line
	3100 2000 2600 2000
Wire Wire Line
	3100 2500 2600 2500
Wire Wire Line
	3100 3000 2600 3000
Wire Wire Line
	3100 3500 2600 3500
Wire Wire Line
	3100 4000 2600 4000
Wire Wire Line
	3100 4500 2600 4500
Wire Wire Line
	3100 5000 2600 5000
Wire Wire Line
	3100 5500 2600 5500
Wire Wire Line
	3100 6000 2600 6000
Wire Wire Line
	3100 6500 2600 6500
Wire Wire Line
	3100 7000 2600 7000
Text Label 2600 7000 2    50   ~ 0
0(Rx)
Text Label 2600 6500 2    50   ~ 0
1(Tx)
Text Label 2600 6000 2    50   ~ 0
2
Text Label 2600 5500 2    60   ~ 0
3(**)
Text Label 2600 5000 2    60   ~ 0
4
Text Label 2600 4500 2    60   ~ 0
5(**)
Text Label 2600 4000 2    60   ~ 0
6(**)
Text Label 2600 3500 2    60   ~ 0
7
Text Label 2600 3000 2    60   ~ 0
8
Text Label 2600 2500 2    60   ~ 0
9(**)
Text Label 2600 2000 2    60   ~ 0
10(**/SS)
Text Label 2600 1500 2    60   ~ 0
11(**/MOSI)
Text Label 8800 4350 0    60   ~ 0
A5(SCL)
Text Label 8800 4700 0    60   ~ 0
A4(SDA)
Text Label 5100 900  2    60   ~ 0
Vin
Wire Wire Line
	5100 1300 5100 900 
Wire Wire Line
	5550 1800 5550 1600
$Comp
L Connector:Conn_01x02_Female J17
U 1 1 5D4E41FA
P 5100 7100
F 0 "J17" H 4994 6775 50  0000 C CNN
F 1 "Conn_01x02_Female" H 4994 6866 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PTSM-0,5-2-2.5-H-THR_1x02_P2.50mm_Horizontal" H 5100 7100 50  0001 C CNN
F 3 "~" H 5100 7100 50  0001 C CNN
	1    5100 7100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5D4E5654
P 5700 7100
F 0 "#PWR013" H 5700 6850 50  0001 C CNN
F 1 "GND" H 5705 6927 50  0000 C CNN
F 2 "" H 5700 7100 50  0001 C CNN
F 3 "" H 5700 7100 50  0001 C CNN
	1    5700 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 7100 5300 7100
Wire Wire Line
	5300 7000 5650 7000
$Comp
L Connector:Conn_01x02_Female J16
U 1 1 5D4F53A1
P 5100 6550
F 0 "J16" H 4994 6225 50  0000 C CNN
F 1 "Conn_01x02_Female" H 4994 6316 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PTSM-0,5-2-2.5-H-THR_1x02_P2.50mm_Horizontal" H 5100 6550 50  0001 C CNN
F 3 "~" H 5100 6550 50  0001 C CNN
	1    5100 6550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5D4F53A8
P 5700 6550
F 0 "#PWR012" H 5700 6300 50  0001 C CNN
F 1 "GND" H 5705 6377 50  0000 C CNN
F 2 "" H 5700 6550 50  0001 C CNN
F 3 "" H 5700 6550 50  0001 C CNN
	1    5700 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 6550 5300 6550
Wire Wire Line
	5300 6450 5650 6450
$Comp
L Connector:Conn_01x02_Female J15
U 1 1 5D4F7F18
P 5100 6000
F 0 "J15" H 4994 5675 50  0000 C CNN
F 1 "Conn_01x02_Female" H 4994 5766 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PTSM-0,5-2-2.5-H-THR_1x02_P2.50mm_Horizontal" H 5100 6000 50  0001 C CNN
F 3 "~" H 5100 6000 50  0001 C CNN
	1    5100 6000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5D4F7F1F
P 5700 6000
F 0 "#PWR011" H 5700 5750 50  0001 C CNN
F 1 "GND" H 5705 5827 50  0000 C CNN
F 2 "" H 5700 6000 50  0001 C CNN
F 3 "" H 5700 6000 50  0001 C CNN
	1    5700 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 6000 5300 6000
Wire Wire Line
	5300 5900 5650 5900
$Comp
L Connector:Conn_01x02_Female J14
U 1 1 5D4FDEAB
P 5100 5450
F 0 "J14" H 4994 5125 50  0000 C CNN
F 1 "Conn_01x02_Female" H 4994 5216 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PTSM-0,5-2-2.5-H-THR_1x02_P2.50mm_Horizontal" H 5100 5450 50  0001 C CNN
F 3 "~" H 5100 5450 50  0001 C CNN
	1    5100 5450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5D4FDEB2
P 5700 5450
F 0 "#PWR010" H 5700 5200 50  0001 C CNN
F 1 "GND" H 5705 5277 50  0000 C CNN
F 2 "" H 5700 5450 50  0001 C CNN
F 3 "" H 5700 5450 50  0001 C CNN
	1    5700 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5450 5300 5450
Text Label 5650 5350 0    60   ~ 0
A0
Wire Wire Line
	5300 5350 5650 5350
Text Label 5650 5900 0    60   ~ 0
A1
Text Label 5650 6450 0    60   ~ 0
A2
Text Label 5650 7000 0    60   ~ 0
A3
$Comp
L MS5607:MS5607 U1
U 1 1 5D522A9D
P 5500 4500
F 0 "U1" H 5500 4965 50  0000 C CNN
F 1 "MS5607" H 5500 4874 50  0000 C CNN
F 2 "MS5607:MS5607" H 5500 4500 50  0001 C CNN
F 3 "" H 5500 4500 50  0001 C CNN
	1    5500 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR015
U 1 1 5D52A74D
P 6300 1300
F 0 "#PWR015" H 6300 1150 50  0001 C CNN
F 1 "+5VD" H 6315 1473 50  0000 C CNN
F 2 "" H 6300 1300 50  0001 C CNN
F 3 "" H 6300 1300 50  0001 C CNN
	1    6300 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR05
U 1 1 5D52AD9A
P 3200 1100
F 0 "#PWR05" H 3200 950 50  0001 C CNN
F 1 "+5VD" H 3215 1273 50  0000 C CNN
F 2 "" H 3200 1100 50  0001 C CNN
F 3 "" H 3200 1100 50  0001 C CNN
	1    3200 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR014
U 1 1 5D530EF3
P 6000 3900
F 0 "#PWR014" H 6000 3750 50  0001 C CNN
F 1 "+3.3V" V 6000 4150 50  0000 C CNN
F 2 "" H 6000 3900 50  0000 C CNN
F 3 "" H 6000 3900 50  0000 C CNN
	1    6000 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 5D532752
P 8650 3900
F 0 "#PWR016" H 8650 3750 50  0001 C CNN
F 1 "+5V" V 8650 4100 50  0000 C CNN
F 2 "" H 8650 3900 50  0000 C CNN
F 3 "" H 8650 3900 50  0000 C CNN
	1    8650 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR08
U 1 1 5D5333BD
P 5000 4150
F 0 "#PWR08" H 5000 4000 50  0001 C CNN
F 1 "+3.3V" V 5000 4400 50  0000 C CNN
F 2 "" H 5000 4150 50  0000 C CNN
F 3 "" H 5000 4150 50  0000 C CNN
	1    5000 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4150 5000 4350
Wire Wire Line
	5000 4350 5100 4350
Wire Wire Line
	8000 3950 8400 3950
Wire Wire Line
	8650 3950 8650 3900
Connection ~ 8400 3950
Wire Wire Line
	8400 3950 8650 3950
Wire Wire Line
	8800 4350 8400 4350
Wire Wire Line
	8400 4350 8400 4250
Wire Wire Line
	8000 4250 8000 4700
Wire Wire Line
	8000 4700 8800 4700
Wire Wire Line
	7200 4350 8400 4350
Connection ~ 8400 4350
Wire Wire Line
	7700 4700 8000 4700
Connection ~ 8000 4700
Wire Wire Line
	6000 3900 6000 3950
Wire Wire Line
	6000 3950 6300 3950
Connection ~ 6300 3950
Wire Wire Line
	6300 3950 6650 3950
Wire Wire Line
	6650 4250 6650 4350
Wire Wire Line
	6650 4350 6800 4350
Connection ~ 6650 4350
Wire Wire Line
	6300 4250 6300 4700
Wire Wire Line
	6300 4700 7300 4700
Wire Wire Line
	6650 3950 7000 3950
Wire Wire Line
	7000 3950 7000 4050
Connection ~ 6650 3950
Wire Wire Line
	7000 3950 7500 3950
Wire Wire Line
	7500 3950 7500 4400
Connection ~ 7000 3950
Wire Wire Line
	6300 4700 6200 4700
Wire Wire Line
	6200 4700 6200 4450
Wire Wire Line
	6200 4450 5900 4450
Connection ~ 6300 4700
Wire Wire Line
	5900 4350 6650 4350
Wire Wire Line
	5100 4450 5000 4450
Wire Wire Line
	5000 4450 5000 4350
Connection ~ 5000 4350
Wire Wire Line
	4600 4350 5000 4350
Wire Wire Line
	5100 4550 5000 4550
Wire Wire Line
	5000 4550 5000 4650
Wire Wire Line
	5000 4650 4800 4650
$Comp
L power:GND #PWR07
U 1 1 5D5F0C14
P 4800 4650
F 0 "#PWR07" H 4800 4400 50  0001 C CNN
F 1 "GND" H 4800 4500 50  0000 C CNN
F 2 "" H 4800 4650 50  0000 C CNN
F 3 "" H 4800 4650 50  0000 C CNN
	1    4800 4650
	1    0    0    -1  
$EndComp
Connection ~ 4800 4650
Wire Wire Line
	4800 4650 4600 4650
Wire Wire Line
	5100 4650 5100 4850
Wire Wire Line
	5100 4850 5900 4850
Wire Wire Line
	5900 4850 5900 4650
Wire Wire Line
	5100 4650 5000 4650
Connection ~ 5000 4650
$EndSCHEMATC
