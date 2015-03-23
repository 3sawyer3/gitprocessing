int face = 3;
int m = millis();
float PX;
float PY;
float SPD;
boolean moveLeft, moveRight, moveUp, moveDown, useWeapon, useMagic, useItem, stand;

void setup() {
  size(700, 500);

  PX = 330;
  PY = 230;
  SPD = 3.5;
  moveLeft = moveRight = moveUp = moveDown = useWeapon = useMagic = useItem = stand = false;
}

void draw() {
  background(0, 0, 0);

  PImage faceLeft;
  PImage faceRight;
  PImage faceUp;
  PImage faceDown;
  PImage walkLeft1;
  PImage walkRight1;
  PImage walkRight2;
  PImage walkUp1;
  PImage walkUp2;
  PImage walkDown1;
  PImage walkDown2;


  faceLeft = loadImage("Player_Left.tga");
  faceRight = loadImage("Player_Right.tga");
  faceUp = loadImage("Player_Up.tga");
  faceDown = loadImage("Player_Down.tga");
  walkLeft1 = loadImage("Player_Left1.tga");
  walkRight1 = loadImage("Player_Right1.tga");
  walkRight2 = loadImage("Player_Right_Walk2");
  walkUp1 = loadImage("Player_Up_Walk1.tga");
  walkUp2 = loadImage("Player_Up_Walk2.tga");
  walkDown1 = loadImage("Player_Down1.tga");
  walkDown2 = loadImage("Player_Down2.tga");

  if (moveLeft) PX -= SPD;
  if (moveRight) PX += SPD;
  if (moveUp) PY -= SPD;
  if (moveDown) PY += SPD;

  if (face == 5 && m < 1) {
    image(walkLeft1, PX, PY);
  } else if (face == 5 && m > 1) {
    image(faceLeft, PX, PY);
  } else if (face == 6 && m < 1) {
    image(walkRight1, PX, PY);
  } else if (face == 6 && m > 1) {
    image(walkRight2, PX, PY);
  } else if (face == 7 && m < 1) {
    image(walkUp1, PX, PY);
  } else if (face == 7 && m > 1) {
    image(walkUp2, PX, PY);
  } else if (face == 8 && m < 1) {
    image(walkDown1, PX, PY);
  } else if (face == 8 && m > 1) {
    image(walkDown2, PX, PY);
  }
  if (face == 1 && !moveLeft) {
    image(faceLeft, PX, PY);
  } else if (face == 2 && !moveRight) {
    image(faceRight, PX, PY);
  } else if (face == 3 && !moveUp) {
    image(faceUp, PX, PY);
  } else if (face == 4 && !moveDown) {
    image(faceDown, PX, PY);
  } else if (m > 2) {
    m = 0;
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

