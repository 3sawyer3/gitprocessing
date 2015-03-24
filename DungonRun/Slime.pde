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
          //        }
          //        if (hit) {
          //          inble = second();
          //        }
          //        if (inble == 1) {
          //          playerDead = true;
          //        }
          //        if (inble > 1) {
          //          hit = false;
          //          inble = 0;
          //        }
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

