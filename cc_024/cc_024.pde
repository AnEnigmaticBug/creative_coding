final int scale = 20;
final float inc = 0.1;
final boolean showForceVectors = false;
int cols;
int rows;
float zOff = 0;
Particle[] particles;
PVector[][] flowField;

void setup() {
  size(1024, 1024);

  cols = (width / scale) + 1;
  rows = (height / scale) + 1;

  particles = new Particle[800];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }

  flowField = new PVector[rows][cols];

  background(30);
}

void draw() {
  if (showForceVectors) {
    background(30);
  }
  float yOff = 0;
  stroke(220, 80);
  strokeWeight(2);
  for (int y = 0; y < rows; y++) {
    float xOff = 0;
    for (int x = 0; x < cols; x++) {
      flowField[y][x] = PVector.fromAngle(map(noise(xOff, yOff, zOff), 0, 1, 0, TWO_PI * 2));
      flowField[y][x].setMag(0.1);
      if (showForceVectors) {
        pushMatrix();
        translate(x * scale, y * scale);
        rotate(flowField[y][x].heading());
        line(0, 0, scale, 0);
        popMatrix();
      }
      xOff += inc;
    }
    yOff += inc;
  }
  zOff += 0.003;

  for (Particle p : particles) {
    p.applyForce(flowField[(int)(p.pos.y / scale)][(int)(p.pos.x / scale)]);
    p.update();
    p.show();
  }
}

void mousePressed() {
  save("preview.png");
}
