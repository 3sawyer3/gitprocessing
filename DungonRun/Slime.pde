class Slime {
  int sHealth = 3;
  float SY = 330;
  float SX = 230;
  float s = .5;
  PImage slime1 = loadImage("Slime_Down.tga");
  PImage slime2 = loadImage("Slime_Down_Walk1.tga");
  int millisBeweenImages = 300;

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
        if (hitBox < 70) {
          health -= 1;
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

