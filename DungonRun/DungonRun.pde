int face;
//Adds a number to keep trak of witch way the player is faceing.
int walk;
//Adds a number to keep trak of time walking.
float PX;
//Adds a number to keep trak of players X cordantes.
float PY;
//Adds a number to keep trak of the players Y cordantes.
float SPD;
//Adds a number to keep trak of the players speed.
boolean moveLeft, moveRight, moveUp, moveDown, useWeapon, useMagic, useItem, stand;
//Adds true or false varuables to keep track of movement and action.

void setup() {
  //Begins setup.
  size(700, 500);
  //Chose window size.

  //The following just set the things as numbers or true/false.
  face = 3;
  walk = 1;
  PX = 330;
  PY = 230;
  SPD = 3;
  moveLeft = moveRight = moveUp = moveDown = useWeapon = useMagic = useItem = stand = false;
}

void draw() {
  //This dose not have to invole drawing and it loops all things under it.
  background(0, 0, 0);
  //Sets background color.

  //The following changes the PX, PY and SPD of the player.
  if (moveLeft) PX -= SPD;
  if (moveRight) PX += SPD;
  if (moveUp) PY -= SPD;
  if (moveDown) PY += SPD;

  //Says that something is an name for and image.
  PImage walkUp;
  PImage walkLeft;
  PImage walkRight;
  PImage walkDown;
  PImage walkUp1;
  PImage walkUp2;
  //Loads the image and attaces a name to an image(only use .tga and the image must be in the same folder as dungon run).
  walkUp = loadImage("Player_Up.tga");
  walkLeft = loadImage("Player_Left.tga");
  walkRight = loadImage("Player_Right.tga");
  walkUp1 = loadImage("Player_Up_Walk1.tga");
  walkUp2 = loadImage("Player_Up_Walk2.tga");
  walkDown = loadImage("Player_Down.tga");
  //Tells the image were to apper and witch one to apper.
  if (face == 5) {
    image(walkLeft, PX, PY);
  } else if (face == 6) {
    image(walkRight, PX, PY);
  } else if (face == 7) {
    image(walkUp1, PX, PY);
  } else if (face == 8) {
    image(walkDown, PX, PY);
  }
  //Same as the above but for when the charter is standing.
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

//Keeps trak of what keys were pressed and changes this from true or false.
void keyPressed() {
  if (key == CODED) {
    //Key CODED means that it is a speacal key like UP or SHIFT(has to be all caps).
    if (keyCode == LEFT) {
      moveLeft = true;
      face = 5;
      //Ecath number in face means a certain dection show it nows what image to make apper.
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

//Knows when the key is ressesd.
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

