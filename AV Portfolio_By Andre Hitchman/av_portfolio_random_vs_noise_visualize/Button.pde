class Button {
  int id;
  String t;
  int x;
  int y;
  int w;
  int h;
  
  Button(int id, String t, int x, int y) {
    this.id = id;
    this.t = t;
    this.x = x;
    this.y = y;
    this.w = int(textWidth(t)) + 20;
    this.h = int(textAscent() + textDescent());
  }
  
  void draw() {
    boolean inside = mouseOver();
    fill(inside ? 500 : (modeID == id ? 400 : 200));
    rect(x, y, w, h);
    fill(0);
    text(t, x + 2, y + h - 2);
    if(inside && mousePressed) {
      modeID = id;
      reset();
    }
  }
  boolean mouseOver() {
    return mouseX >= x && mouseX <= x + w && mouseY >= y &&  mouseY <= y + h;
  }
}// end class
