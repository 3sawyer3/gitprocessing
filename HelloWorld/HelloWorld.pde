void setup() {
  size(600, 400);
}

void draw() {  
  background(255);
  fill(225, 0, 0);
    triangle(30, 75, 58, 20, 86, 75);
  String message="hello world";
  textSize(36);
  float textW=textWidth(message);
  translate(mouseX-textW/2, mouseY);
  rotate(frameCount*0.01);
  text(message,0,0);
}
