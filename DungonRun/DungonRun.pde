float PX;
float PY;
float SPD;
boolean moveLeft, moveRight, moveUp, moveDown, useWeapon, useMagic, useItem;

void setup() {
  size(700, 500);

  PX = 330;
  PY = 230;
  SPD = 2;
  moveLeft = moveRight = moveUp = moveDown = useWeapon = useMagic = useItem = false;
}

void draw() {
  background(0, 0, 0);

  if (moveLeft) PX -= SPD;
  if (moveRight) PX += SPD;
  if (moveUp) PY -= SPD;
  if (moveDown) PY += SPD;

  PImage img;
  img = loadImage("Player_Up.tga");
  image(img, PX, PY);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      moveLeft = true;
    } else if (keyCode == RIGHT) {
      moveRight = true;
    } else if (keyCode == UP) {
      moveUp = true;
    } else if (keyCode == DOWN) {
      moveDown = true;
    } else if (key == ',' || key == '<') {
      useItem = true;
    } else if (key == '.' || key == '>') {
      useMagic = true;
    } else if (key == '/' || key == '?') {
      useWeapon = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      moveLeft = false;
    } else if (keyCode == RIGHT) {
      moveRight = false;
    } else if (keyCode == UP) {
      moveUp = false;
    } else if (keyCode == DOWN) {
      moveDown = false;
    }
  }
}

