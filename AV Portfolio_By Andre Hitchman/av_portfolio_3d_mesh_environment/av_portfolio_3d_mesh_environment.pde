// this sketch is a 3D mesh environment
// based on the example at
// http://vormplus.be/blog/article/processing-month-day-29-distorted-3d-mesh

import processing.opengl.*;


PVector [][] vertices = new PVector[11][11];

void setup () {
  size(500, 500, OPENGL);
  fill(255);
  for(int j = 0; j < 11; j++) {
    for(int i = 0; i < 11; i++) {
      vertices[i][j] = new PVector(i * 40 + random(-10, 10), j * 40 + random(-10, 10), random(-20, 20));
    }
  }
  
}

void draw () {
  background(0);
  fill(255);
  stroke(0);
  smooth();
  //translate(20, 20);
 
  translate(width/2, 20, -100);
  //rotate(mouseX);
  //rotateY(radians(mouseY));
  //rotateX(radians(mouseX));
  rotateY(radians(frameCount));
  
  pushMatrix();
  for(int j = 0; j < 10; j++) {
    beginShape(TRIANGLE_STRIP);
    for(int i = 0; i < 11; i++) {
      vertex(vertices[i][j].x, vertices[i][j].y, vertices[i][j].z);
      vertex(vertices[i][j + 1].x, vertices[i][j + 1].y, vertices[i][j + 1].z);
    }
    endShape();
  }
  popMatrix();
  
}
