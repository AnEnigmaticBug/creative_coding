void setup() {
  size(1024, 1024);

  background(30);
  colorMode(HSB);
}

void draw() {
  translate(width / 2, height / 2);

  if (mousePressed) {
    final int mx = mouseX - width / 2;
    final int my = mouseY - height / 2;
    final int pmx = pmouseX - width / 2;
    final int pmy = pmouseY - height / 2;

    strokeWeight(6 * exp(-dist(mx, my, pmx, pmy) / 8) + 4);
    stroke(dist(mx, my, pmx, pmy) * 3, 220, 255, 160);

    for (int i = 0; i < 6; i++) {
      rotate(radians(60));
      line(mx, my, pmx, pmy);
      pushMatrix();
      scale(-1, 1);
      line(mx, my, pmx, pmy);
      popMatrix();
    }
  }
}

void keyPressed() {
  saveFrame("wallpaper-###.png");
}
