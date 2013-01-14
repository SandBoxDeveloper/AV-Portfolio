// inspired by http://openprocessing.org/sketch/57696
// random vs noise
// Visualizing the difference between noise() and random()

float[] n;
Button b1;
Button b2;
Button b3;
boolean doWork = true;
int modeID = 2;

void setup () {
  size(500, 500);
  colorMode(HSB, 500);
  n = new float[width];
  reset();
  b1 = new Button(0, "noise()", 20, 40);
  b2 = new Button(0, "random()", 20, 60);
  b3 = new Button(0, "snoise()", 20, 80);
}

void reset () {
  for (int i = 0; i < width; i++) {
    n[i] = 0;
  }
  doWork = true;
}

float snoise(float x, float y, float z) {
  float n = noise(x, y, z);
  if(n > 0.5) {
    n = pow(2 *(1 - n), 3) / 2; // 0.5 .. 1 >> 1 .. 0
    n = 1 - n;
  }
  else {
    n = pow(2 * n, 3) / 2;
  }
  return n;
}

void calculate () {
  for (int j = 0; j < 1000; j++) {
    int r = 0;
    
    switch(modeID) {
      case 0:
      r = int(noise(frameCount/10.0, j/10.0) * width);
      break;
      
      case 1:
      r = int(random(0, width));
      break;
      
      case 2:
      r = int(snoise(frameCount/10.0, j/10.0, 0) * width);
      break;
    }
    n[r] += 0.6;
    if (n[r] > height) {
      doWork = false;
    }
  }
}
void draw () {
  background(255);
  if (doWork) {
    calculate();
  }
  for (int i = 0; i < width; i++) {
    stroke(i, n[i], n[i]);
    line(i, height, i, height - n[i]);
    stroke(0);
  }
  b1.draw();
  b2.draw();
  b3.draw();
}


