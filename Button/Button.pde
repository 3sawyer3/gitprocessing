int backgroundcolor = color (255, 160, 0);

void setup() {
  size (600, 400);
  background(backgroundcolor);
}

void draw() {
  int colorUnderMouse = get(mouseX, mouseY);
  boolean touchingBackground = (backgroundcolor == colorUnderMouse);
  if (mousePressed && (mouseButton == LEFT) && !touchingBackground) {
    fill(0);
  } 
  else if (mousePressed && (mouseButton == RIGHT)&& !touchingBackground) {
    fill(255);
  } 
  else {
    fill(126);
  } 
  rectMode(CENTER);
  rect(width/2, height/2, 70, 55, 50);
}
