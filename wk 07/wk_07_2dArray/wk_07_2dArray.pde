int NUM = 8;
PImage[] sprite = new PImage[NUM];
int spriteNum = 0;
boolean rising = true;

void setup(){
  size(500,500);
  imageMode(CENTER);
  for (int i = 0; i < sprite.length; i++) {
    sprite[i] = loadImage("sprite0"+i+".png");
    //had a lot of trouble working with this syntax, used example to 
    //work through the kinks
  }
}

void draw(){
  background(255);
  image(sprite[spriteNum], width/2, height/2);
   
  if (frameCount % 6 == 0) {
    spriteNum++;
    
    //if (spriteNum ==3){
    //  fill(200,200,255);
    //  rect(100,100,10,10);
    
    }
    //from the example, this modulo is a way of queing a spriteNum increase
    //this occurs every 6 frames, or every time the frameCount is divisible by 6
    //a smart way to create equal incraments of growth
    
    if (spriteNum >= sprite.length) {
    spriteNum = 0;
    }
  
    if (frameCount >= 48) {
     boolean rising = true;
     image(sprite[spriteNum], 100,100);
    }
    
    if (frameCount >= 96) {
     boolean rising = true;
     image(sprite[spriteNum],400,400);
    }
    
    
    if (frameCount >= 144) {
     boolean rising = true;
     image(sprite[spriteNum],400,100);
    }
    
    if (frameCount >= 192) {
     boolean rising = true;
     image(sprite[spriteNum],100,400);
    }
      
    if (frameCount == 240){
      frameCount = 0;
      boolean rising = false;
    }
    
    
  }