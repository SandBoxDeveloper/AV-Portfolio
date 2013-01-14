


size(400, 400);
colorMode(HSB);
background(random(255), random(50, 100), random(50, 100));
noFill();
stroke(255, 100);

float i = 0;
while (i < 100) {
  ellipse(100 + i*2, 100 + i*3, 100 + i, 100 - i);
  i = i + 1;
}
print("end");

