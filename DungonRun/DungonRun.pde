int face;
int walkUp;
float PX;
float PY;
float SPD;
boolean moveLeft, moveRight, moveUp, moveDown, useWeapon, useMagic, useItem, stand;

void setup() {
  size(700, 500);

  face = 3;
  PX = 330;
  PY = 230;
  SPD = 3;
  moveLeft = moveRight = moveUp = moveDown = useWeapon = useMagic = useItem = stand = false;
}

void draw() {
  background(0, 0, 0);

  if (moveLeft) PX -= SPD;
  if (moveRight) PX += SPD;
  if (moveUp) PY -= SPD;
  if (moveDown) PY += SPD;

  PImage walkUp;
  PImage walkLeft;
  PImage walkRight;
  PImage walkDown;
  PImage walkUp1;
  PImage walkUp2;
  walkUp = loadImage("Player_Up.tga");
  walkLeft = loadImage("Player_Left.tga");
  walkRight = loadImage("Player_Right.tga");
  walkUp1 = loadImage("Player_Up_Walk1.tga");
  walkUp2 = loadImage("Player_Up_Walk2.tga");
  walkDown = loadImage("Player_Down.tga");
  if (face == 5) {
    image(walkLeft, PX, PY);
  } else if (face == 6) {
    image(walkRight, PX, PY);
  } else if (face == 7) {
    image(walkUp1, PX, PY);
  } else if (face == 8) {
    image(walkDown, PX, PY);
  }
  if (face == 1 && !moveLeft) {
    image(walkLeft, PX, PY);
  } else if (face == 2 && !moveRight) {
    image(walkRight, PX, PY);
  } else if (face == 3 && !moveUp) {
    image(walkUp, PX, PY);
  } else if (face == 4 && !moveDown) {
    image(walkDown, PX, PY);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      moveLeft = true;
      face = 5;
    } else if (keyCode == RIGHT) {
      moveRight = true;
      face = 6;
    } else if (keyCode == UP) {
      moveUp = true;
      face = 7;
    } else if (keyCode == DOWN) {
      moveDown = true;
      face = 8;
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
      face = 1;
    } else if (keyCode == RIGHT) {
      moveRight = false;
      face = 2;
    } else if (keyCode == UP) {
      moveUp = false;
      face = 3;
    } else if (keyCode == DOWN) {
      moveDown = false;
      face = 4;
    }
  }
}
