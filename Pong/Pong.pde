//global variables
ArrayList<Ball> bouncingBalls ;
Paddle paddle;

void setup() {
  size(500, 600);
  bouncingBalls=new ArrayList<Ball>();
  bouncingBalls.add(new Ball(100, 200, 2, 2, 25, color (0, 0, 0)));
  paddle =new Paddle();
}

void draw() {
  background(255);
  for (Ball ball : bouncingBalls) {
    ball.draw();
    ball.move();
    paddle.draw();
  }
}

