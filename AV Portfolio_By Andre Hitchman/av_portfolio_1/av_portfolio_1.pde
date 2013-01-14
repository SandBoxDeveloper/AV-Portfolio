// http://vormplus.be/blog/article/an-introduction-to-processing


int x, y; // coordinates for the arc
int numberOfArcs = 200; // number of arc to produce
float rotation = - (HALF_PI / 3); // how many degrees arcs are rotated compared to previous arc
int arcSize;
int step = 40; // 
float start, stop; // start and stop point of arcs

void setup()
{
    size(420, 420);
    background(240);
    stroke(127);
    noFill();
    ellipseMode(CENTER);
    strokeCap(PROJECT);
    smooth();
    noLoop();
}
void draw()
{
    for (int i = 0; i < numberOfArcs; i++) {
        strokeWeight(i);
        x = width / 2;
        y = height / 2;
        arcSize = 200 + (step * i);
        start = rotation * i;
        stop = rotation * i + TWO_PI - HALF_PI;
        arc(x, y, arcSize, arcSize, start, stop);
    }
}
