float value00;
float value11;
float value22;
float value33;
float value44;
float value55;
float value66;
float value77;
float value88;
float value99;
float value1010;


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
        value00 = int(incomingValues[0]);
        value0 = lerp(value00, Float.parseFloat(incomingValues[0]), .1);
        
       
        
        
        value11 = int(incomingValues[1]);
        value1 = lerp(value11, Float.parseFloat(incomingValues[1]), .1);
        
        value22 = int(incomingValues[2]);
        value2 = lerp(value22, Float.parseFloat(incomingValues[2]), .1);
        
        value33 = int(incomingValues[3]);
        value3 = lerp(value33, Float.parseFloat(incomingValues[3]), .1);
        
        value44 = int(incomingValues[4]);
        value4 = lerp(value44, Float.parseFloat(incomingValues[4]), .1);
        
        value55 = int(incomingValues[5]);
        value5 = lerp(value55, Float.parseFloat(incomingValues[5]), .1);
        
        value66 = int(incomingValues[6]);
        value6 = lerp(value66, Float.parseFloat(incomingValues[6]), .1);
        
        value77 = int(incomingValues[7]);
        value7 = lerp(value77, Float.parseFloat(incomingValues[7]), .1);
        
        value88 = int(incomingValues[8]);
        value8 = lerp(value88, Float.parseFloat(incomingValues[8]), .1);
         
         //if ( value8 > value88+3000){
         // value8 = value8;
        //}
        
        
        value99 = int(incomingValues[9]);
        value9 = lerp(value99, Float.parseFloat(incomingValues[9]), .1);
        
        value1010 = int(incomingValues[10]);
        value10 = lerp(value1010, Float.parseFloat(incomingValues[10]), .1);

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