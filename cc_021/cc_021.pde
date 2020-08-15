final int maxIterations = 100;

void setup() {
  size(512, 512);
  noLoop();
  
  background(30);
  stroke(220);
    
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float a = map(x, 0, width , -1.5, 0.5);
      float b = map(y, 0, height, -1, 1);
      
      float ca = a;
      float cb = b;
      
      boolean isValid = true;
      
      for (int n = 0; n < maxIterations; n++) {
        float newA = a * a - b * b;
        float newB = 2 * a * b;
        
        a = newA + ca;
        b = newB + cb;
        
        if (a * a + b * b > 16) {
          pixels[x + y * width] = color(map(n, 0, maxIterations, 0, 255));
          isValid = false;
          break;
        }
      }
      
      if (isValid) {
        pixels[x + y * width] = color(0);
      }
    }
  }
  
  updatePixels();
}
