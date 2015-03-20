class Paddle {

  void draw() {
    fill(0, 0, 0);
    rectMode(CENTER);
    rect(getX(), getY(), 110, 15, 10);
  }

  float getX() {
    return mouseX;
  }
  float getY() {
    return 490;
  }
}

