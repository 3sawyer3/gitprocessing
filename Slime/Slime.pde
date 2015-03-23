int y = 125;
int x = 125;
int s = 2;

void setup() {
  size(250, 250);
}

void draw() {
  background(15, 15, 15);
  PImage slime;
  slime = loadImage("Slime_Down.tga");
  image(slime, x, y);
  if (mouseX < 125) x -= s;
  if (mouseX > 125) x += s;
  if (mouseY < 125) y -= s;
  if (mouseY > 125) y += s;
}
