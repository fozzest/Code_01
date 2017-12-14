float angle;
PImage pg;
float incr = 4;
void setup() {
  size (1000,600);
  angle =0;
  pg= get(0,0,600,600);
}

void draw() {
  image (pg,1,0);
  angle += incr;
  float result = sin(radians(angle))+ sin(radians(angle+angle/5));
  
  float y = map(result, -1, 1, height/2 -100, height/2 +100);
  ellipse (0, y,20,20);
  pg = get(0,0,1000,600);
  
  
  
}