import oscP5.*;
import netP5.*;

OscP5 osc;



void setup () {
  size(500, 500);
  osc = new OscP5(this, 10000);// number of port where we are reciving messages
  osc.plug(this, "shake", "/accelerometer"); // everytime you recieve this message, excute this function
}

void draw () {
}

void shake(float x, float y, float z) { // smartphone is recieving these three variables
  println(z);
  background(x * 2, y * 2, z * 2);
}

//done everytime we are reciving a message
//void oscEvent(OscMessage me) {
//  println(me.addrPattern() + " , " + me.typetag());
//}
