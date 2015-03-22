int face;
//Adds a number to keep track of which way the player is facing.
int walkL;
int walkR;
int walkU;
int walkD;
// /\ Adds a number to keep track of time walking.
int m = millis();
float PX;
//Adds a number to keep track of player's X coordinates.
float PY;
//Adds a number to keep track of the player's Y coordinates.
float SPD;
//Adds a number to keep track of the player's speed.
boolean moveLeft, moveRight, moveUp, moveDown, useWeapon, useMagic, useItem, stand;
//Adds true or false variables to keep track of movement and action.

void setup() {
  //Begins setup.
  size(700, 500);
  //Chosen window size.

  //The following just set the things as numbers or true/false.
  face = 3;
  walkL = 1;
  walkR = 1;
  walkU = 1;
  walkD = 1;
  PX = 330;
  PY = 230;
  SPD = 3;
  moveLeft = moveRight = moveUp = moveDown = useWeapon = useMagic = useItem = stand = false;
}

void draw() {
  //This does not have to involve drawing and it loops all things under it.
  background(0, 0, 0);
  //Sets background color.

  //The following changes the PX, PY and SPD of the player.
  if (moveLeft) PX -= SPD;
  if (moveRight) PX += SPD;
  if (moveUp) PY -= SPD;
  if (moveDown) PY += SPD;

  //Says that something is a name for an image.
  PImage faceUp;
  PImage faceLeft;
  PImage walkLeft1;
  PImage walkLeft2;
  PImage walkRight;
  PImage walkDown;
  PImage walkUp1;
  PImage walkUp2;
  //Loads the image and attaches a name to an image(only use .tga and the image must be in the same folder as "dungon run").
  faceLeft = loadImage("Player_Left.tga");
  faceUp = loadImage("Player_Up.tga");
  walkLeft1 = loadImage("Player_Left1.tga");
  walkLeft2 = loadImage("Player_Left2.tga");
  walkRight = loadImage("Player_Right.tga");
  walkUp1 = loadImage("Player_Up_Walk1.tga");
  walkUp2 = loadImage("Player_Up_Walk2.tga");
  walkDown = loadImage("Player_Down.tga");
  //Tells the image where to appear and which one to appear.
  if (face == 5 && m == 1) {
    image(faceLeft, PX, PY);
  } else if (face == 6 && m == 2) {
    image(faceUp, PX, PY);
  } else if (face == 6) {
    image(walkRight, PX, PY);
  } else if (face == 7) {
    image(walkUp1, PX, PY);
  } else if (face == 8) {
    image(walkDown, PX, PY);
  }
  //Same as the above but for when the character is standing.
  if (face == 1 && !moveLeft) {
    image(faceLeft, PX, PY);
  } else if (face == 2 && !moveRight) {
    image(walkRight, PX, PY);
  } else if (face == 3 && !moveUp) {
    image(faceUp, PX, PY);
  } else if (face == 4 && !moveDown) {
    image(walkDown, PX, PY);
  }
  if (m > 2) {
    m = 1;
  }
}

//Keeps track of what keys were pressed and changes this from true or false. (also loops)
void keyPressed() {
  if (key == CODED) {
    //Key CODED means that it is a special key like UP or SHIFT(has to be all caps).
    if (keyCode == LEFT) {
      moveLeft = true;
      face = 5;
      walkL += 1;
      //Every number for face represents a different direction so it knows what image to make appear.
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

//Knows when the key is released. (also loops)
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

