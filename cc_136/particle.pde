class Particle {
  final CircularNoise xNoise, yNoise;
  final CircularNoise radiusNoise;
  final CircularNoise rNoise, gNoise, bNoise;
  
  Particle() {
    xNoise = new CircularNoise(0.5);
    yNoise = new CircularNoise(0.5);
    radiusNoise = new CircularNoise(0.5);
    rNoise = new CircularNoise(0.25f);
    gNoise = new CircularNoise(0.25f);
    bNoise = new CircularNoise(0.25f);
  }
  
  void render(float a) {
    final int r = (int)rNoise.value(a, 0, 255);
    final int g = (int)gNoise.value(a, 0, 255);
    final int b = (int)bNoise.value(a, 0, 255);
    
    fill(r, g, b, 192);
    
    final float x = xNoise.value(a, 0, width);
    final float y = yNoise.value(a, 0, height);
    
    final float radius = radiusNoise.value(a, 0, 64);
    circle(x, y, radius);
  }
}
