// inspired from http://andybest.net/2009/02/processing-opencv-tutorial-2-bubbles/#more-80

import hypermedia.video.*;

// new openCV object
OpenCV opencv;
// used to hold the movement of the image
PImage movementImg;
// to keep track of totol number of stars caught
int starsCaught;
// to hold bubble objects
ArrayList stars;
// image of bubble
PImage starGIF;
PFont font;

void setup () {
  size(640, 480);
  opencv = new OpenCV(this); // initialising openCV
  opencv.capture(640, 480); // setting capture size of video to size of sketch
  movementImg = new PImage(640, 480);
  starsCaught = 0; // hard coding number of stars caught to 0

    stars = new ArrayList(); // initialising arraylist for stars
  starGIF = loadImage("64_star.gif"); // load star image from data folder
  font = loadFont("AndaleMono-48.vlw"); // load font
  textFont(font, 32); // setting the current font what will be drawn and setting its size
}

void draw () {
  // adding a new star to the array list with a random x position to creating falling affect
  stars.add(new Star( (int)random( 0, width - 40), -starGIF.height, starGIF.width, starGIF.height)); 
  opencv.read(); // capture frame from camera
  opencv.flip(OpenCV.FLIP_HORIZONTAL); // flips image horizontally
  image(opencv.image(), 0, 0); // draw camera image to screen
  opencv.absDiff(); // creates a different image

  opencv.convert(OpenCV.GRAY); // converts video to grayscale
  opencv.blur(OpenCV.BLUR, 3); // blurs to remove camera noise
  opencv.threshold(20); // used to convert image to black and white
  movementImg = opencv.image(); // puts into an image object

  for (int i = 0; i < stars.size(); i++) { // for every star in the star array
    Star _star = (Star) stars.get(i); // copt the current star into a temp object

    if (_star.update() == 1) { // if the star's updated status return 1
      stars.remove(i); // then remove from array
      _star = null; // and make the temp star object null
      i--; // this is needed since a star has been removed from the array, -1 is used otherwise the next star will be skiped
    }
    else { // the the star updated status is not 1
      stars.set(i, _star); // copy the updated star object back into the array
      _star = null; // then make the temp star object null
    }// belongs to else statement
  }// from for statement
  // remember the camera image so we can generate a different image next frame, since the image was flipped earlier we need to flip here as well
  opencv.remember(OpenCV.SOURCE, OpenCV.FLIP_HORIZONTAL);

  text("Stars Caught: " +starsCaught, 20, 40); // display number of bubles popped on the screen

  for (int i = 0; i < stars.size(); i++) {
    Star _star = (Star) stars.get(i);
    _star.printMessage();
  }
}

