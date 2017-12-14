//code used from https://www.openprocessing.org/sketch/427417

//augmented to attempt to show aesthetic of wind on diagram
//work in progress
//eventually, wind speed will come from data, rather than mouseX

float rate=0;

void setup() {
  size(1000, 800);
  smooth();
}

void draw() {
  
  println(mouseX, mouseY);
  
  pushMatrix();
  translate(width/2-800,height/2-50);
  rotate(150);
  rate+=.20;
  background(255);
  stroke(#4EBC19);
  strokeWeight(3);
  translate(width/2, height/2);
  noFill();
  float r=200;
  for (float i=-0.5;i<PI;i+=0.01) {
    beginShape();
    for (float j=-sin(i)*r;j<sin(i)*r+sin(i);j+=sin(i)*20) {
      curveVertex(j, map(cos(i)*r-sin(rate-(j/40))*abs(i*10), 0,200,-10,-mouseX));
    }
    endShape();
    
  }
  popMatrix();
  
  
  strokeWeight(4);
  stroke(255);
  
  fill(#1D2914);
  triangle(mouseX,mouseY, 300,500,50,250);
  fill(#2A5012);
  triangle(mouseX,mouseY, 550,250,300,0);
  fill(#53AF17);
  triangle(mouseX,mouseY, 50,250,300,0);
  noStroke();
  fill(#4EBC19);
  triangle(mouseX,mouseY,550,250, 300,500);
  fill(255);
  triangle(width,0,300,0, 550,250);
  triangle(50,250,300,0, -100,-0);
  triangle(0,height,300,500, 50,250);
  
  textSize(20);
  fill(0, 100, 150);
  text("Wind Speed:", 50, 750);  

}