final float sensoryRadius = 50;
final float maxVel = 6;
final float maxAcc = 0.3;

PImage boidImg;
ArrayList<Boid> boids = new ArrayList<Boid>();

void setup() {
  size(512, 512);
  
  boidImg = loadImage("boid.png");

  for (int i = 0; i < 40; i++) {
    boids.add(new Boid());
  }
  
  imageMode(CENTER);
  fill(220);
  strokeWeight(8);
  stroke(255);
}

void draw() {
  colorMode(RGB);
  background(30);
  colorMode(HSB);

  for (Boid b : boids) {
    b.update(boids);
    b.render();
  }
  
  saveFrame("frames/###.tif");
}
