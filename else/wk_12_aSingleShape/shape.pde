

void setup() {
  size(1000,600);
  background(250);
  pos = new PVector(width/2, height/2);
  vel = new PVector(0, 0);
  target = new PVector(0, 0);
  
}

void draw() {
  fill(250, 80);
  
  //parameters are currently set to ceter or object +/- humidity
  float windX = 200;
  float windY = 300;
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
  target.set(mouseX, mouseY);
  float angle = atan2(target.y - pos.y, target.x - pos.x);
  
  speed = pos.dist(target) * easeRate;
  
  vel.x = cos(angle) * speed;
  vel.y = sin(angle) * speed;
  
  pos.add(vel);
  translate(pos.x, pos.y);
  //rotate(angle);
  fill(220);
  fill(#1D2914);
  triangle(100, 300, windX, windY, 200, 400);
  fill(#2A5012);
  triangle(windX, windY, 300, 300, 200, 400);
  fill(#468E17);
  triangle(100, 300, windX, windY, 200, 200);
  fill(#53AF17);
  triangle(300, 300, windX, windY, 200, 200);

}