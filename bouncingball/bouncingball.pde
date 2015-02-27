ArrayList<Ball> bouncingBalls ;
void setup() {
  size(640, 480);
  bouncingBalls=new ArrayList<Ball>();
  bouncingBalls.add(new Ball(100, 200, 2, 2, 25, color (0, 56, 100, 50)));
  bouncingBalls.add(new Ball(200, 200, 1, -1, 50, color (255, 0, 0, 100)));
}

void draw() {
  background(255);
  for (Ball ball:bouncingBalls) {
    ball.draw();
    ball.move();
  }
}

