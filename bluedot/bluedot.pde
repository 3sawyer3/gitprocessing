void setup() {
  size(600, 400);  
  background(255);
}

void draw() {
  fill(0, 0, 255);
  stroke(255, 0, 0);
  strokeWeight(10);
  ellipse(mouseX, mouseY, 50, 50);
}

