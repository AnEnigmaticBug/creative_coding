class CircularNoise {
  final float cx, cy;
  final float radius;
  
  CircularNoise(float radius) {
    cx = random(0, 1000);
    cy = random(0, 1000);
    this.radius = radius;
  }
  
  float value(float a) {
    final float x = cos(a) * radius;
    final float y = sin(a) * radius;
    
    return noise(cx + x, cy + y);
  }
  
  float value(float a, float min, float max) {
    return map(value(a), 0, 1, min, max);
  }
}
