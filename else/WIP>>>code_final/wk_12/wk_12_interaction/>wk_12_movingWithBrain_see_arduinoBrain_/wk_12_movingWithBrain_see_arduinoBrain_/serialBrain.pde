float value0;
int value1;
int value2;
int value3;
int value4;
int value5;
int value6;
int value7;
int value8;
int value9;
int value10;
int value11;

void serialEvent(Serial p) {


  String incomingString = p.readString().trim();
  //print("Received string over serial: ");
  println(incomingString);  

  String[] incomingValues = split(incomingString, ',');


  if (incomingValues.length > 1) {
    packetCount++;


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


    if (packetCount > 5) {

      for (int i = 0; i < incomingValues.length; i++) {
        String stringValue = incomingValues[i].trim();

        int newValue = Integer.parseInt(stringValue);
        value0 = int(incomingValues[0]);
        //value0 = lerp(value0, Float.parseFloat(incomingValues[0]), .5);
        //linear interpolate
        //
        //easing
        
        value1 = int(incomingValues[1]);
        value2 = int(incomingValues[2]);
        value3 = int(incomingValues[3]);
        value4 = int(incomingValues[4]);
        value5 = int(incomingValues[5]);
        value6 = int(incomingValues[6]);
        value7 = int(incomingValues[7]);
        value8 = int(incomingValues[8]);
        value9 = int(incomingValues[9]);
        value10 = int(incomingValues[10]);
        
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