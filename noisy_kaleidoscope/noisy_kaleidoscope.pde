float prevNoiseValue = 0;
float currNoiseValue = 0;
int dos = (int)random(12);

void setup() {
  size(800, 800);

  background(30);
  colorMode(HSB);
}

void draw() {
  translate(width / 2, height / 2);
  float noiseX = random(1000);
  float stepSize = map(random(1), 0, 1, 8, 64);
  float prevX = 0;
  float prevY = 0;
  float angle = 0;
  
  stroke(map(noise(noiseX), 0, 1, 0, 511) % 255, 220, 255, 192);

  for (int i = 0; i < 2; i++) {
    currNoiseValue = noise(noiseX);

    float delta = currNoiseValue - prevNoiseValue;
    strokeWeight(map(abs(delta), 0, 1, 4, 2));
    angle += map(delta, -1, 1, -PI / 2, +PI / 2);


    int currX = (int)(prevX + stepSize * cos(angle));
    int currY = (int)(prevY + stepSize * sin(angle));

    if (currX < -width / 2) {
      angle = 0;
    }
    if (currX > +width / 2) {
      angle = PI;
    }

    if (currY < -height / 2) {
      angle = +PI / 2;
    }
    if (currY > +height / 2) {
      angle = -PI / 2;
    }

    currX = (int)(prevX + stepSize * cos(angle));
    currY = (int)(prevY + stepSize * sin(angle));

    //stroke(map(delta, -1, 1, 0, 511) % 255, 220, 255, 192);

    fill(255, 220, 255);

    for (int j = 0; j < dos; j++) {
      rotate(radians(360 / dos));
      line(currX, currY, prevX, prevY);
      pushMatrix();
      scale(1, -1);
      line(currX, currY, prevX, prevY);
      popMatrix();
    }

    prevX = currX;
    prevY = currY;

    noiseX += 0.5;
  }
}

void mousePressed() {
  saveFrame("screenshot-####.png");
}
