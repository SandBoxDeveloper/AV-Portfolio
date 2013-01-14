//some librarys in processing must be inside a 'code' file with the sketch (like some 
//video libraries, a bit like the 'data' foler, the oscP5 is one of them 
//my fault for forgetting ... this is a simplified sketch, so it looks a bit easier on
//the eye :)

//have fun

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float rightHandX, rightHandY, leftHandX, leftHandY;
PFont write;

void setup() {
  size(640, 480); // canvas size
  smooth();
  frameRate(25); // frameRate (experiment witht his for best lag free results
  oscP5 = new OscP5(this, 12345); // setting up OSC (the second number should 
  ////////////////////////////////// NOT match the second numbers in the Net Adress

  myRemoteLocation = new NetAddress("127.0.0.1", 12346);
  write = loadFont("SansSerif-48.vlw");
}

void draw() {
  background(0);
  sendData(); //reminds OSC to fetch data
  fill(255);
  ellipse(rightHandX, rightHandY, 50, 50);//the shape that will track your right hand
  ellipse(leftHandX, leftHandY, 50, 50);//the shape that will track your right hand
}

void sendData() {
  OscMessage myMessage = new OscMessage("/righthand_trackjointpos");
  myMessage.add(3); // the 3 means to get _pos_screen positions.
  oscP5.send(myMessage, myRemoteLocation);
  
  OscMessage myMessage2 = new OscMessage("/lefthand_trackjointpos");
  myMessage2.add(3); // the 3 means to get _pos_screen positions.
  oscP5.send(myMessage2, myRemoteLocation);
}

void oscEvent(OscMessage theOscMessage) {
  String v=theOscMessage.addrPattern();
 if (v.equals("/righthand_pos_screen")) {
    float x = theOscMessage.get(0).floatValue(); 
    float y = theOscMessage.get(1).floatValue();
    rightHandX=x;
    rightHandY=y;
  }
  
  if (v.equals("/lefthand_pos_screen")) {
    float x = theOscMessage.get(0).floatValue(); 
    float y = theOscMessage.get(1).floatValue();
    leftHandX=x;
    leftHandY=y;
  }
}



