class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector prevPos;
  float maxSpeed;
  
  Particle() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    prevPos = pos;
    maxSpeed = 2;
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    
    if (pos.x < 0) {
      pos.x = width;
      prevPos.x = pos.x;
    } else if (pos.x > width) {
      pos.x = 0;
      prevPos.x = pos.x;
    }
    if (pos.y < 0) {
      pos.y = height;
      prevPos.y = pos.y;
    } else if (pos.y > height) {
      pos.y = 0;
      prevPos.y = pos.y;
    }
    
    acc.mult(0f);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void show() {
    stroke(255, 10);
    strokeWeight(1);
    line(pos.x, pos.y, prevPos.x, prevPos.y);
  }
}
