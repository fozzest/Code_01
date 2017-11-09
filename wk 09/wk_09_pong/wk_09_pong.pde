// QUESTION 9 - 
// put together a skeleton Pong game.

// create a bouncing ball that starts in the middle of the screen 
// either use a class or independent variables, it doesn't matter
// make it bounce only on the top and bottom walls
// create two paddles. this can also be a class or not
// have key presses control the up and down movement of the paddles independently
// make the ball reverse x direction when it touches the paddles
// return the ball to the middle of the screen with a random position when it goes off screen
// keep score for the two players

float big1 = 0.3;
float big2 = 0.3;
float enC1 = 100;
float enC2 = 100;
int p1Score;
int p2Score;


boolean p1Up = false;
boolean p1Down = false;
boolean p2Up = false;
boolean p2Down = false;
Particle[] pa = new Particle[100];
Ball b;
Paddle p1;
Paddle p2;

void setup() {
  size(1000, 700);
  b = new Ball();
  p1 = new Paddle(0);
  p2 = new Paddle(1);
   for (int i = 0; i < pa.length; i++) {
          pa[i] = new Particle(width/2, height/2, color(map(i, 0, pa.length, 0, 255)));
        }
  
}

void draw() {
  background(0);
   
        
  //for (int i = 0; i < p.length; i++) {
 //p[i].update();
 //p[i].display();

  
  b.checkCollisionWithPaddle(p1);
    
  
  b.checkCollisionWithPaddle(p2);

  b.update();
  b.display();
  p1.update();
  p1.display();
  p2.update();
  p2.display();

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(36*big1);
  text(p1Score, width/2 - enC1, height/2);
  textSize(36*big2);
  text(p2Score, width/2 + enC2, height/2);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = true;
    }
    if (keyCode == DOWN) {
      p2Down = true;
    }
  } else {
    if (key == 'w') {
      p1Up = true;
    }
    if (key == 's') {
      p1Down = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = false;
    }
    if (keyCode == DOWN) {
      p2Down = false;
    }
  } else {
    if (key == 'w') {
      p1Up = false;
    }
    if (key == 's') {
      p1Down = false;
    }
  }
}