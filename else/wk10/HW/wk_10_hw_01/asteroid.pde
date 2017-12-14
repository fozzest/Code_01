class Asteroid {   
float x;
float y;
float xAngle;
float yAngle;
float xAmplitude;
float yAmplitude;
float xRate;
float yRate;
PImage img2;

Asteroid(float x, float y) {
 
  xAngle = 0;
  yAngle = 0;
  xAmplitude = 100;
  yAmplitude = 100;
  xRate = 0.02;
  yRate = 0.02;
  

}

void display() {
  
  img2 = loadImage("ast.png");
  image(img2, x, y,50,50);
  
}

void update(){
  xAngle += xRate;
  yAngle += yRate;
  x = width/2 + sin(xAngle) * xAmplitude*6;
  y = height/2 + cos(yAngle) * yAmplitude*2;
}

  
}