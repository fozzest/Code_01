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
    float r;
    r=200;
    float s = map(life, 1000, 0, 1, 0);
    fill(r, 136, 0);
    noStroke();
    //stroke(255);
    ellipse(pos.x, pos.y, s, s);
    if (life<=10000) {
      r=r+1;
    }
  }

  void addAttract(float x, float y, float maxForce) {
    //float angle = atan2(y - pos.y, x - pos.x);
    if (a.x<550 || a.x> 700) {
      //float angle = atan2(y - pos.y, x - pos.x);
      float angle = atan2(mouseY-height/2, mouseX-width/2);
      //attempting to get the entire 'belt' to rotate around the planet via mouse position
      float magnitude = 600;

      float forceStr = maxForce / ( dist(pos.x, x, pos.y, y));
      PVector newForce = new PVector(sin(angle) * magnitude, sin(angle) * magnitude);
      newForce = newForce.mult(forceStr);
      acc.add(newForce);
    }
  }

void addRepel(float x, float y, float maxForce) {
    if (a.x > 550 & a.x < 700 & a.y<500) {
      //float angle = atan2(y + pos.y, x + pos.x);
       //float angle = atan2(mouseY-height/2, mouseX-width/2);
      //attempting to get the entire 'belt' to rotate around the planet via mouse position
      float magnitude = 600;

      float forceStr = maxForce / ( dist(pos.x, x, pos.y, y));
      PVector newForce = new PVector(tan(-angle*2) * magnitude, tan(-angle*2) * magnitude);
      newForce = newForce.mult(forceStr);
      acc.add(newForce);
    }
    if (a.x > 200 & a.x < 500 & a.y>500) {
      //float angle = atan2(y + pos.y, x + pos.x);
       //float angle = atan2(mouseY-height/2, mouseX-width/2);
      
      float magnitude = 600;

      float forceStr = maxForce / ( dist(pos.x, x, pos.y, y));
      PVector newForce = new PVector(tan(-angle*2) * magnitude, tan(-angle*2) * magnitude);
      newForce = newForce.mult(forceStr);
      acc.add(newForce);
    }
  }
}