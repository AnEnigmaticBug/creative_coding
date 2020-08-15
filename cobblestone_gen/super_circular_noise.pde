class SuperCircularNoise {
  final float radius;
  final float offX;
  final float offY;
  final float offZ;

  SuperCircularNoise(float radius) {
    this.radius = radius;
    this.offX = random(100);
    this.offY = random(100);
    this.offZ = random(100);
  }

  float value(float x, float y) {
    final float a = map(x, 0, width , 0, TWO_PI);
    final float b = map(y, 0, height, 0, TWO_PI);
    final float rx = radius * sin(a) * cos(b);
    final float ry = radius * sin(a) * sin(b);
    final float rz = radius * cos(a);
    
    return noise(rx + offX, ry + offY, rz + offZ);
  }
}
