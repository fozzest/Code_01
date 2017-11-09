class Ball {
  float x;   //x position
  float y;   //y position
  float dx;  //x velocity
  float dy;  //y velocity

  //think of the constructor function as the setup() for the object instance.
  //notice there is no "void" or return type. Technically it returns itself (a Ball)
  //this constructor takes no arguments - it sets all fields automatically.
  Ball() {
    x = width/2;
    y = height/2;
    dx = 10;  //set a random velocity
    dy = random(-3, 3);
  }

  // call this method to display the ball
  void display() {
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(random(x , x+50), random(y, y+50), 10, 10);
  }

  // call this method to update the ball's position
  void update() {
    //c = color(map(dist(mouseX,mouseY,x,y),0,100,255,0));
    x += dx;

    if (x < 0 || x > width) {

      if (x < 0) {
        p2Score++;
        big1 = big1+2;
        enC1 = enC1 +20;
      }

      if (x > width) {
        p1Score++;
        big2 = big2+3;
        enC2 = enC2 +20;
      }

      x = width/2;
      y = height/2;
      dx = -dx;  //set a random velocity
      dy = random(-3, 3);
    } 

    if (y < 0 || y > height) {
      //x= -x;
      dy *= -1;
      y += dy;
    } else { 
      y += dy;
    }
  }

  void checkCollisionWithPaddle(Paddle p) {
    if (x > p.x && x < p.x + p.w) {
      if (y > p.y && y < p.y + p.h1) {
        dx = -dx;
        dy = random(-10, 10);
        for (int i = 0; i < pa.length; i++) {
          pa[i].update();
          pa[i].display();
        }
      }
      if (y > p.y && y < p.y + p.h2) {
        dx = -dx;
        dy = random(-10, 10);
      }
    }
  }
}