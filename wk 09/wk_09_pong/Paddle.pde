class Paddle {
  float x;
  float y;
  float w;
float g1;
float g2;
  float h1;
  float h2;
  int playerNum;

  Paddle(int whichPlayer) {
    playerNum = whichPlayer;
    if (whichPlayer == 0) {
      x = 150;
      y = height/2;
      w = 20;
      h1 = h1;
    } else if (whichPlayer == 1) {
      y = height/2;
      w = 20;
      h2 = h2;
      x = width-150-w;
    }
  }

  void update() {

    if (playerNum == 0) {
      if (p1Up) {
        y-=10;
      } 
      if (p1Down) {
        y+=10;
      }
    }
    if (playerNum == 1) {
      if (p2Up) {
        y-=10;
      } 
      if (p2Down) {
        y+=10;
      }
    }
    
    
  }
  void display() {
    rectMode(CORNER);
    fill(255);
    rect(x, y, w, h1);
    h1 = 150 + g1;
    h2= 150+ g2;
    rect(x, y, w, h2);
    if (b.x > x && b.x < x + w) {
      if  (b.y > y && b.y < y + h2) {
        fill(255, 0, 0);
        rect (x-50, y-50, w+100, h2+100);
        fill(255, 222, 0);
        rect (x-25, y-25, w+50, h2+50);
        
        fill(0, 0, 255);
        rect (x-10, y-10, w+20, h2+20);
      }
    }
    if (b.x > x && b.x < x + w) {
      if (b.y > y && b.y < y + h1) {
        fill(255, 0, 0);
        rect (x-50, y+50, w+100, h2-100);
        fill(255, 222, 0);
        rect (x-25, y+25, w+50, h2-50);
        fill(0, 0, 255);
        rect (x-10, y+10, w+20, h2-20);
      }
    }
    if (b.x<0){
      g2= 30;
    }
  }
}