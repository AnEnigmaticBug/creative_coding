final int cellSize = 20;
final boolean showFlowLines = false;

int rows;
int cols;
PVector[][] flowField;
Bubble[] bubbles;
float zOff = 0;
float noiseStep = 0.03;

void setup() {
  size(512, 512);

  rows = 1 + (width / cellSize);
  cols = 1 + (height / cellSize);

  flowField = new PVector[rows][cols];

  bubbles = new Bubble[120];
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble(new PVector(random(width), height - random(10)));
  }
}

void draw() {
  colorMode(RGB);
  background(30);
  
  //for (int y = 0; y < height; y++) {
  //  stroke(lerpColor(color(253, 206, 4), color(240, 125, 0), map(y, 0, height, 0, 1)));
  //  line(0, y, width, y);
  //}

  float yOff = 0;
  for (int r = 0; r < rows; r++) {
    float xOff = 0;
    for (int c = 0; c < cols; c++) {
      flowField[r][c] = PVector.fromAngle(map(noise(xOff, yOff, zOff), 0, 1, -PI, 0));
      flowField[r][c].mult(0.01);
      if (showFlowLines) {
        stroke(220);
        strokeWeight(4);
        pushMatrix();
        translate(c * cellSize, r * cellSize);
        rotate(flowField[r][c].heading());
        line(0, 0, cellSize, 0);
        popMatrix();
      }
      xOff += noiseStep;
    }
    yOff += noiseStep;
  }

  zOff += 0.01;

  for (Bubble b : bubbles) {
    b.applyForce(flowField[(int)(b.pos.y / cellSize)][(int)(b.pos.x / cellSize)]);
    b.update();
    b.render();
  }
}
