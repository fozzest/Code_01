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


  //Shape

  pos = new PVector(width/2, height/2);
  vel = new PVector(0, 0);
  target = new PVector(0, 0);
  
  //Serial
  for (int i = 0; i < Serial.list().length; i++) {
    println("[" + i + "] " + Serial.list()[i]);
  }
  // connecting with arduino...
  serial = new Serial(this, Serial.list()[3], 9600);

  serial.bufferUntil(10);
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
  target.set(mouseX + value3/1000, mouseY+value3/1000);
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