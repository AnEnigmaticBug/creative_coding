SuperCircularNoise scn;

void setup() {
  scn = new SuperCircularNoise(5);
  
  size(256, 256);
  background(30);
  colorMode(HSB);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {      
      final int h = (int)map(sin(map(scn.value(x, y), 0, 1, 0, TWO_PI)), -1, 1, 0, 511);
      final int s = (int)map(cos(map(scn.value(x, y), 0, 1, 0, TWO_PI)), -1, 1, 0, 511);
      final int b = (int)map(sin(map(scn.value(x, y), 0, 1, 0, TWO_PI)), -1, 1, 0, 511);
      pixels[x + y * width] = color(map(scn.value(x, y), 0, 1, 0, 255), 220, 255);
    }
  }
  updatePixels();
  
  noLoop();
}

void mousePressed() {
  //saveFrame("screenshots/s###.png");
}
