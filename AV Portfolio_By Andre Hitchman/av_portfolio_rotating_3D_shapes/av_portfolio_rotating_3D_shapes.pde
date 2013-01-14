// with help from
// http://vormplus.be/blog/article/drawing-3d-shapes-with-processing

import processing.opengl.*;

void setup () {
  size(500, 500, OPENGL);
  //noStroke();
}

void draw () {
  background(0);
  fill(0, 100, 129, 200);
  lights(); // turn on the lights! add shadows to 3d object to make look more 3D
  
  pushMatrix();
  translate(width/10, height/2);
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  rotateZ(radians(frameCount));
  box(50);
  popMatrix();
  
  
  pushMatrix();
  translate((width/6) * 2, height/2);
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  rotateZ(radians(frameCount));
  box(50, 40, 100);
  popMatrix();
  
  
  noLights();
  pushMatrix();
  translate(width/2 + 20, height/2);
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  rotateZ(radians(frameCount));
  sphereDetail(30);
  sphere(40);
  popMatrix();
  
 
  pushMatrix();
  translate(width/2 + 120, height/2);
  rotateY(radians(frameCount));
  rotateX(radians(frameCount));
  rotateZ(radians(frameCount));
  sphereDetail(6, 18);
  sphere(40);
  popMatrix();
}
