
//testing a sketch for wind
//in the final product, windX and windY will be deterimed from data

float windX;
float windY;

void setup() {
  size(700, 600);
}

void draw() {
  background(255);
  float windX = mouseX;
  float windY = mouseY;
  println(mouseX, mouseY);
  //println(mouseY);
  //triangle(x1, y1, x2, y2, x3, y3)
  stroke(255);
  strokeWeight(2.5);



  //triangle(100,300, 300,300, 200,400);
  //triangle(200,300, 300,300, 200,400);
  //triangle(100,300, 300,300,200,200);
  //triangle(200,300, 300,300,200,200);
  fill(#1D2914);
  triangle(100, 300, windX, windY, 200, 400);
  fill(#2A5012);
  triangle(windX, windY, 300, 300, 200, 400);
  fill(#468E17);
  triangle(100, 300, windX, windY, 200, 200);
  fill(#53AF17);
  triangle(300, 300, windX, windY, 200, 200);

  textSize(20);
  fill(#205AA0);
  text("Wind Direction:", 350, 310);


  //east
  if (windX> 200 && mouseY< 320 && mouseY > 280) {
    textSize(20);
    fill(#205AA0);
    text("East", 500, 310);
  }

  //west
  if (windX< 200 && mouseY< 320 && mouseY > 280) {
    textSize(20);
    fill(#205AA0);
    text("West", 500, 310);
  }

  //north
  if (windY< 300 && mouseX> 180 && mouseX < 220) {
    textSize(20);
    fill(#205AA0);
    text("North", 500, 310);
  }

  //south
  if (windY> 300 && windX> 180 && windX < 220) {
    textSize(20);
    fill(#205AA0);
    text("South", 500, 310);
  }

  //north west
  if (windY< 280 && mouseX< 180 ) {
    textSize(20);
    fill(#205AA0);
    text("North West", 500, 310);
  }

  //north East
  if (windY< 280 &&  mouseX > 220) {
    textSize(20);
    fill(#205AA0);
    text("North East", 500, 310);
  }

  //south west
  if (windY> 320 && windX< 220) {
    textSize(20);
    fill(#205AA0);
    text("South West", 500, 310);
  }

  //south east
  if (windY> 320 &&  windX > 220) {
    textSize(20);
    fill(#205AA0);
    text("South East", 500, 310);
  }


  //fill (255,0,0);
  //ellipse(200,300, 20,20);
}