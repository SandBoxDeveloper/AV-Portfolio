// based on examples from
// http://vormplus.be/blog/article/processing-month-day-27-mesh-basics



PVector [][] vertices = new PVector[11][11];

void setup () {
  size(500, 500);
  fill(255)http://vormplus.be/blog/article/processing-month-day-29-distorted-3d-meshhttp://vormplus.be/blog/article/processing-month-day-29-distorted-3d-mesh;
  for(int j = 0; j < 11; j++) {
    for(int i = 0; i < 11; i++) {
      vertices[i][j] = new PVector(i * 40 + random(-10, 10), j * 40 + random(-10, 10));
    }
  }
  
}

void draw () {
  background(0);
  noFill();
  stroke(255);
  smooth();
  translate(20, 20);
  
  for(int j = 0; j < 10; j++) {
    beginShape(QUAD_STRIP);
    for(int i = 0; i < 11; i++) {
      vertex(vertices[i][j].x, vertices[i][j].y);
      vertex(vertices[i][j + 1].x, vertices[i][j + 1].y);
    }
    endShape();
  }
  
  
}

