float SY = 125;
float SX = 125;
int s = 1;
PImage slime;

void setup() {
  size(250, 250);
  slime = loadImage("Slime_Down.tga");
}

void draw() {
  background(15, 15, 15);

  float slimeSpd = 3;
  float d = dist(SX, SY, slimeImageCenterX(), slimeImageCenterY());
  if (d < 1) {
    SX = slimeImageCenterX(); 
    SY = slimeImageCenterY();
  } else  if (d <75) {
    SX += slimeSpd * ( slimeImageCenterX()  - SX ) / d;
    SY += slimeSpd * ( slimeImageCenterY()  - SY ) / d;
  }
  image(slime, SX, SY);
}

float slimeImageCenterX() {
  return PX - slime.width /2;
}

float slimeImageCenterY() {
  return PY - slime.height /2;
}


