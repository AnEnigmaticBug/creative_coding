class Blob {
  PVector pos;
  PVector vel;
  float r;
  
  Blob(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D().mult(random(2, 5));
    r = random(20, 60);
  }
  
  void update() {
    if (pos.x < 0 || pos.x > width) {
      vel.x *= -1;
    }
    
    if (pos.y < 0 || pos.y > height) {
      vel.y *= -1;
    }
    
    pos.add(vel);
  }
  
  void draw() {
    noFill();
    stroke(0);
    strokeWeight(4);
    circle(pos.x, pos.y, r);
  }
}
