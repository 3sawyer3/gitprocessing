int face = 3;
float PX;
float PY;
float SPD;
boolean moveLeft, moveRight, moveUp, moveDown, useWeapon, useMagic, useItem, stand;

PImage faceLeft, faceRight, faceUp, faceDown;
PImage walkLeft1;
PImage walkRight1;
PImage walkRight2;
PImage walkUp1;
PImage walkUp2;
PImage walkDown1;
PImage walkDown2;
Slime slime;

void setup() {
  size(700, 500);
  slime = new Slime();

  PX = 330;
  PY = 230;
  SPD = 3.5;
  moveLeft = moveRight = moveUp = moveDown = useWeapon = useMagic = useItem = stand = false;

  faceLeft = loadImage("Player_Left.tga");
  faceRight = loadImage("Player_Right.tga");
  faceUp = loadImage("Player_Up.tga");
  faceDown = loadImage("Player_Down.tga");
  walkLeft1 = loadImage("Player_Left_Walk1.tga");
  walkRight1 = loadImage("Player_Right_Walk1.tga");
  walkRight2 = loadImage("Player_Right_Walk2.tga");
  walkUp1 = loadImage("Player_Up_Walk1.tga");
  walkUp2 = loadImage("Player_Up_Walk2.png");
  walkDown1 = loadImage("Player_Down_Walk1.tga");
  walkDown2 = loadImage("Player_Down_Walk2.tga");
}

void draw() {
  background(0, 0, 0);
  
  slime.draw();

  int millisBeweenImages = 150;
  boolean useFirstImage = (millis() % (millisBeweenImages * 2)) < millisBeweenImages;

  if (moveLeft) PX -= SPD;
  if (moveRight) PX += SPD;
  if (moveUp) PY -= SPD;
  if (moveDown) PY += SPD;

  if (face == 5) {
    if (useFirstImage) {
      image(walkLeft1, PX, PY);
    } else {
      image(faceLeft, PX, PY);
    }
  } 
  if (face == 6) {
    if (useFirstImage) {
      image(walkRight1, PX, PY);
    } else {
      image(walkRight2, PX, PY);
    }
  } 
  if (face == 7) {
    if (useFirstImage) {
      image(walkUp1, PX, PY);
    } else {
      image(walkUp2, PX, PY);
    }
  } 
  if (face == 8) {
    if (useFirstImage) {
      image(walkDown1, PX, PY);
    } else {
      image(walkDown2, PX, PY);
    }
  } 

  if (face == 1 && !moveLeft) {
    image(faceLeft, PX, PY);
  } else if (face == 2 && !moveRight) {
    image(faceRight, PX, PY);
  } else if (face == 3 && !moveUp) {
    image(faceUp, PX, PY);
  } else if (face == 4 && !moveDown) {
    image(faceDown, PX, PY);
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

