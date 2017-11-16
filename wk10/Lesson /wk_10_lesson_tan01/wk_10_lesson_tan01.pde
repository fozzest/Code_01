void setup(){

  size (600,600);
}

void draw(){
   background(255);
   translate (width/2, height/2);
   rotate(atan2(mouseY-height/2,mouseX-width/2));
   triangle (0,20,50,0,0,-20);
   
   
   //print(atan2(height/2-mouseY,width/2-mouseX));
  
}