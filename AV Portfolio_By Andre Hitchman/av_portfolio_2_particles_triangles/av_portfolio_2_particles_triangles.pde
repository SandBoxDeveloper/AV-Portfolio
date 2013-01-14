// http://vormplus.be/blog/article/processing-month-day-3-triangle-grids

float radius = 20;
float x, y;
float prevX, prevY;
boolean fade = true;




void setup () {
  size(420, 420);
  background(0);
  stroke(255);
  x = width / 2;
  y = height / 2;
  prevX = x;
  prevY = y;
  stroke(255);
  strokeWeight(2);
  point(x, y);
}

void draw () {
  
  float angle = (TWO_PI / 6) * floor(random(6));
  x += cos(angle) * radius;
  y += sin(angle) * radius;
  // update previous x and y with new values
  prevX = x;
  prevY = y;
  
  
  
  if( x < 0 || x > width ) {
     x = prevX ;
     y = prevY;
  }
  
  if( y < 0 || y > height) {
     prevX = x;
     prevY = y;
  }
  
  
  
  if(fade) {
    noStroke();
    fill(0, 4);
    rect(0, 0, width, height);
  }
  
  stroke(255, 64);
  strokeWeight(1);
  line(x, y, prevX, prevY);
  strokeWeight(3);
  point(x, y);
  // update previous x and y with new values
  prevX = x;
  prevY = y;
  
 
  
}

 void keyPressed () {
    if(key == 'f') {
      fade = !fade;
    }
  }
