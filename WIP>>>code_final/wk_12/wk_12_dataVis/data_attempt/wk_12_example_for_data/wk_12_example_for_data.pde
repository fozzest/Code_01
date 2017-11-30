
//shorter example of simple colour changes
//colour shifts due to temp
//it is ideas like these that I wish to, but am currently struggling to input into my project

//https://processing.org/tutorials/data/
//used Shiffman's processing data tutorials to try diufferent ways of addressing data

//linked to temboo as a away of gathering and parsing data

//https://temboo.com/library/Library/Yahoo/Weather/GetWeatherByAddress/
//https://temboo.com/library/Library/Yahoo/Weather/GetWeather/

import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;


TembooSession session = new TembooSession("fozzest", "myFirstApp", "BwBPvlwbZ7s93ENdXo4ViuOfc2ncaQ5S");

 
String[] location;
int currentLocation = 0;
float col;

PFont fontTemperature, fontLocation, fontInstructions;


String instructions = "Press any key to change cities";

// Set up some global values
int temperature;
XML weatherResults;

void setup() {
  size(1000, 500);

  // Set up fonts
  fontTemperature = createFont("Helvetica", 200);
  fontLocation = createFont("Helvetica", 100);
  
  fill(255); 

  location = new String[11]; 
  location[0] = "New York";
  location[1] = "Los Angeles";
  location[2] = "Tokyo";
  location[3] = "Sydney";
  location[4] = "Singapore";
  location[5] = "Vancouver";
  location[6] = "Mumbai";
  location[7] = "Honolulu";
  location[8] = "Oslo";
  location[9] = "San Francisco";
  location[10] = "Cape Town";

  
  runGetWeatherByAddressChoreo();
  getTemperatureFromXML(); 
  displayColor(); 
   
}

void draw() {
  if (keyPressed) {
    
    currentLocation++;

    
    if (currentLocation > location.length-1 ) {
      currentLocation = 0;
    }

    runGetWeatherByAddressChoreo(); 
    getTemperatureFromXML(); 
    fill(255);
    //fill(col);
    //ellipse(100,height/2, 50,50);
    displayColor(); 
  int textpos = width/2-100;
  
 // https://processing.org/reference/createFont_.html
  textFont(fontTemperature);
  text(temperature  +   "  F", textpos, 200);

  textFont(fontLocation);
  text(location[currentLocation] , textpos, 300);
  }
  
}

void runGetWeatherByAddressChoreo() {
 
  GetWeatherByAddress getWeatherByAddressChoreo = new GetWeatherByAddress(session);
  
  getWeatherByAddressChoreo.setAddress(location[currentLocation]);

  GetWeatherByAddressResultSet getWeatherByAddressResults = getWeatherByAddressChoreo.run();

  weatherResults = parseXML(getWeatherByAddressResults.getResponse());
}

void getTemperatureFromXML() {
  //https://processing.org/examples/getchild.html
  
  XML condition = weatherResults.getChild("channel/item/yweather:condition");
//working through the presented data types, locate the desired data
  
  temperature = condition.getInt("temp");

  
  println("The current temperature in "+location[currentLocation]+" is "+temperature+"ºF");
}

void displayColor() {
 
  int minTemp = 0;
  int maxTemp = 100;

  
  float temperatureColor = map(temperature, minTemp, maxTemp, 0, 255);    

   
  background(color(temperatureColor, 0, 255-temperatureColor));
}