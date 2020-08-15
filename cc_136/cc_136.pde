final Particle[] particles = new Particle[100];
float a = 0;

void setup() {  
  for (int i = 0; i < particles.length; i++) {
     particles[i] = new Particle();
  }
  
  size(512, 512);
  noStroke();
}

void draw() {
  background(40);
  for (int i = 0; i < particles.length; i++) {
     particles[i].render(a);
  }
  a += radians(1);
}
