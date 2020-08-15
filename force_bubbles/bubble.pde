class Bubble {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed;
  float radius;
  
  Bubble(PVector pos) {
    this.pos = pos;
    this.vel = new PVector();
    this.acc = new PVector();
    this.maxSpeed = random(2, 4);
    this.radius = random(4, 16);
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0f);
    
    if (pos.x < 0) {
      vel.x = 0;
      pos.x = width;
    }
    if (pos.y < 0) {
      vel.y = 0;
      pos.y = height;
    }
    if (pos.x > width) {
      vel.x = 0;
      pos.x = 0;
    }
    if (pos.y > height) {
      vel.y = 0;
      pos.y = 0;
    }
  }
  
  void applyForce(PVector force) {
    acc.add(force.div(radius));
  }
  
  void render() {
    colorMode(HSB);
    strokeWeight(1);
    stroke(255, 40);
    fill(map(vel.heading(), -PI, PI, 0, 511) % 256, 249, 249, 28);
    circle(pos.x, pos.y, radius);
  }
}
