class Shape {
  PVector pos;
  PVector vel;
  PVector target;
  float speed = 10;
  float angle;
  float easeRate = 0.03;
  float windX;
  float windY;
  float c;

  //constructor takes an x, y, and color value
  Shape(float _pos, float _vel) {
    pos = new PVector(width/2, height/2);
    vel = new PVector(250, 250);
    target = new PVector(250, 250);
  }



  // call this method to display the ball
  void display() {
    int minTemp = 0;
    int maxTemp = 100;
     getXML();
    float temperatureColor = map(temperature, minTemp, maxTemp, 0, 255);    

     c=(color(temperatureColor, 0, 255-temperatureColor));

    
    float windX = 200;
    float windY = 300;
    noStroke();
    rectMode(CORNER);
    pos.add(vel);
    translate(pos.x, pos.y);
    //rotate(angle);
    fill(c);
    triangle(100, 300, windX, windY, 200, 400);
    fill(c);
    triangle(windX, windY, 300, 300, 200, 400);
    fill(c);
    triangle(100, 300, windX, windY, 200, 200);
    fill(c);
    triangle(300, 300, windX, windY, 200, 200);

    target.set(mouseX, mouseY);
    float angle = atan2(target.y - pos.y, target.x - pos.x);



    speed = pos.dist(target) * easeRate;

    vel.x = cos(angle) * speed;
    vel.y = sin(angle) * speed;
  }




  void displayText() {
    // Set up text margins
    int shapeCentre = 250;

    // Display location with text
    textFont(fontLocation);
    text(location[currentLocation], shapeCentre, shapeCentre);
  }
}