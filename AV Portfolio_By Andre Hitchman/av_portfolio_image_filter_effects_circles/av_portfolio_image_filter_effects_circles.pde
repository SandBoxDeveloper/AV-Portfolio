// inspired by @ http://vormplus.be/blog/article/processing-month-day-9-circular-pixels
// this sketch uses brightness of the individual pixel 
// values to draw a grayscale grid of ellipse

PImage nonAltered; // decalre image variable

void setup () {
  size(500, 500);
  
  nonAltered = loadImage("64_robot.gif"); // load Image
  nonAltered.resize(500, 500); //resize image to size of sketch window
  image(nonAltered, 0, 0);
  
  translate(5, 5);
  for(int i = 0; i < width; i+= 10) {
    for(int j = 0; j < height; j+= 10) {
      float c = brightness(nonAltered.get(i, j));
      fill(c);
      ellipse(i, j, 10, 10);
    }
  }
}

void draw () {
  
}

