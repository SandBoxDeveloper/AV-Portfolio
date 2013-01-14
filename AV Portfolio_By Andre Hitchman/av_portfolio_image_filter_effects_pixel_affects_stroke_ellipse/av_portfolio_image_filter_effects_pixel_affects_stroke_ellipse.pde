// inspired by @ http://vormplus.be/blog/article/processing-month-day-9-circular-pixels
// this sketch combined the two image filters that used 
// brighness and the pixels of the graphics
// this uses the color of the pixel for the stroke of each ellipse

PImage graphic; // declare image variable

void setup () {
  size(500, 500);
  graphic = loadImage("64_heart.gif"); // load Image
  graphic.resize(500, 500); //resize image to size of sketch window
  
  for(int i = 0; i < width; i+= 10) {
    for(int j = 0; j < height; j+=10) {
      int c = graphic.get(i,j);
      float b = brightness(c);
      fill(b);
      float r = map(b, 0, 255, 0, 10); // Re-maps b from one range to another
      ellipse(i, j, r, r);
    }
  }
}

void draw () {
}
