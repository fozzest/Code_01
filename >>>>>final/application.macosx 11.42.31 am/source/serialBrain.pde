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

float percent = 0.0;
boolean lerping = false;

void serialEvent(Serial p) {

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

        value0Old = int(incomingValues[0]);
        value0 = map(value0Old, 0, 500, 0, 200);

        value1Old = int(incomingValues[1]);
        value10 =map(value10, 0, 100, 0, 100);

        value2Old = int(incomingValues[2]);
        value2 =map(value2Old, 0, 100, 0, 200);

        value3Old = int(incomingValues[3]);
        value3 =map(value3Old, 0, 200000, 0, 20000);

        value4Old = int(incomingValues[4]);
        value4 = map(value4Old, 0, 200000, 0, 20000);

        value5Old = int(incomingValues[5]);
        value5 = map(value5Old, 0, 200000, 0, 20000);

        value6Old = int(incomingValues[6]);
        value6 = map(value6Old, 0, 200000, 0, 20000);

        value7Old = int(incomingValues[7]);
        value7 = map(value7Old, 0, 200000, 0, 20000);

        value8Old = int(incomingValues[8]);
        value8 = map(value8Old, 0, 200000, 0, 20000);

        value9Old = int(incomingValues[9]);
        value9 = map(value9Old, 0, 200000, 0, 20000);

        value10Old = int(incomingValues[10]);
        value10 = map(value10Old, 0, 200000, 0, 20000);

        lerping = true;
      } else {
        percent += 0.1;

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
          percent = 0.1;
          lerping = false;
        }
      }

      //println(value88);
    }
  }
}