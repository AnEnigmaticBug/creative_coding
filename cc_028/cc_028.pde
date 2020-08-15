Blob[] blobs = new Blob[10];

void setup() {
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
  
  size(512, 512);
  colorMode(HSB);
  loadPixels();
}

void draw() {
  background(30);
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float intensity = 0;
      
      for (Blob b: blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        intensity += 100 * b.r / d;
      }
      pixels[x + y * width] = color(intensity, 255, 220);
    }
  }
  
  updatePixels();
  
  for (int i = 0; i < blobs.length; i++) {
    blobs[i].update();
  }  
}
