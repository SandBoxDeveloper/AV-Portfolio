import oscP5.*;
import netP5.*;

OscP5 osc;

float h; // for hue
float r = 15; // for current radius
float minRadius = 10;
float maxRadius = 20;
boolean grow = false; // to keep track if the brush is growing or shrinking




void setup () {
  size(500, 500);
  osc = new OscP5(this, 11000);// number of port where we are reciving messages
  //osc.plug(this, "shake", "/accelerometer"); // everytime you recieve this message, excute this function
  osc.plug(this, "shake", "/multi"); 
  colorMode(HSB, 360, 100, 100, 100); // changing color mode to HSB
  h = random(360); // setting hue to a random number between 0 - 360
}

void draw () {
}


//void shake(float x, float y, float z) { // smartphone is recieving these three variables
//  smooth();
//  fill(h, random(100), random(100), 50); // (R, G, B, A)
//  stroke(h, random(100), random(100), 70);
//  ellipse(x, y, x * 2, x * 2);
//  
//  if(grow) {
//    r++;
//    if( r < maxRadius) {
//      grow = false;
//    }
//  }
//  else {
//    r--;
//    if( r < minRadius) {
//      grow = true;
//    }
//  }
//}

//done everytime we are reciving a message
void oscEvent(OscMessage me) {
  println(me.addrPattern() + " , " + me.typetag());
}
