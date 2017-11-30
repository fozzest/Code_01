//exemplifying how the brain can interact with objects on a screen
//eventually, I hope to create a relationship between this data and the weather data from the seperate sketch
//the interaction between the two effects of data will be based off of certain brain activities

//currently, particularly at bottom of code, referencing https://github.com/kitschpatrol/BrainGrapher/blob/master/README.markdown

import processing.serial.*;
import controlP5.*;


ControlP5 controlP5;
Serial serial;


int packetCount = 0;
int globalMax = 0;
String scaleMode;


String[] incomingValues;

PVector pos;
PVector vel;
PVector target;
float speed = 10;
float angle;
float easeRate = 0.03;
float windX;
float windY;

void setup() {
  size(1000, 600);
  background(250);
  smooth();


  //Serial
  for (int i = 0; i < Serial.list().length; i++) {
    println("[" + i + "] " + Serial.list()[i]);
  }

  // connecting with arduino...
  serial = new Serial(this, Serial.list()[3], 9600);

  serial.bufferUntil(10);



  //Shape

  pos = new PVector(width/2, height/2);
  vel = new PVector(0, 0);
  target = new PVector(0, 0);
}

void draw() {
  fill(250, 80);
  
  //the data for the center cross of the object
  float windX = 200;
  float windY = 300;
  
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  //control this with part of brain [8] and [9]
  target.set(mouseX, mouseY);
  //println(incomingValues[8]); //low Beta
  //println(incomingValues[9]); // high Beta
  
  float angle = atan2(target.y - pos.y, target.x - pos.x);

  speed = pos.dist(target) * easeRate;

  vel.x = cos(angle) * speed;
  vel.y = sin(angle) * speed;

  pos.add(vel);
  translate(pos.x, pos.y);
  fill(#1D2914);
  triangle(100, 300, windX, windY, 200, 400);
  fill(#2A5012);
  triangle(windX, windY, 300, 300, 200, 400);
  fill(#468E17);
  triangle(100, 300, windX, windY, 200, 200);
  fill(#53AF17);
  triangle(300, 300, windX, windY, 200, 200);
  
  
  
   
}

void serialEvent(Serial p) {


  String incomingString = p.readString().trim();
  print("Received string over serial: ");
  println(incomingString);  

  String[] incomingValues = split(incomingString, ',');


  if (incomingValues.length > 1) {
    packetCount++;


    //here is where the incoming values are bing parsed out
    //the packet is coming accross from the serial readout via arduino in a single line of CSV data parsed with commas
    //in the brainGrapher example, used as a framework for this project
    //https://github.com/kitschpatrol/BrainGrapher/blob/master/README.markdown
    //the data is presented as channels, I have simplified these below
    
    //channels[0] = new Channel("Signal Quality");
    //channels[1] = new Channel("Attention");
    //channels[2] = new Channel("Meditation");
    //channels[3] = new Channel("Delta");
    //channels[4] = new Channel("Theta");
    //channels[5] = new Channel("Low Alpha");
    //channels[6] = new Channel("High Alpha");
    //channels[7] = new Channel("Low Beta");
    //channels[8] = new Channel("High Beta");
    //channels[9] = new Channel("Low Gamma");
    //channels[10] = new Channel("High Gamma");
    
    //by accessing certain parts of the string of data, we can access data that represents specific brain waves


    if (packetCount > 5) {

      for (int i = 0; i < incomingValues.length; i++) {
        String stringValue = incomingValues[i].trim();

        int newValue = Integer.parseInt(stringValue);
        println(incomingValues[8]); //low Beta
        println(incomingValues[9]); // high Beta'
        
        
        if ((Integer.parseInt(incomingValues[0]) == 200) && (i > 2)) {
          newValue = 0;
        }
      }
    }
  }
}

//currenly leaning heavily on BrainGrapher example, and trying to figure out what this code below does
//second set keeps data within limits, but first longMap is still confusing


// Extend Processing's built-in map() function to support the Long datatype
long mapLong(long x, long in_min, long in_max, long out_min, long out_max) { 
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

// Extend Processing's built-in constrain() function to support the Long datatype
long constrainLong(long value, long min_value, long max_value) {
  if (value > max_value) return max_value;
  if (value < min_value) return min_value;
  return value;
}