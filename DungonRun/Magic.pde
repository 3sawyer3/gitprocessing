class Magic {
  boolean fireBoltShot = true;
  PImage fireBolt = loadImage("Fire_Bolt.png");
  void draw() {
    if (fireBoltShot) {
      if (face == 3 || face == 7) {
        image(fireBolt, PY, PX);
      }
    }
  }
}
