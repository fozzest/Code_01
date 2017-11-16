class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float life;
  float maxSpeed;
  float co;
  float radius;
  float angle;

  Particle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-1, 1));
    acc = new PVector(0, 0);
    life = 10000;
    maxSpeed = 50;
  }

  void update() {
    acc.mult(0.5);
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);

    life--;
  }

  void display() {

    float s = map(life, 1000, 0, 1, 0);
    fill(#FAA51C);
    noStroke();
    //stroke(255);
    ellipse(pos.x, pos.y, s, s);
  }

  void addAttract(float x, float y, float maxForce) {
    //float angle = atan2(y - pos.y, x - pos.x);
    float angle = random(TWO_PI);
    float magnitude = 700;

    float forceStr = maxForce / ( dist(pos.x, x, pos.y, y));
    PVector newForce = new PVector(sin(angle) * magnitude, sin(angle) * magnitude);
    newForce = newForce.mult(forceStr);
    acc.add(newForce);
  
  
    if (a.x > 100 & a.x < 200) {
      float angle = random(TWO_PI);
      float magnitude = 700;

      float forceStr = maxForce / ( dist(pos.x, x, pos.y, y));
      PVector newForce = new PVector(-sin(angle) * magnitude, sin(angle) * magnitude);
    
  }
  }
}