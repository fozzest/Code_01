//Forrest Whitcomb
//interactive story
//

ArrayList particles = new ArrayList();


float canvas = 300; //sets a 'size' for the array of particels to go

PFont fontData;
float slide = 0.1;
PImage imgTitle;

PImage hanalei01;
PImage hanalei02;
PImage hanalei03;
PImage hanalei04;
PImage hanalei05;

PImage friendly01;
PImage friendly02;
PImage friendly03;
PImage friendly04;
PImage aerial;

float rise = 5;
void setup() {
  size(1500, 750, P3D);
  noFill();
  strokeWeight(4);
  imgTitle = loadImage("rainy.png");
  hanalei01 = loadImage("hanalei01.png");
  hanalei02 = loadImage("hanalei02.png");
  hanalei03 = loadImage("hanalei03.png");
  hanalei04 = loadImage("hanalei04.png");
  hanalei05 = loadImage("hanalei05.png");
  friendly01 = loadImage("friendly01.png");
  friendly02 = loadImage("friendly02.png");
  friendly03 = loadImage("friendly03.png");
  friendly04 = loadImage("friendly04.png");
  aerial = loadImage("aerial.jpg");

  fontData = createFont("Helvetica", 20);
  loadData();
}

void draw() {
  background(#D3F0FF);


//opening sequence
sequence();
  if (frameCount > 1200) {
  image(hanalei05, 0, 0, width, height);
}

if (frameCount > 1200 &&(frameCount % 5) == 0) {

  
  //setting up rain canvas
  float x = random(-canvas, canvas);
  float z = random(-canvas, canvas);
  //behaviour of particles
  PVector acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));


  for (int i = 0; i < 80; i++) {

    //particles.add(new Particle(new PVector(x+, make it square, z+)));

    //make particles fill a 3D cube

    particles.add(new Particle(new PVector(x+random(2, 10), -100+random(2, 10), z+random(2, 10)), acc));
    //particles.add(new Particle(new PVector(800+random(2, 10), -100+random(2, 10), z+random(2, 10)), acc));
  }

}
if (keyPressed) {

  fill(#FFEB52);
  noStroke();
  triangle( 1200, 500, 1200 + rise, 200, 1200-rise, 200);
  if (keyPressed == true) {
  rise= rise+1;
  }else{
    rise=10;
  }
  println(rise);
}


translate(1200, height/2-200);
rotateY(radians(45));
//stroke(255);
//seeting up array list
for (int i = 0; i < particles.size (); i++) {
  Particle p = (Particle) particles.get(i);
  p.update();
  //set rain roce                 //change with weather
  p.force(new PVector(0, 0.5, 0));

  //https://processing.org/reference/abs_.html
  //use p and x to lock in exact specs                                        //change with weather
  float wave = abs(sin(radians(p.loc.x+frameCount)))*sin(radians(p.loc.z+frameCount*2))*cos(radians(p.loc.y))*50;

  //float wave = abs(sin(radians(p.loc.x)))*sin(radians(p.loc.z))*cos(radians(p.loc.y))*100;

  p.changeVel(wave);
  //create ground plane referencing curve created above^^^
  p.ground(wave);
  if (p.life < 0) {
    particles.remove(p);
  }
}
}


void sequence(){
  if (frameCount >0 && frameCount<150) {
  titlepage();
}

if (frameCount >150 && frameCount<300) {
  fill(255, 80);
  rect(0, 0, width, height);
  image(hanalei01, 0, 0, width, height); 
  textFont(fontData);
  fill(0, 100, 255);
  text("Twas the day that Hanalei", 300, height/2+30);
}
if (frameCount >300 && frameCount<600) {
  fill(255, 80);
  rect(0, 0, width, height);
  image(hanalei02, 0, 0, width, height); 
  textFont(fontData);
  fill(0, 100, 255);
  text("left the nest with rain on the way ", 300, height/2+30);
}
if (frameCount >600 && frameCount<900) {

  //raining (width/2, 0);
  //raining (width, -300);
  //raining(300, -400);
  // raining(1500, -800);
  // raining(2000, -700);
  // raining(1000, -600);

  image(hanalei03, 0, 0, width, height);
}
if (frameCount >900 && frameCount<1200) {
  fill(255, 80);
  rect(0, 0, width, height);
  image(imgTitle, 0, 0, width, height);
  //textFont(fontData);
  //fill(0);
  //text("The Raniest Place in the World", 50,height/2);
}
if (frameCount > 1200 && frameCount < 1400) {
  image(friendly01, 0, 0, width, height);
}

if (frameCount > 1400 && frameCount < 1600) {
  image(friendly02, 0, 0, width, height);
}

if (frameCount > 1600 && frameCount < 1800) {
  image(friendly03, 0, 0, width, height);
}

if (frameCount > 1800 && frameCount < 2100) {
  image(friendly04, 0, 0, width, height);
}

}

void titlepage(){
  noStroke();
  image(aerial, 0, 0, width, height);
  int horiz = 10;
  int vert = 10;
  
  for (int i = 0; i < width; i+=horiz) {
    for (int j = 0; j < height; j+=vert) {
      color c = aerial.get(i, j);
      float red = red(c);
      float green = green(c);
      float blue = blue(c);
      float brightness = (red+green+blue);
      fill(red,green,blue);
      float s = map(brightness,0,255,0,8);
      //if (s > 10){
      ellipse(i,j,s,s);
      }
    }
  }
  
  
  
  //void raindrop( float rX, float rY, int big, int co, float slo) {

//  fill(0, 100 + co, 255);
//  ellipse (rX - slide, rY + slide, big, big);
//  slide=slide+slo;
//}

//void raining(float dropX, float dropY) {
//  noStroke();
//  raindrop( 500, -20, 30, 100, 1);
//  raindrop( 1000, -30, 50, 100, .4);
//  raindrop( 1200, -20, 30, 150, .9);

//  raindrop( 300, -50, 50, 200, 1);
//  raindrop( 1100, -30, 50, 60, .3);
//  raindrop( 1300, -80, 30, 150, .1);

//  raindrop( 400, -10, 20, 110, 2);
//  raindrop( 900, -30, 40, 160, .8);
//  raindrop( 800, -30, 40, 90, .5);
//}