int rows, cols;
int scale = 20;
int w = 900;
int h = 1200;

int maxHeight = 120;

float t;

float[][] terrain;

void setup() {
  size(360, 360, P3D);
  
  cols = w / scale;
  rows = h / scale;
  
  terrain = new float[cols][rows];
}

void draw() {
  background(135, 206, 235);
    
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  
  fillNoise(t);
  t -= 0.1;
  
  for (int y = 0; y < rows - 1; ++y) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; ++x) {
      if (terrain[x][y] > 40) {
        fill(200);
        stroke(255);
      } else if (terrain[x][y] < -40) {
        fill(0, 0, 200);
        stroke(0, 0, 255);
      } else {
        fill(181, 101, 29);
        stroke(101, 67, 33);
      }
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
    }
    endShape();
  }
}

void fillNoise(float t) {
  float yoff = 0;
  for (int y = 0; y < rows; ++y) {
    float xoff = 0;
    for (int x = 0; x < cols; ++x) {
      terrain[x][y] = map(noise(xoff, t + yoff), 0, 1, -maxHeight, maxHeight);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
}
