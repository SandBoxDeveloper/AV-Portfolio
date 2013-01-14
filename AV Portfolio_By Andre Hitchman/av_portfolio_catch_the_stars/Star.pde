class Star {

  // variables that will hold primative datatype to create stars
  int starX, starY, starWidth, starHeight;

  // constructor
  Star(int sx, int sy, int sw, int sh) {
    starX = sx;
    starY = sy;
    starWidth = sw;
    starHeight = sh;
  }

  // function
  int update () {

    int movementAmount; // hold the amount of white pixels in the area of the bubble
    movementAmount = 0;

    // loop to cycle through all the pixels in the area where the bubble occupies
    for (int y = starY; y < (starY + (starHeight - 1)); y++) {
      for (int x = starX; x < (starX + (starWidth - 1)); x++) {
        if (x < width && x > 0 && y < height && y > 0) {  // if the current pixel is whithin the screen boundaries
          if (brightness(movementImg.pixels[x + (y * width)]) > 127) { // and if the brightness is above 127(white)
            movementAmount++; // add 1
          } // second if statement
        } // first if statement
      } // second loop
    } // first loop

    if (movementAmount > 5) { // if more than 5 pixels of movement is detected in the star area
      starsCaught++; // add 1 to score
      return 1; // return 1 so that the star is removed
    }// first if

    else { // if less than 5 pixels of movement detected
      starY += 10; // increase the y position of the star so that if falls down

      if (starY > height) { // if the star has droped to the bottom of the screen
        return 1; // return 1 so that the star is removed
      }// second if
      image(starGIF, starX, starY); // draw the star to screen
      return 0; // return 0 so that the star isn't removed
    }// belongs to else statement
  }// end function update

  void printMessage () {
    if (starsCaught == 100) {
      println("stop");
    }
  }// end printmessage function
}// end class

