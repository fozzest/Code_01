import processing.serial.*;
import controlP5.*;

int value8;


String incomingString;
String[] incomingValues = split(incomingString, ',');

ControlP5 controlP5;
Serial serial;


int packetCount = 0;
int globalMax = 0;
String scaleMode;
//String incomingString = p.readString().trim();
//String[] incomingValues = split(incomingString, ',');


void setup() {
  size(500, 500);

  //Serial
  for (int i = 0; i < Serial.list().length; i++) {
    println("[" + i + "] " + Serial.list()[i]);
  }
  // connecting with arduino...
  serial = new Serial(this, Serial.list()[3], 9600);

  serial.bufferUntil(10);
}

void draw() {
  background(50);

  //connect brain to mouseX locale

  //println(incomingValues[8]); //low Beta
  //println(incomingValues[9]); // high Beta'

println(value8);
  ellipse(width/2, height/2, 200+ sin(frameCount*0.01)*100+value8/100, 200+ sin(frameCount*0.01)*100*value8/100);
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
        value8 = int(incomingValues[8]);
         //println(value8);
        //println(incomingValues[8]); //low Beta
        //println(incomingValues[9]); // high Beta'


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