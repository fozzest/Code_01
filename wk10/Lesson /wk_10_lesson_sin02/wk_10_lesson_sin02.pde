void setup(){
 background(255);
  size (600,600);
}

void draw(){
  float r = random(0,TWO_PI);
  line(width/2, height/2,width/2+ cos(r)*200, height/2+ sin(r)*200);
}