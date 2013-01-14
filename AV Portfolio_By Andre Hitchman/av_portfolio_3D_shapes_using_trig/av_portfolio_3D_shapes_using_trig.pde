// with help from
// http://vormplus.be/blog/article/drawing-a-cylinder-with-processing

void setup () {
  size(500, 500);
}

void draw () {
  translate(width/2, height/2);
  drawCylinder(40, 100);
}

void drawCylinder(int sides, float r) {
  float angle = 360 / sides;
  
  beginShape();
  for(int i = 0; i < sides; i++) {
    float x = cos(radians(i * angle) ) * r;
    float y = sin(radians(i * angle) ) * r;
    point(x, y);
  }
  endShape(CLOSE);
}
