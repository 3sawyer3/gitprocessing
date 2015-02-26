void setup() {
  size(640, 480);
  bouncingBalls=new ArrayList<Ball>();
  bouncingBalls.add(new Ball(100, 200, 1, 1, 25));
  bouncingBalls.add(new Ball(200, 200, 1, -1, 25));
}

void draw(){
  background(255);
  for (Ball ball:bouncingBalls) {
    ball.draw();
    ball.move();
  
}

