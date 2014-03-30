/**
 * Clocks. 
 * 
 *  
 */

// Variables.
int r = 300;            // Circle radius.
int[][] angles1 = {
  {
    270, -30, 30,  90, 150, 210
  }
  , {
    330,  30, 90, 150, 210, 270
  }
};
int[][] angles2 = {
  {
    270, 300, -30,  0, 30, 60,  90, 120, 150, 180, 210, 240
  }
  , {
    300, 330,   0, 30, 60, 90, 120, 150, 180, 210, 240, 270
  }
};
int offset = 200;
byte maxCounter = 59;
long time = 0;
long currentTime;

int seconds;
int minutes;
int hours;

ClockFace binaryCF   = new ClockFace(r,  200, 60, 30, angles1);
ClockFace standardCF = new ClockFace(r, -200, 30,  0, angles2);

void setup() {
  size(1024, 700);
  background(255);      // Set the background to white.
  stroke(0);            // Set line drawing color to black.
  seconds = 0;
  minutes = 0;
  hours = 0;
  updateFace();
}

void draw() { 
  currentTime = millis();
  if ((currentTime - time) >= 1000) {
    updateFace();
    if (seconds == maxCounter) {
      seconds = 0;
      minutes++;
      if (minutes >= maxCounter) {
        minutes = 0;
        hours++;
      }
      if (hours == 24) {
        hours = 0;
      }
    } 
    else {
      seconds++;
    }
    // Set time to currentTime to start a new second.
    time = currentTime;
  }

  binaryCF.update();
  standardCF.update();
}

void updateFace() {
  displayBinary(seconds, 0, binaryCF);
  displayBinary(minutes, 1, binaryCF);
  displayBinary(hours,   2, binaryCF);
  
  displayBinary(seconds, 0, standardCF);
  displayBinary(minutes, 1, standardCF);
  displayBinary(hours,   2, standardCF);
}

void displayBinary(int toShow, int unit, ClockFace cf) {
  for (int i = 0; i < cf.angles[0].length; i++) {
    if (bitRead((byte)toShow, i) == 1) {
      cf.sectorOn(cf.angles[0][i], cf.angles[1][i], unit);
    } 
    else {
      cf.sectorOff(cf.angles[0][i], cf.angles[1][i], unit);
    }
  }
}

void displayBabylonian(int unit, ClockFace cf) {
  if(unit < 2) {
    // Del hver seksjon på fem.
  } 
  else {
    // Del hver seksjon på to.
  } 
}
/**
 * Reads the nth position in the byte and returns a int value of 0 or 1.
 * Modeled on the bitRead() function in Arduino.
 *
 * @param  byte b - The byte to be checked.
 * @param  int  n - The position if the byte to be checked.
 * @return int value of 0 or 1.
 */
int bitRead(int b, int n) {
  return ((b / int(pow(2, n)) % 2));
}

