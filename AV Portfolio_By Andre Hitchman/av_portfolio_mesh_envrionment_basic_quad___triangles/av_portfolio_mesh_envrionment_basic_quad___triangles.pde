// mesh basics sketch
// using QUAD_STRIP and TRIANGLE_STRIP modes with beginShape() function
// based on examples from
// http://vormplus.be/blog/article/processing-month-day-27-mesh-basics

void setup () {
  size(500, 500);
}

void draw () {
//  beginShape(QUAD_STRIP);
//  for(int i = http://vormplus.be/blog/article/processing-month-day-29-distorted-3d-meshhttp://vormplus.be/blog/article/processing-month-day-29-distorted-3d-meshhttp://vormplus.be/blog/article/processing-month-day-29-distorted-3d-mesh0; i < 11; i++) {
//    vertex(i * 40, 0);
//    vertex(i * 40, 60);
//  }
//  endShape();
  
//  beginShape(TRIANGLE_STRIP);
//  for(int i = 0; i < 11; i++) {
//    vertex(i * 40, 0);
//    vertex(i * 40, 60);
//  }
//  endShape();
  
  for( int j = 0; j < 10; j++) {
  beginShape(QUAD_STRIP);
  for(int i = 0; i < 11; i++) {
    vertex(i * 40, j * 40);
    vertex(i * 40, (j+1) * 40);
  }
  endShape();
  }
  
}
