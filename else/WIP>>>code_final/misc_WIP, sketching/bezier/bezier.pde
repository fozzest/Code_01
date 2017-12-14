void setup() {
  size(700, 600);
}


void draw(){

  background(100,100,50);
  
//beginShape(TRIANGLE_FAN);
//vertex(57.5, 50);
//vertex(57.5, 15); 
//vertex(92, 50); 
//vertex(57.5, 85); 
//vertex(22, 50); 
//vertex(57.5, 15); 
//endShape();

//noFill();

//beginShape();
//vertex(30, 20);
//bezierVertex(80, 0, 80, 75, 30, 75);
//bezierVertex(50, 80, 60, 25, 30, 20);
//endShape();

//noFill();
//stroke(255, 102, 0);
//line(85, 20, 10, 10);
//line(90, 90, 15, 80);
//stroke(0, 0, 0);
//bezier(85, 20, 10, 10, 90, 90, 15, 80);

//bezier (fist X anchor, first Y anchor, 10, 10, 90, 90, second X anchor, second Y anchor);


beginShape(TRIANGLE_FAN);
vertex(57.5, 50);
vertex(57.5, 15); 
vertex(92, 50); 
vertex(57.5, 85); 
vertex(22, 50); 
bezier(57.5, 15, 10, 10, 70, 70, 22, 50);
endShape();

//bezier (fist X anchor, first Y anchor, 10, 10, 90, 90, second X anchor, second Y anchor);

}