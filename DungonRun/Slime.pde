class Slime {
  float SY = 330;
  float SX = 230;
  float s = .5;
  PImage slime1 = loadImage("Slime_Down.tga");
  PImage slime2 = loadImage("Slime_Down_Walk1.tga");
  int millisBeweenImages = 200;

  void draw() {

    boolean useFirstImage = (millis() % (millisBeweenImages * 2)) < millisBeweenImages;
    float slimeSpd = 3;
    float d = dist(SX, SY, slimeImageCenterX(), slimeImageCenterY());
    if (useFirstImage) {
      image(slime1, SX, SY);
    } else {
      image(slime2, SX, SY);
      if (d < 1) {
        SX = slimeImageCenterX(); 
        SY = slimeImageCenterY();
      } else  if (d <150) {
        SX += slimeSpd * ( slimeImageCenterX()  - SX ) / d;
        SY += slimeSpd * ( slimeImageCenterY()  - SY ) / d;
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

