

class Particle {
  float x;   //x position
  float y;   //y position
  float dx;  //x velocity
  float dy;  //y velocity
  color c;   //color
  float s;   //size

  
  Particle(float _x, float _y, color _c) {
    x = _x;
    y = _y;
    dx = random(-1, 7);  
    dy = random(-3, 3);
    c = color(255,0,0);
    s = random(1,5);   
  
  }

  // call this method to display the ball
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, s, s);
  }

  // call this method to update the ball's position
  void update() {
    
    if (x < s/2 || x > width-s/2) {
      dx *= -1;
      x += dx;
    } else {
      x += dx;
    } 
  }
}