ParticleSystem ps = new ParticleSystem();
boolean mouseDown = false;
 
void setup()
{
  size(800,600,P2D);
  smooth();
  background(255);
  noStroke();
  ellipseMode(RADIUS);
}
 
void draw()
{
  background(255);
  if(mousePressed)
  {
    ps.add(new Particle(mouseX, mouseY));
  }
  ps.run();
}
 
void keyPressed()
{
  if(key != CODED)
  {
    switch(key)
    {
      case 'r' : ps.removeAll(); break;
    }
  }
}


