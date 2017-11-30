void shapeColor() {
  // Set up the temperature range in Fahrenheit
  int minTemp = 0;
  int maxTemp = 100;

  
  float temperatureColor = map(temperature, minTemp, maxTemp, 0, 255);    

  // Set background color using temperature on a blue to red scale     
  c=(color(temperatureColor, 0, 255-temperatureColor));
}

void drawShape(float _pos, float _vel) {
  
  pos = new PVector(width/2, height/2);
  vel = new PVector(0, 0);
  target = new PVector(0, 0);
  shapeColor();
  
  

  
  
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
  shapeColor();
  fill(c);
  triangle(100, 300, windX, windY, 200, 400);
  fill(c);
  triangle(windX, windY, 300, 300, 200, 400);
  fill(c);
  triangle(100, 300, windX, windY, 200, 200);
  fill(c);
  triangle(300, 300, windX, windY, 200, 200);

}
