ArrayList<Ball> bouncingBalls ;
void setup() {
  size(700, 550);
  bouncingBalls=new ArrayList<Ball>();
  bouncingBalls.add(new Ball(100, 200, 2, 2, 25, color (0, 0, 1)));
}

void draw() {
    background(255);
  for (Ball ball : bouncingBalls) {
    ball.draw();
    ball.move();
    fill(0, 0, 0);
    rectMode(CENTER);
    rect(mouseX, 490, 110, 15, 10);
  }
}
