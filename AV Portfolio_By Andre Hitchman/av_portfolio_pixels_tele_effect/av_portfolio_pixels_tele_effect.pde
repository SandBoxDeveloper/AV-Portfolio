void setup () {
  size(500, 500);
  frameRate(10);
}

void draw () {
  loadPixels();
  
  for(int i = 0; i < pixels.length; i++) {
    pixels[i] = color(random(255));
  }
  
   
  
  updatePixels();
}
