// this sketch is based on procedural painting (painting as the progres)
// the brush will pulsate between a minimum and maxium radius


float h; // for hue
float r = 15; // for current radius
float minRadius = 10;
float maxRadius = 20;
boolean grow = false; // to keep track if the brush is growing or shrinking

void setup () {
  size(500, 500);
  background(255);
  // based on colorMode(mode, maxX, maxY, maxZ, maxA);
  // where X , Y, Z, A represent the range of red, green, blue and alpha
  // restropectivly
  colorMode(HSB, 360, 100, 100, 100); // changing color mode to HSB
  h = random(360); // setting hue to a random number between 0 - 360
}

void draw () {
  // generating random transparent colors based on the hue value
  smooth();
  fill(h, random(100), random(100), 50); // (R, G, B, A)
  stroke(h, random(100), random(100), 70);
  ellipse(mouseX, mouseY, r * 2, r * 2);
  
  if(grow) {
    r++;
    if( r < maxRadius) {
      grow = false;
    }
  }
  else {
    r--;
    if( r < minRadius) {
      grow = true;
    }
  }
  
}
