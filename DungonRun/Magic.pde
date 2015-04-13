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

