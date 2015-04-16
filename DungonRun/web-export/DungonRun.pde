// @pjs preload must be used to preload the image 

/* @pjs preload="Player_Left.tga"; */
/* @pjs preload="Player_Right.tga"; */
/* @pjs preload="Player_Up.tga"; */
/* @pjs preload="Player_Down.tga"; */
/* @pjs preload="Player_Left_Walk1.tga"; */
/* @pjs preload="Player_Right_Walk1.tga"; */
/* @pjs preload="Player_Right_Walk2.tga"; */
/* @pjs preload="Player_Up_Walk1.tga"; */
/* @pjs preload="Player_Up_Walk2.tga"; */
/* @pjs preload="Player_Down_Walk1.tga"; */
/* @pjs preload="Player_Up_Walk2.tga"; */
/* @pjs preload="Player_Left_Sword.png"; */
/* @pjs preload="Player_Right_Sword.png"; */
/* @pjs preload="Player_Up_Sword.png"; */
/* @pjs preload="Player_Down_Sword.png"; */
/* @pjs preload="Player_Left_Magic_Fire.png"; */
/* @pjs preload="Player_Right_Magic_Fire.png"; */
/* @pjs preload="Player_Up_Magic_Fire.png"; */
/* @pjs preload="Player_Down_Magic_Fire.png"; */
/* @pjs preload="Player_Dead1.png"; */
/* @pjs preload="Slime_Down.tga"; */
/* @pjs preload="Slime_Down_Walk1.tga"; */

int face = 3;
int health = 5;
int mana = 5;
float PX;
float PY;
float SPD;
boolean moveLeft, moveRight, moveUp, moveDown, useWeapon, useMagic, useItem, playerDead;

PImage faceLeft, faceRight, faceUp, faceDown, walkLeft1, walkRight1, walkRight2, walkUp1, walkUp2, walkDown1, walkDown2, swordLeft, swordRight, swordUp, swordDown, magicLeftF, magicRightF, magicUpF, magicDownF, deadPlayer1;
Slime slime;
Magic magic;

void setup() {
  size(700, 500);
  slime = new Slime();

  PX = 330;
  PY = 230;
  SPD = 3;
  moveLeft = moveRight = moveUp = moveDown = useWeapon = useMagic = useItem = playerDead = false;

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
  swordLeft = loadImage("Player_Left_Sword.png");
  swordRight = loadImage("Player_Right_Sword.png");
  swordUp = loadImage("Player_Up_Sword.png");
  swordDown = loadImage("Player_Down_Sword.png");
  magicLeftF = loadImage("Player_Left_Magic_Fire.png");
  magicRightF = loadImage("Player_Right_Magic_Fire.png");
  magicUpF = loadImage("Player_Up_Magic_Fire.png");
  magicDownF = loadImage("Player_Down_Magic_Fire.png");
  deadPlayer1 = loadImage("Player_Dead1.png");
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
  if (health < 0) playerDead = true;

  if (playerDead) {
    image(deadPlayer1, PX, PY);
    moveLeft = false;
    moveRight = false;
    moveUp = false;
    moveDown = false;
  }

  if (!playerDead) {
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
    if (face == 1) {
      if (useMagic) {
        image(magicLeftF, PX, PY);
      }
    }
    if (face == 2) {
      if (useMagic) {
        image(magicRightF, PX, PY);
      }
    }
    if (face == 3) {
      if (useMagic) {
        image(magicUpF, PX, PY);
      }
    }
    if (face == 4) {
      if (useMagic) {
        image(magicDownF, PX, PY);
      }
    }
    if (face == 1) {
      if (useWeapon) {
        image(swordLeft, PX, PY);
      }
    }
    if (face == 2) {
      if (useWeapon) {
        image(swordRight, PX, PY);
      }
    }
    if (face == 3) {
      if (useWeapon) {
        image(swordUp, PX, PY);
      }
    }
    if (face == 4) {
      if (useWeapon) {
        image(swordDown, PX, PY);
      }
    }

    if (face == 1 && !moveLeft && !useMagic && !useWeapon) {
      image(faceLeft, PX, PY);
    } else if (face == 2 && !moveRight && !useMagic && !useWeapon) {
      image(faceRight, PX, PY);
    } else if (face == 3 && !moveUp && !useMagic && !useWeapon) {
      image(faceUp, PX, PY);
    } else if (face == 4 && !moveDown && !useMagic && !useWeapon) {
      image(faceDown, PX, PY);
    }
  }
}

void keyPressed() {
  if (!playerDead) {
    if (key == 'z' || key == 'Z') {
      useItem = true;
    } else if (key == 'x' || key == 'X') {
      useMagic = true;
    } else if (key == 'c' || key == 'C') {
      useWeapon = true;
    }
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
      }
    }
  }
}

void keyReleased() {
  if (!playerDead) {
    if (key == 'z' || key == 'Z') {
      useItem = false;
    } else if (key == 'x' || key == 'X') {
      useMagic = false;
    } else if (key == 'c' || key == 'C') {
      useWeapon = false;
    }
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
}

class Magic {
  int fbY;
  int fbX;
  int spellTimer;
  int millisBeweenImages = 100;
  float MX;
  float MY;
  boolean useFirstImage = (millis() % (millisBeweenImages * 2)) < millisBeweenImages;
  PImage fireBolt1 = loadImage("Fire_Bolt1.png");
  PImage fireBolt2 = loadImage("Fire_Bolt2.png");
  void draw() {
    if (useMagic) {
      for (int spellTimer = 0; spellTimer < 40; spellTimer = spellTimer+1) {
      }
    }
    if (useMagic) {
      if (face == 3 || face == 7) {
        spellTimer = millis();
        MX = PX;
        MY = PY;
        if (useFirstImage) {
          image(fireBolt1, spellTimer, MX);
        } else {
          image(fireBolt2, spellTimer, MX);
        }
      }
    }
  }
}

class Player {
}
class Slime {
  int sHealth = 3;
  int millisBeweenImages = 300;
  int inble = 0;
  float SY = 330;
  float SX = 230;
  float s = 1;
  PImage slime1 = loadImage("Slime_Down.tga");
  PImage slime2 = loadImage("Slime_Down_Walk1.tga");
  boolean hit = false;

  void draw() {

    boolean useFirstImage = (millis() % (millisBeweenImages * 2)) < millisBeweenImages;
    float slimeSpd = 2;
    float sight = dist(SX, SY, slimeImageCenterX(), slimeImageCenterY());
    float hitBox = dist(SX, SY, slimeImageCenterX(), slimeImageCenterY());
    if (sHealth > 0) {
      if (useFirstImage) {
        image(slime1, SX, SY);
      } else {
        image(slime2, SX, SY);
        if (sight < 1) {
          SX = slimeImageCenterX(); 
          SY = slimeImageCenterY();
        } else  if (sight <150) {
          SX += slimeSpd * ( slimeImageCenterX()  - SX ) / sight;
          SY += slimeSpd * ( slimeImageCenterY()  - SY ) / sight;
        }
        if (hitBox < 50 && hit == false) {
          health -= 1;
          hit = true;
          inble = millis();
        }
        if (hit && millis() - inble > 500) {
          hit = false;
          inble = 0;
        }
      }
    }
  }

  float slimeImageCenterX() {
    return PX - slime1.width /2;
  }

  float slimeImageCenterY() {
    return PY - slime1.height /2;
  }
}


