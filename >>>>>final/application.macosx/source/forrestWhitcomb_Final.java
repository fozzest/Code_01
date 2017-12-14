import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class forrestWhitcomb_Final extends PApplet {

//Forrest Whitcomb
//Code01 Final

//see 'data' page for weather data
//see 'serialBrain' for brain info via arduino/mindFlex
//see 'rain' for info on creating the wave effect
//see 'particle' for info on creating the particles




ControlP5 controlP5;
Serial serial;

int packetCount = 0;
int globalMax = 0;
String scaleMode;
Table table;
String[] incomingValues;
float fc;
int currentRow;
PImage imgTitle;

public void setup() {
  
  noFill();
  strokeWeight(4);
  
  fc=0;
  imgTitle = loadImage("rainy.png");

  //Load table info
  table = loadTable("kauai01.csv", "header");
  currentRow = 1;

  //Serial
  for (int i = 0; i < Serial.list().length; i++) {
    //println("[" + i + "] " + Serial.list()[i]);
  }
  // connecting with arduino...
  serial = new Serial(this, Serial.list()[3], 9600);

  serial.bufferUntil(10);
}

String sceneName;

public void draw() {
  if (frameCount< 150) {
    image(imgTitle, 0, 0, width, height);
  }

  fc = fc+1;
  println(fc+" "+sceneName);
  if (fc == 250) {
    fc=0;
    sceneName = getSceneForRow(currentRow);
    currentRow++;
    if (currentRow >= table.getRowCount()) {
      currentRow = 1;
    }
  }

  if (sceneName=="rain") {
    rain();
  }

  if (sceneName=="cloud") {
    cloud();
  }
  if (sceneName=="sun") {
    sun();
  }

  //use keys to qeue sketches manually

  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      rain();
    }
  }

  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      cloud();
    }
  }

  if (keyPressed) {
    if (key == 's' || key == 'S') {
      sun();
    }
  }
}


public void cloud() {
  boom = 60;
  dropAmmount = 20;
  dropAmmount2 = value77/100;
  strokeWeight(map(value55, 0, 20000, 2, 20));
  background(200);
  if (frameCount > 10 &&(frameCount % 5) == 0) {
    float x = random(-canvas, canvas);
    float z = random(-canvas, canvas);
    //behaviour of particles
    PVector acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));


    for (int i = 0; i < 80; i++) {

      particles.add(new Particle(new PVector(x+random(5, dropAmmount), 400+random(5, dropAmmount), z+random(5, dropAmmount)), acc));
    }
  }

  translate(width/2, height/2-200);
  rotateY(radians(45));
  //stroke(255);
  //seeting up array list
  for (int i = 0; i < particles.size (); i++) {
    Particle p = (Particle) particles.get(i);
    p.update();
    //set rain roce                 
    p.force(new PVector(0, 0.5f, 0));

    boom =  value88/30;


    float wave = abs(sin(radians(p.loc.x+frameCount)))*sin(radians(p.loc.z+frameCount*2))*cos(radians(p.loc.y))*boom;

    p.changeVel(wave);

    p.ground(wave);
    if (p.life < 0) {
      particles.remove(p);
    }
  }
   pushMatrix();
    noStroke();
    fill(0xffD9FFD1);
    quad( 0, 100, 250, 350, 0, 400, -175, 300);

    fill(0xff93E582, 100);
    triangle(0, 400, 250, 350, 0, 100);
    fill(0xff329D1B, 100);
    triangle(0, 400, 0, 100, -175, 300);
    popMatrix();

  fill(255);
  //https://processing.org/reference/directionalLight_.html
  //as I looked into more 3D examples and forums, I saw people utilising lights
  //introduced to create a slightly more noticable dimension to the clouds
  directionalLight(255, 255, 255, 0, 500, 0);
  for (int i = 1; i < value44/150; i++) {

    pushMatrix();   
    translate(0, 0, 30);
    rotateX(30);
    rotateY(45);
    translate(i * 10 * tan(frameCount*0.01f*i/10), i * 10 * sin(frameCount*0.02f*i/10)); 
    cloudShape(); 
    popMatrix();
  }
}

//https://processing.org/reference/sphere_.html
public void cloudShape() {
  pushMatrix();   
  translate(0, 0, 0);
  sphere(50);
  popMatrix();
  pushMatrix();   
  translate(-40, 0, 0);
  sphere(30);
  popMatrix();
  pushMatrix();   
  translate(20, 10, 5);
  sphere(40);
  popMatrix();
  pushMatrix();   
  translate(-10, -20, -15);
  sphere(30);
  popMatrix();
}
//initially researched Daniel Shiffman's piece about Data from Procesccing website
//After speaking with Bryan Ma, created a getRow counter in the draw loop that would qeue the code below:
//spoke with Justin, and he recommended I create a String with returns 
//sourcing the rows from the table
//then choosing certain collumns, as was done previously
//by using a String, 

// provides the scene name for the provided row
// "rain" | "cloud" | "sun"
public String getSceneForRow(int row) {
  TableRow currentRow = table.getRow(row);
  float sky = currentRow.getFloat("Sky");
  float prep = currentRow.getFloat("Precipitation");

  if (sky == 1 && prep == 7) {
    return "rain";
  }

  if (sky == 1 && prep == 8) {
    return "cloud";
  }

  if (sky == 0 && prep == 8) {
    return "sun";
  }

  //in case sketch is faulty
  return "rain";
}
//particles are shown in main sketch as rain

class Particle {
  PVector loc; //this will be the location of each particle
  PVector vel; //speed by which the particles move
  PVector acc; //change in speed
  float bounce = -0.2f; //change in 'splash'

  //int expand = 0;
  float life = random(100, 300);

  //particles, when placed, need a position, and a direction/speed
  Particle(PVector loc, PVector acc) {

    //https://processing.org/reference/this.html
    this.loc = loc;
    //PVector loc;
    vel = new PVector();
    this.acc = acc;
    //PVector acc;
  }

  public void update() {
    life--;
    //https://processing.org/examples/primitives3d.html
    stroke(0, 100, 255);
    point(loc.x, loc.y, loc.z); 
    //loc. can be spliced into different ways to use the same LOCATION point for 3 differnt axis
    //however, havent been able to find a way to use this with 3D shapes, like SPHEREs
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  public void changeVel(float wave) {
    //using the equation for the 3D wave produced on main page

    if (loc.y > canvas-wave ) {
      //if the 'height' of the rain is in contact with the wave, make sure it stays within one pixel of wave motion
      acc = new PVector(random(-.1f, .1f), random(-.1f, .1f), random(-.1f, .1f));
    }
  }

  //tutor assisted in finding a way to spring the particles
  public void force(PVector force) {
    //acc.add(PVector(force));
    //cannot divide a PVector by a PVector
    //this caused me many issues, solved with '.div'
    // //https://processing.org/reference/PVector_div_.html
    acc.add(PVector.div(force, 1));
  }

  public void ground(float wave) {
    //idea of this function is to keep every particle within the defined 'box'
    //every location of every particle must be accounted for
    //thus, for ever loc. , the location is reset to exist within the canvas
    //whetehr it is above or below the canvas

    //if the location exceeds the canvas ground
    //velocity is slowed, so as to keep everyhting on the wave plane

    //xaxis
    if (loc.x > canvas) { 
      vel.x = vel.x* bounce ; 
      loc.x = canvas;
    }
    if (loc.x < -canvas) { 
      vel.x = vel.x* bounce; 
      loc.x = -canvas;
    }
    //yaxis

    if (loc.y < -canvas) { 
      vel.y = vel.y *bounce; 
      //the bounce is added to maintain a good distribution over the plane
      loc.y = -canvas;
    }
    if (loc.y > canvas-wave) { 
      vel.y = vel.y *bounce; 
      loc.y = canvas-wave;
    }

    //Zaxis
    if (loc.z < -canvas) { 
      vel.z =  vel.z* bounce ; 
      loc.z = -canvas;
    }
    if (loc.z > canvas) { 
      vel.z =  vel.z * bounce ; 
      loc.z = canvas;
    }
  }
}

PVector pos;
PVector vel;
PVector target;
float speed = 10;
float angle;
float easeRate = 0.03f;
float windX;
float windY;


ArrayList particles = new ArrayList();


float canvas = 300; //sets a 'size' for the array of particels to go

PFont fontData;
float slide = 0.1f;

float boom;
float dropAmmount2;
float dropAmmount;


public void rain() {
  boom = 60;
  dropAmmount = 20 + value2/50;
  //dropAmmount2= value77/100;;
  strokeWeight(map(value55, 0, 20000, 2, 20));
  background(0xffD3F0FF);
  if (frameCount > 10 &&(frameCount % 5) == 0) {

    //setting up rain canvas
    //random points for particles to be produced
    float x = random(-canvas, canvas);
    float z = random(-canvas, canvas);
    //behaviour of particles
    PVector acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));

    for (int i = 0; i < 80; i++) {

      //particles.add(new Particle(new PVector(x+, make it square, z+)));

      //make particles fill a 3D cube, 
      //particles.add(new Particle(new PVector(x+1), -100+1, z+1, acc));

      //adding a random number of particles to create 'splash'

      particles.add(new Particle(new PVector(x+random(5, dropAmmount), -100+random(5, dropAmmount), z+random(5, dropAmmount)), acc));
      if (value99 > value9Old) {
        dropAmmount2 = value99/100;
        particles.add(new Particle(new PVector(x+random(2, dropAmmount2), -100+random(5, dropAmmount2), z+random(5, dropAmmount2)), acc));
      }

      //particles.add(new Particle(new PVector(800+random(2, 10), -100+random(2, 10), z+random(2, 10)), acc));
    }
  }

  translate(width/2, height/2-200);
  rotateY(radians(45));
  //stroke(255);
  //seeting up array list
  for (int i = 0; i < particles.size (); i++) {
    Particle p = (Particle) particles.get(i);
    p.update();
    //set rain roce                 //change with weather
    p.force(new PVector(0, 0.5f, 0));

    boom =  value88/30;

    //https://processing.org/reference/abs_.html
    //use p and x to lock in exact specs                                        //change with weather
    float wave = abs(sin(radians(p.loc.x+frameCount)))*sin(radians(p.loc.z+frameCount*2))*cos(radians(p.loc.y))*boom;
    //float wave = abs(sin(radians(loc.x)*sin(radians(loc.y));
    //float wave = abs(sin(radians(p.loc.x)))*sin(radians(p.loc.z))*cos(radians(p.loc.y))*100;

    p.changeVel(wave);
    //create ground plane referencing curve created above^^^
    p.ground(wave);
    if (p.life < 0) {
      particles.remove(p);
    }
  }
  noStroke();
  fill(0xffD9FFD1);
  quad( 0, 100, 250, 350, 0, 400, -175, 300);
  fill(0xff93E582, 100);
  triangle(0, 400, 250, 350, 0, 100);
  fill(0xff329D1B, 100);
  triangle(0, 400, 0, 100, -175, 300);
}

float value00 = 10;
float value11 = 10;
float value22 = 10;
float value33 = 10000;
float value44 = 10000;
float value55 = 10000;
float value66 = 10000;
float value77 = 10000;
float value88 = 10000;
float value99 = 10000;
float value1010 = 10000;

float value0Old;
float value1Old;
float value2Old;
float value3Old;
float value4Old;
float value5Old;
float value6Old;
float value7Old;
float value8Old;
float value9Old;
float value10Old;

float value0;
float value1;
float value2;
float value3;
float value4;
float value5;
float value6;
float value7;
float value8;
float value9;
float value10;

float percent = 0.0f;
boolean lerping = false;

public void serialEvent(Serial p) {

  String incomingString = p.readString().trim();
  //print("Arduino: ");
  //println(incomingString);  

  String[] incomingValues = split(incomingString, ',');

  if (incomingValues.length > 1) {
    packetCount++;

    //NOTES ABOUT BRAINSERIAL
    //here is where the incoming values are bing parsed out
    //the packet is coming accross from the serial readout via arduino in a single line of CSV data parsed with commas
    //in the brainGrapher example, used as a framework for this project
    //https://github.com/kitschpatrol/BrainGrapher/blob/master/README.markdown
    //the data is presented as channels, I have simplified these below

    //00("Signal Quality");
    //01("Attention");
    //02("Meditation");
    //03("Delta");
    //04("Theta");
    //05("Low Alpha");
    //06("High Alpha");
    //07("Low Beta");
    //08("High Beta");
    //09("Low Gamma");
    //10("High Gamma");

    //by accessing certain parts of the string of data, we can access data that represents specific brain waves
    //

    if (packetCount > 5) {

      for (int i = 0; i < incomingValues.length; i++) {
        String stringValue = incomingValues[i].trim();
        int newValue = Integer.parseInt(stringValue);
      }
      //spoke with graduate student Chris about how to use a boolean to assist with lerping
      if (!lerping) {

        value0Old = PApplet.parseInt(incomingValues[0]);
        value0 = map(value0Old, 0, 500, 0, 200);

        value1Old = PApplet.parseInt(incomingValues[1]);
        value10 =map(value10, 0, 100, 0, 100);

        value2Old = PApplet.parseInt(incomingValues[2]);
        value2 =map(value2Old, 0, 100, 0, 200);

        value3Old = PApplet.parseInt(incomingValues[3]);
        value3 =map(value3Old, 0, 200000, 0, 20000);

        value4Old = PApplet.parseInt(incomingValues[4]);
        value4 = map(value4Old, 0, 200000, 0, 20000);

        value5Old = PApplet.parseInt(incomingValues[5]);
        value5 = map(value5Old, 0, 200000, 0, 20000);

        value6Old = PApplet.parseInt(incomingValues[6]);
        value6 = map(value6Old, 0, 200000, 0, 20000);

        value7Old = PApplet.parseInt(incomingValues[7]);
        value7 = map(value7Old, 0, 200000, 0, 20000);

        value8Old = PApplet.parseInt(incomingValues[8]);
        value8 = map(value8Old, 0, 200000, 0, 20000);

        value9Old = PApplet.parseInt(incomingValues[9]);
        value9 = map(value9Old, 0, 200000, 0, 20000);

        value10Old = PApplet.parseInt(incomingValues[10]);
        value10 = map(value10Old, 0, 200000, 0, 20000);

        lerping = true;
      } else {
        percent += 0.1f;

        value00 = lerp(value00, value0, percent);

        value11 = lerp(value11, value1, percent);

        value22 = lerp(value22, value2, percent);

        value33 = lerp(value33, value3, percent);

        value44 = lerp(value44, value4, percent);

        value55 = lerp(value55, value5, percent);

        value66 = lerp(value66, value6, percent);

        value77 = lerp(value77, value7, percent);

        value88 = lerp(value88, value8, percent);

        value99 = lerp(value99, value9, percent);

        value1010 = lerp(value1010, value10, percent);



        if (percent >= 1) {
          percent = 0.1f;
          lerping = false;
        }
      }

      //println(value88);
    }
  }
}


public void sun() {
  boom = 60;
  dropAmmount = 20;
  strokeWeight(map(value55, 0, 20000, 2, 20));
  background(0xffFFF8AD);
  if (frameCount > 10 &&(frameCount % 5) == 0) {


    //setting up rain canvas
    //random points for particles to be produced
    float x = random(-canvas, canvas);
    float z = random(-canvas, canvas);
    //behaviour of particles
    PVector acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));


    for (int i = 0; i < 80; i++) {

      particles.add(new Particle(new PVector(x+random(5, dropAmmount), 300+random(5, dropAmmount), z+random(5, dropAmmount)), acc));
    }
  }



  translate(width/2, height/2-200);
  rotateY(radians(45));
  //stroke(255);
  //seeting up array list
  for (int i = 0; i < particles.size (); i++) {
    Particle p = (Particle) particles.get(i);
    p.update();
    //set rain roce                
    p.force(new PVector(0, 0.5f, 0));

    boom =  value88/30;

    //https://processing.org/reference/abs_.html
    //change with weather
    float wave = abs(sin(radians(p.loc.x+frameCount)))*sin(radians(p.loc.z+frameCount*2))*cos(radians(p.loc.y))*boom;

    p.changeVel(wave);
    //create ground plane referencing curve created above^^^
    p.ground(wave);
    if (p.life < 0) {
      particles.remove(p);
    }
  }

  noStroke();
  fill(0xffD9FFD1);
  quad( 0, 100, 250, 350, 0, 400, -175, 300);

  fill(0xff93E582, 100);
  triangle(0, 400, 250, 350, 0, 100);
  fill(0xff329D1B, 100);
  triangle(0, 400, 0, 100, -175, 300);
}

  public void settings() {  size(1500, 750, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "forrestWhitcomb_Final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
