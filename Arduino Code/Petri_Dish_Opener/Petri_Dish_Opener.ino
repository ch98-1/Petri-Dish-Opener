//Corwin Hansen  2019
//For Arduino UNO
//Servo opens the petri dish at the specified altitude range, and closes if it
//drops down below that minimum altitude or reaches above the second specified 
//max altitude. If this event happenes before the specified minimum wait time, 
//it will wait until the timer has elapsed before taking action.
//do not use for more that ~50 days at a time as the timer overflowing
//can cause undefined behavior
//pressure to altitude conversion only works to 50km in altitude
//pressure in pascals, altitude in meters, angle in degrees

#include <Servo.h> //servo library
#include <Wire.h> //I2C library for digital barometric pressure sensor
#include <math.h>


//constants
const int numservo = 12; //number of total usable servo pins/petri dishes 
                         //12 with the arduino's servo library on arduino uno.



/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* Edit Vlues Here*/
                         
const int psensor = 0; //uses external analog seosor ASDXACX015PAAA5 if 0 to 3, 
                         //A0 if 0, A1 if 1, A2 if 2, A3 if 3,
                         //uses digital sensor on arduino shield if 4
const unsigned long minwaittime = 300000; //minimum time in milliseconds to wait
                                          //before the open petri dish can close
const bool debug = false; // enable or disable 9600 baud debug messages from usb serial

/* End of Values to Edit */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */



int nalt; //number of altitude measurements to average
                          
struct ServoControl {
  bool on; //true if servo is in use/connected to the board
  Servo sv; //servo motor controller object
  long int altmin; //minimum altitude needed for petri dish to open in meters
  long int altmax; //maximum altitude above which the petri dish will close in meters
  int degclose; //angle the petri dish will close to in degrees
  int degopen; //angle the petri dish will open to in degrees
  bool servoopen; //true if petri dish is open
  unsigned long timeopened; //time the petri dish was opened in milliseconds
};

ServoControl servos[numservo];//array of servos we can control

int EnableServo(int pin, long int minalt, long int maxalt, int closed, int opened);//enable the servo that is connected
                                                  //minalt is the altitude it opens at (in meters)
                                                  //maxalt is the altitude is closes at (in meters)
                                                  //closed is the angle the servo closes to (in degrees)
                                                  //opened is the angle the servo openes to (in degrees)
                                                  //returns 0 if successful

long int GetAltitude(void); //get altitude in meters
                            //returns 0 if at or below sealevel
                            //returns -1 if unsccessful
                            //only works to 50km in altitude
                       

int InitServo(void); //reset servos
                     //returns 0 if successful

double PtoAlt(double pressure); //converts pressure in pascal to altitude in meters


long int AverageAlt(int n); //get an average of n number of altitude measurements


void setup() {
  // put your setup code here, to run once:
  InitServo();//initialise the servo setup
  Wire.begin();// join i2c bus
  Wire.beginTransmission(119);
  Wire.write(byte(0x1E)); //reset command
  Wire.endTransmission(); 
  if(0 <= psensor && psensor <= 3){
    nalt = 100; //average 100 values for analog sensor 
  }
  else{
    nalt = 4; //average 4 values for digital sensor
  }

  if (debug){//if debug is enabled
    Serial.begin(9600);//set up serial for debug
  }






/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* v v v v v v v v v v v v v v v v v v v v */
/* Edit Vlues Here*/

  //servo setup
  EnableServo(0, 1524, 7620, 170, 60); //set the petri dish mechanism with the servo connected on
                              //pin 0 to open at 1524 meters and close at 7620 meters (5,000 to 25,000 ft)
                              //Opens to 60 degrees and closes to 170 degrees.
  EnableServo(1, 7620, 15240, 170, 60);//pin 1 to open at 7620 meters and close at 15240 meters (25,000 to 50,000 ft)
                                      //Opens to 60 degrees and closes to 170 degrees.
  EnableServo(2, 15240, 21336, 167, 60);//pin 2 to open at 15240 meters and close at 21336 meters (50,000 to 70,000 ft)
                                       //Opens to 60 degrees and closes to 167 degrees.
  EnableServo(3, 21336, 27432, 162, 60);//pin 3 to open at 21336 meters and close at 27432 meters (70,000 to 90,000 ft)
                                        //Opens to 60 degrees and closes to 162 degrees.

/* End of Values to Edit */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */
/* ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ */



  
}

void loop() {
  // put your main code here, to run repeatedly:
  for(int i = 0; i < numservo; i++){ //loop through each servo in the servos array
    if(servos[i].on == true){ //do only if servo is enabled

      long int alt = AverageAlt(nalt);//altitude value to use
      
      if(!servos[i].servoopen && 
        (alt >= servos[i].altmin &&  alt <= servos[i].altmax)) {
        //if closed and within the desired altitude range
        servos[i].sv.write(servos[i].degopen);//open petri dish
        if (debug){ //if debug is enabled
          Serial.println("open"); //report what was opened
          Serial.println(i);
        }
        servos[i].timeopened = millis();//set the time if was opened
        servos[i].servoopen = true;//mark that this servo was opened
      }
      
      else if(servos[i].servoopen && 
      !(alt >= servos[i].altmin && alt <= servos[i].altmax) &&
      (millis() - servos[i].timeopened) > minwaittime){ 
        //if open and outside of altitude range
        //and enough time has elapsed
        servos[i].sv.write(servos[i].degclose);//close petri dish
        if(debug) { //if debug is enabled
          Serial.println("close"); //report what was closed
          Serial.println(i);
        }
        servos[i].servoopen = false;//mark that this servo was closed
        servos[i].on = false;//set it as off so it dosent open again
      }
      
    }
  }
}


int EnableServo(int pin, long int minalt, long int maxalt, int closed, int opened){//enable the servo that is connected
                                                  //minalt is the altitude it opens at (in meters)
                                                  //maxalt is the altitude is closes at (in meters)
                                                  //closed is the angle the servo closes to (in degrees)
                                                  //opened is the angle the servo openes to (in degrees)
                                                  //returns 0 if successful
  servos[pin].on = true; //set each values to the given input
  servos[pin].altmin = minalt;
  servos[pin].altmax = maxalt;
  servos[pin].degclose = closed;
  servos[pin].degopen = opened;
  servos[pin].servoopen = false;
  servos[pin].timeopened = 0;
  servos[pin].sv.attach(pin);//attach servo to the specified pin
  servos[pin].sv.write(closed);//close petri dish at start
  return 0;
}

long int GetAltitude(void){ //get altitude in meters
                            //returns 0 if at or below sealevel
                            //returns -1 if unsccessful
                            //may be inaccurate above ~16km in altitude
                            
  double pressure; //pressure in pascals    
                        
  switch (psensor) {
    
    case 0://analog 0
      pressure = (((((double)analogRead(0))/(1024.0/5.0))-(0.1*5.0))*103421)/(0.8*5.0);
      //read and calculate pressure in pascals
      break;


    case 1://analog 1
      pressure = (((((double)analogRead(1))/(1024.0/5.0))-(0.1*5.0))*103421)/(0.8*5.0);
      //read and calculate pressure in pascals
      break;


    case 2://analog 2
      pressure = (((((double)analogRead(2))/(1024.0/5.0))-(0.1*5.0))*103421)/(0.8*5.0);
      //read and calculate pressure in pascals
      break;


    case 3://analog 3
      pressure = (((((double)analogRead(3))/(1024.0/5.0))-(0.1*5.0))*103421)/(0.8*5.0);
      //read and calculate pressure in pascals
      break;


    case 4://digital pressure sensor

      pressure = 101325.0;
      break;

   
    default:
      //this shouldn't happen
      return -1;//return error
  }

  long int altitude = (long int)PtoAlt(pressure); //get altitude for that pressure

  if(altitude < 0){ //return 0 meters altitude if too low 
    return 0;
  }
  return altitude;
}
                       

int InitServo(void){ //reset servos
                     //returns 0 if successful
  for(int i = 0; i < numservo; i++){ //loop through each servo in the servos array
    servos[i].on = false; //initialise each values
    servos[i].altmin = 0;
    servos[i].altmax = 0;
    servos[i].servoopen = false;
    servos[i].timeopened = 0;
  }
  return 0;
}



double PtoAlt(double pressure){//converts pressure in pascal to altitude in meters
  /* old code
  return (0.3048*145366.45*(1-pow((pressure/101325), 0.190284)));
  //altitude from pressure equation from https://www.weather.gov/media/epz/wxcalc/pressureAltitude.pdf
  //converted to meters and pascal
  //may be inaccurate above ~16km in altitude
  */
  
  //index is altitude in meters/1000, value is pressure in pascals
  //altitude is geometric altitude
  //table pulled from Appendix D of Fundermentals of Aerodynamics, 6th edition, 
  //International student edition, by John Anderson (ISBN 978-1-259-25134-4)
  const double alttable[51] = { 1.01325e5,
                                8.9876e4,
                                7.9501e4,
                                7.0121e4,
                                6.1660e4,
                                5.4048e4,
                                4.7217e4,
                                4.1105e4,
                                3.5651e4,
                                3.0800e4,
                                2.6500e4,
                                2.2700e4,
                                1.9399e4,
                                1.6579e4,
                                1.4170e4,
                                1.2112e4,
                                1.0353e4,
                                8.8496e3,
                                7.5652e3,
                                6.4674e3,
                                5.5293e3,
                                4.7274e3,
                                4.0420e3,
                                3.4562e3,
                                2.9554e3,
                                2.5273e3,
                                2.1632e3,
                                1.8555e3,
                                1.5946e3,
                                1.3737e3,
                                1.1855e3,
                                1.0251e3,
                                8.8803e2,
                                7.7069e2,
                                6.7007e2,
                                5.8359e2,
                                5.0914e2,
                                4.4493e2,
                                3.8944e2,
                                3.4131e2,
                                2.9977e2,
                                2.6361e2,
                                2.3215e2,
                                2.0474e2,
                                1.8082e2,
                                1.5991e2,
                                1.4162e2,
                                1.2558e2,
                                1.1147e2,
                                9.8961e1,
                                8.7858e1
                                 };
  
  if (pressure >= 1.01325E+5) return 0;
  if (pressure < 8.7858E+1) return -1;
  
  int i = 0;
  while(alttable[i+1] > pressure){
    i++;
  }

  return i*1000.0 + ((alttable[i]-pressure)/(alttable[i] - alttable[i+1]))*1000.0; //linearly interpolate the altitudes
}

long int AverageAlt(int n){ //get an average of n number of altitude measurements
  long int alt = 0;
  for(int i = 0; i < n; i++){
    alt = alt + GetAltitude();//add together altitudes
  }
  return alt/(long int)n;//return the averaged altitude
}
