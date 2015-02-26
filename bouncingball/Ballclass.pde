class Ball {
  float x, y, vx, vy, radius;

  Ball (float x_, float y_, float vx_, float vy_, float radius_) {
    x=x_;
    y=y_;
    vx=vx_;
    vy=vy_;
    radius=radius_;
  }

  void draw() {
    ellipse(x, y, radius*2, radius*2);
  }

  void move() {
    x=x+vx;
    y=y+vy;
    if (y>height-radius) {
      //bounce off bottom of screen
      vy=-abs(vy);
    }
    if (x>width-radius) {
      vx=-abs(vx);
    }
    if (y<radius) {
      vy=abs(vy);
    }
    if (x<radius) {
      vx=abs(vx);
    }
  }
}

