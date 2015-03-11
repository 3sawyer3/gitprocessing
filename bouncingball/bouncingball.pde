int ballcolor1 = color (255, 160, 0);
int ballcolor2 = color (0, 160, 0);
ArrayList<Ball> bouncingBalls ;
void setup() {
  size(640, 480);
  bouncingBalls=new ArrayList<Ball>();
  bouncingBalls.add(new Ball(100, 200, 2, 2, 25, color (ballcolor1)));
  bouncingBalls.add(new Ball(200, 200, 1, -1, 50, color (ballcolor2)));
}

void draw() {
  background(255);
  for (Ball ball : bouncingBalls) {
    ball.draw();
    ball.move();
    int colorUnderMouse = get(mouseX, mouseY);
    boolean touchingBall = (ball.colr == colorUnderMouse);
//    boolean touchingBall2 = (ballcolor2 == colorUnderMouse);
    if (mousePressed && (mouseButton == LEFT) && touchingBall) {
      ball.touch1();
      }
      else {
        ball.notouch();
      }
    }
  }

