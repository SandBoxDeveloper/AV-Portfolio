// inspired by @ http://vormplus.be/blog/article/processing-month-day-9-circular-pixels
// this sketch uses brightness to set the 
// diameter of the ellipses drawn

PImage bitMap; // declare image variable

void setup () {
  size(500, 500);
  bitMap = loadImage("64_ghost.gif"); // load Image
  bitMap.resize(500, 500); //resize image to size of sketch window
  
  for(int i = 0; i < width; i+= 1) { // serach hozrizontally
    for(int j = 0; j < height; j+=10) { // search vertcally
      float c = brightness(bitMap.get(i, j)); // extract brightness from image based on pixel locations
      // c is converted from a value in range 0 - 255 into its target range of 0 - 10
      float r = map(c, 0, 255, 0, 10); // map brightness from one range to another
      fill(255); // fill white
      ellipse(i, j, r, r); // draw ellipse based on pixel location with width and height based on r
    }
  }
}

void draw () {
}
