//Corwin Hansen  2019
//For Arduino UNO
//Servo opens the petri dish at the specified altitude range, and closes if it
//drops down below that minimum altitude or reaches above the second specified 
//max altitude. If this event happenes before the specified minimum wait time, 
//it will wait until the timer has elapsed before taking action.
//do not use for more that ~50 days at a time as the timer overflowing
//can cause undefined behavior
//pressure to altitude conversion may be inaccurate above ~16km in altitude

#include <Servo.h> //servo library
#include <Wire.h> //I2C library for digital barometric pressure sensor
#include <math.h>


//constants
const int numservo = 12; //number of total usable servo pins/petri dishes 
                         //12 with the arduino's servo library on arduino uno.
const int psensor = 0; //uses external analog seosor ASDXACX015PAAA5 if 0 to 3, 
                         //A0 if 0, A1 if 1, A2 if 2, A3 if 3,
                         //uses digital sensor on arduino shield if 4
const unsigned long minwaittime = 300000; //minimum time in milliseconds to wait
                                          //before the open petri dish can close
const int posopen = 0; //open position in degrees
const int posclose = 160; //close position in degrees



                          
struct ServoControl {
  bool on; //true if servo is in use/connected to the board
  Servo sv; //servo motor controller object
  long int altmin; //minimum altitude needed for petri dish to open
  long int altmax; //maximum altitude above which the petri dish will close
  bool servoopen; //true if petri dish is open
  unsigned long timeopened; //time the petri dish was opened in milliseconds
};

ServoControl servos[numservo];//array of servos we can control

int EnableServo(int pin, long int minalt, long int maxalt);//enable the servo that is connected
                                                  //minalt is the altitude it opens at (in meters)
                                                  //maxalt is the altitude is closes at (in meters)
                                                  //returns 0 if successful

long int GetAltitude(void); //get altitude in meters
                            //returns 0 if at or below sealevel
                            //returns -1 if unsccessful
                            //may be inaccurate above ~16km in altitude
                       

int InitServo(void); //reset servos
                     //returns 0 if successful


void setup() {
  // put your setup code here, to run once:
  InitServo();//initialise the servo setup
  Wire.begin();// join i2c bus
  Wire.beginTransmission(119);
  Wire.write(byte(0x1E)); //reset command
  Wire.endTransmission(); 
  EnableServo(0, 8000, 10000); //set the petri dish mechanism with the servo connected on
                              //pin 0 to open at 8000 meters and close at 10000 meters
  

}

void loop() {
  // put your main code here, to run repeatedly:
  for(int i = 0; i < numservo; i++){ //loop through each servo in the servos array
    if(servos[i].on == true){ //do only if servo is enabled
      
      if(servos[i].servoopen == false && 
        GetAltitude() >= servos[i].altmin
        &&  GetAltitude() <= servos[i].altmax) {
        //if closed and within the desired altitude range
        servos[i].sv.write(posopen);//open petri dish
        servos[i].timeopened = millis();//set the time if was opened
        servos[i].servoopen = true;//mark that this servo was opened
      }
      
      else if(servos[i].servoopen == true && //if open
      (GetAltitude() <= servos[i].altmin || GetAltitude() >= servos[i].altmax) && //and outside of altitude range
      millis() - servos[i].timeopened > minwaittime){ //and enough time has elapsed
        servos[i].sv.write(posclose);//close petri dish
        servos[i].servoopen = false;//mark that this servo was closed
        servos[i].on = false;//set it as off so it dosent open again
      }

      else {
        //dont do anything if it isn't changing state
      }
      
    }
  }
}


int EnableServo(int pin, long int minalt, long int maxalt){//enable the servo that is connected
                                                  //minalt is the altitude it opens at (in meters)
                                                  //maxalt is the altitude is closes at (in meters)
                                                  //returns 0 if successful
                                                 //minalt can be lower than maxalt
  servos[pin].on = true; //set each values to the given input
  servos[pin].altmin = minalt;
  servos[pin].altmax = maxalt;
  servos[pin].servoopen = false;
  servos[pin].timeopened = 0;
  servos[pin].sv.attach(pin);//attach servo to the specified pin
  servos[pin].sv.write(posclose);//close petri dish at start
  return 0;
}

long int GetAltitude(void){ //get altitude in meters
                            //returns 0 if at or below sealevel
                            //returns -1 if unsccessful
                            //may be inaccurate above ~16km in altitude
                            
  double pressure; //pressure in pascals    
                        
  switch (psensor) {
    
    case 0://analog 0
      pressure = (((((double)analogRead(A0))/(1024.0/5.0))-(0.1*5.0))*103421)/(0.8*5.0);
      //read and calculate pressure in pascals
      break;


    case 1://analog 1
      pressure = (((((double)analogRead(A1))/(1024.0/5.0))-(0.1*5.0))*103421)/(0.8*5.0);
      //read and calculate pressure in pascals
      break;


    case 2://analog 2
      pressure = (((((double)analogRead(A2))/(1024.0/5.0))-(0.1*5.0))*103421)/(0.8*5.0);
      //read and calculate pressure in pascals
      break;


    case 3://analog 3
      pressure = (((((double)analogRead(A3))/(1024.0/5.0))-(0.1*5.0))*103421)/(0.8*5.0);
      //read and calculate pressure in pascals
      break;


    case 4://digital pressure sensor

      pressure = 101325.0;
      break;

   
    default:
      //this shouldn't happen
      return -1;//return error
  }

  long int altitude = (long int)(0.3048*145366.45*(1-pow((pressure/101325), 0.190284))); 
  //altitude from pressure equation from https://www.weather.gov/media/epz/wxcalc/pressureAltitude.pdf
  //converted to meters and pascal
  //may be inaccurate above ~16km in altitude
  if(altitude < 0){
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
