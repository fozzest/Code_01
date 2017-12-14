//Forrest Whitcomb
//Code01 Final


//see 'data' page for weather data
//see 'serialBrain' for brain info via arduino/mindFlex
//see 'rain' for info on creating the wave effect
//see 'particle' for info on creating the particles

import processing.serial.*;
import controlP5.*;


ControlP5 controlP5;
Serial serial;


int packetCount = 0;
int globalMax = 0;
String scaleMode;
Table table;

String[] incomingValues;

float fc;

int currentRow;
PFont text;

void setup() {
  size(1500, 750, P3D);
  noFill();
  strokeWeight(4);
  smooth();
  fc=0;
  //https://processing.org/reference/createFont_.html
  //though I did not end up using Temboo as a way of organising APIs, they offerred insights into other ways of
  //understanding data, amongst other Processing functions, such as creating fonts
  text = createFont("Helvetica", 30);

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


void draw() {
  if (frameCount< 150) {
    fill(#092798);
    textFont(text);
    text("Forrest Whitcomb: The Island", width/2-200, height/2);
  }

  fc = fc+1;
  println(fc+" "+sceneName);
  if (fc == 300) {
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