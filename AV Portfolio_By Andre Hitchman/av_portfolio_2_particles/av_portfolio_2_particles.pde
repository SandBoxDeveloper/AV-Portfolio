
float radius = 20;
float x, y;
float prevX, prevY;






void setup () {
  size(420, 420);
  background(0);
  x = width / 2;
  y = height / 2;
  prevX = x;
  prevY = y;
}

void draw () {
  
  float angle = (TWO_PI / 6) * floor(random(6));
  x += cos(angle) * radius;
  y += sin(angle) * radius;
  // update previous x and y with new values
  prevX = x;
  prevY = y;
  
  stroke(255, 64);
  strokeWeight(1);
  line(x, y, prevX, prevY);
  strokeWeight(3);
  point(x, y);
  // update previous x and y with new values
  prevX = x;
  prevY = y;
  
}
