//easing motion

float xPos, yPos;

float targetX, targetY;


void setup(){
  size(700,700);
  noStroke();
}

void draw(){
  targetX = mouseX;
  targetY = mouseY;
  background (255);
  fill(#98F6FF);
  ellipse (xPos, yPos, 80,80);
  
  xPos+= (targetX-xPos)*0.1;
  yPos+= (targetY-yPos)*0.1;
  

  
}