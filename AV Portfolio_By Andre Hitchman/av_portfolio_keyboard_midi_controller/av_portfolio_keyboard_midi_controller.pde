import promidi.*;

MidiIO midiIO;

void setup () {
  size(500, 500);
  smooth();
  background(0);
  
  // get instance of midiIO
  midiIO = MidiIO.getInstance(this);// this is hpw to connect to the midi library
  // print a list of all devices
  midiIO.printDevices();
  
  // plug all methods to handle midievents
  // processing whenever you here "within the quotes" then excute this function
  midiIO.plug(this, "noteOn", 0, 0); // when finger presses key on keyboard
  midiIO.plug(this, "noteOff", 0, 0); // when finger is released from keyboard
  midiIO.plug(this, "controllerIn", 0, 0); // slider and nobs on midicontroller
  midiIO.plug(this, "programChange", 0, 0); // when program has been changed on keyboard
}

// key pressed
void noteOn (Note note) { // if note is pressed excute this function
  int velocityValue = note.getVelocity(); // how hard is keypressed on keyboard ?
  int pitchValue = note.getPitch(); // which of the keys are pressed ?
  
  fill(255, velocityValue * 2, pitchValue * 2, velocityValue * 2);
  stroke(255, velocityValue);
  ellipse(velocityValue * 5, pitchValue * 5, 30, 30);
}

// key released function
void noteOff (Note off) {
  int pitchValue = off.getPitch();
  
  fill(255, pitchValue * 2, pitchValue * 2, pitchValue * 2);
  stroke(255, pitchValue);
  ellipse(pitchValue * 5, pitchValue * 5, 30, 30);
}

// slider function
void controllerIn (Controller controller) {
  int number = controller.getNumber(); // which of the sliders is sending the signal ?
  int value = controller.getValue(); // how high or low is the slider ?
  
  fill(255, number * 2, value* 2, number * 2);
  stroke(255, number);
  ellipse(number * 5, value * 5, 30, 30);
}

// keyboard program change
void programChange (ProgramChange programChange) {
  int number = programChange.getNumber();
  
  fill(255, number * 2, number * 2, number* 2);
  stroke(255, number);
  ellipse(number * 5, number * 5, 30, 30);
}

void draw () {
}
