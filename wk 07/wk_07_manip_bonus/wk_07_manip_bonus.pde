import processing.pdf.*;

PImage img;
int y = 0;
void setup() {
  size(2000, 950, PDF, "palmbonus");
  img = loadImage("palms.jpg");
  noStroke();
  rectMode(CENTER);
}

void draw() {
  image(img, 0, y);
  background(0,20,0);
  
  int horiz = 10;
  int vert = 10;
  
  for (int i = 0; i < width; i+=horiz) {
    for (int j = 0; j < height; j+=vert) {
      
      
      color c = img.get(j, 1);
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      float brightness = (r+g+b)/2;
      fill(r,g,b);
      
      float s = map(brightness,0,255,0,10);
      //if (s > 10){
      rect(i,j,10,10);
      
      //}else{
        //ellipse(i, j, 10-s, 10-s);
     // }
     // }
      //}else{
      //  fill(244,0,0);
      //  rect(i/2, j/2, 2, s);
      //  stroke(map(brightness,0,255,150,255));
      if( frameRate % 10 == 0 ){
        y = y -10;
    
       
      }
      
      }
    }
    
  println("Finished.");
  exit();
  }