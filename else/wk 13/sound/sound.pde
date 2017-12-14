import processing.serial.*;
import controlP5.*;
import processing.sound.*;


SinOsc[] sineWaves; // Array of sines

float[] sineFreq; // Array of frequencies
float[] sineFreq1; // Array of frequencies

int numSines = 5; // Number of oscillators to use

SinOsc sine1;
Pulse pulse1;


Pulse pulse;
SinOsc sine;


ControlP5 controlP5;
Serial serial;



int packetCount = 0;
int globalMax = 0;
String scaleMode;


String[] incomingValues;



void setup() {
  size(1500, 750, P3D);
  noFill();
  strokeWeight(4);
  smooth();
  
  sineWaves = new SinOsc[numSines]; // Initialize the oscillators
  sineFreq = new float[numSines]; // Initialize array for Frequencies
  
 

  for (int i = 0; i < numSines; i++) {
    // Calculate the amplitude for each oscillator
    float sineVolume = (1.0 / numSines) / (i + 1);
    // Create the oscillators
    sineWaves[i] = new SinOsc(this);
    // Start Oscillators
    sineWaves[i].play();
    // Set the amplitudes for all oscillators
    sineWaves[i].amp(sineVolume);
    
   
  }
  
  //Serial
  for (int i = 0; i < Serial.list().length; i++) {
    println("[" + i + "] " + Serial.list()[i]);
  }
  // connecting with arduino...
  serial = new Serial(this, Serial.list()[3], 9600);

  serial.bufferUntil(10);
  
   // Create and start the sine oscillator.
  pulse = new Pulse(this);
    
  //Start the Pulse Oscillator. 
  sine = new SinOsc(this);
  sine.play();
  pulse.play();
  
  //pulse1 = new Pulse(this);
  //sine1 = new SinOsc(this);
  //sine1.play();
 // pulse1.play();
  
}

void draw() {
  background(#D3F0FF);

  
  
  //float freq=value2*2;
  //float freq2=value3/300;
  //float plswidth=0.5;
  //float plswidth2=3;
  //float amp=0.5;
  //float add=0.0;
  //float pos=1;
  //pulse1.set(freq, plswidth, amp, add, pos);
  //sine1.set(freq2, plswidth2,amp,add);
  
  
   //Map mouseY from 0 to 1
  float yoffset = map(value4/500, 0, height, 0, 4);
  //Map mouseY logarithmically to 150 - 1150 to create a base frequency range
  float frequency = pow(1000, yoffset) ;
  //Use mouseX mapped from -0.5 to 0.5 as a detune argument
  float detune = map(sin(radians(value7/50)), 0, width, -2, 0.5);
  //float detune1 = map(sin(radians(value7/10)), 0, width, -0.5, 0.5);


  for (int i = 0; i < numSines; i++) { 
    sineFreq[i] = frequency * (i + 1 * detune);
    sineWaves[i].freq(sineFreq[i]);
    // Set the frequencies for all oscillators
   
  }
  
  }