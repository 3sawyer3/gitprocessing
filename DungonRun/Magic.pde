class Magic {
  int fbY;
  int fbX;
  int fireBoltTimer;
  int millisBeweenImages = 100;
  boolean useFirstImage = (millis() % (millisBeweenImages * 2)) < millisBeweenImages;
  PImage fireBolt1 = loadImage("Fire_Bolt1.png");
  PImage fireBolt2 = loadImage("Fire_Bolt2.png");
  void draw() {
    if (useMagic) {
      fireBoltTimer = millis();
    }
    if (useMagic) {
      if (face == 3 || face == 7) {
        if (useFirstImage) {
          image(fireBolt1, fireBoltTimer, PX);
        } else {
          image(fireBolt2, fireBoltTimer, PX);
        }
      }
      if (fireBoltTimer > 30) {
        fireBoltTimer = 0;
      }
    }
  }
}

