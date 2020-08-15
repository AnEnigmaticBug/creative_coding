class Boid {
  PVector pos;
  PVector vel;
  PVector acc;

  Boid() {
    pos = new PVector(random(width / 6), random(height));
    vel = PVector.fromAngle(random(-2*PI/3, 0)).mult(random(2, 4));
    acc = new PVector();
  }

  void update(ArrayList<Boid> boids) {
    final PVector a1 = blendVel(boids);
    final PVector a2 = blendPos(boids);
    final PVector a3 = separate(boids);
    final PVector a4 = avoidMouse();
    acc = a1.add(a2).add(a3.mult(1.4)).add(a4.mult(6));

    vel.add(acc);
    pos.add(vel);

    wrapAround();
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(vel.heading());
    //tint(map(vel.heading(), -PI, PI, 0, 511) % 255, 220, 255);
    image(boidImg, 0, 0, boidImg.width / 2, boidImg.height / 2);
    popMatrix();
  }

  private PVector blendVel(ArrayList<Boid> boids) {
    int neighbours = 0;
    float sumHed = 0;

    for (Boid b : boids) {
      if (b != this && b.pos.dist(pos) < sensoryRadius) {
        //sumVel.add(b.vel);
        sumHed += b.vel.heading();
        neighbours++;
      }
    }

    if (neighbours > 0) {
      PVector avgVel = PVector.fromAngle(sumHed / neighbours);
      return avgVel.setMag(maxVel).sub(vel).setMag(maxAcc);
    }

    return new PVector();
  }

  private PVector blendPos(ArrayList<Boid> boids) {
    int neighbours = 0;
    PVector sumPos = new PVector();

    for (Boid b : boids) {
      if (b != this && b.pos.dist(pos) < sensoryRadius) {
        sumPos.add(b.pos);
        neighbours++;
      }
    }

    if (neighbours > 0) {
      PVector avgPos = sumPos.div(neighbours);
      return avgPos.sub(pos).setMag(maxVel).sub(vel).setMag(maxAcc);
    }

    return new PVector();
  }

  private PVector separate(ArrayList<Boid> boids) {
    int neighbours = 0;
    PVector sum = new PVector();

    for (Boid b : boids) {
      final float d = b.pos.dist(pos);
      if (b != this && d < sensoryRadius) {
        sum.add(pos.copy().sub(b.pos).div(d * d));
        neighbours++;
      }
    }

    if (neighbours > 0) {
      PVector avgPos = sum.div(neighbours);
      return avgPos.setMag(maxVel).sub(vel).setMag(maxAcc);
    }

    return new PVector();
  }
  
  private PVector avoidMouse() {
    final PVector mouse = new PVector(mouseX, mouseY);
    if (pos.dist(mouse) < sensoryRadius) {
      return pos.copy().sub(mouse).setMag(maxVel).sub(vel).setMag(maxAcc);
    }
    
    return new PVector();
  }

  private void wrapAround() {
    if (pos.x < 0) pos.x = width;
    if (pos.x > width) pos.x = 0;
    if (pos.y < 0) pos.y = height;
    if (pos.y > height) pos.y = 0;
  }
}
