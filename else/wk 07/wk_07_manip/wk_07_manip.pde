import processing.pdf.*;


PImage img;

void setup() {
  size(950, 950,PDF, "wk07palm.pdf");
  img = loadImage("palms.jpg");
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0,20,0);
  
  int horiz = 10;
  int vert = 10;
  
  for (int i = 0; i < width; i+=horiz) {
    for (int j = 0; j < height; j+=vert) {
      
      
      color c = img.get(i, j);
      float red = red(c);
      float green = green(c);
      float blue = blue(c);
      
      
      
      float brightness = (red+green+blue);
      fill(red,green,blue);
      
      
      
      float s = map(brightness,0,255,0,8);
      //if (s > 10){
      ellipse(i,j,s,s);
      
      //}else{
        //ellipse(i, j, 10-s, 10-s);
     // }
     // }
      //}else{
      //  fill(244,0,0);
      //  rect(i/2, j/2, 2, s);
      //  stroke(map(brightness,0,255,150,255));
      }
    }
    
    println("Finished.");
    exit();
  }