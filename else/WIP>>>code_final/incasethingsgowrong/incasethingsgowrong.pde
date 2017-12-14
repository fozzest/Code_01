//https://processing.org/tutorials/data/
//used Shiffman's processing data tutorials to try diufferent ways of addressing data

//linked to temboo as a away of gathering and parsing data

//https://temboo.com/library/Library/Yahoo/Weather/GetWeatherByAddress/

//for the time being, using yahoo weather, as it works with the tmboo library
//SUBJECT TO CHANGE IF TEMBOO CANNOT LOOP THROUGH DATA OVER TIME
   //currently struggling to find ways to show the data CHANGING
    
    
//libraries found on Processing library search

import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;


TembooSession session = new TembooSession("fozzest", "myFirstApp", "BwBPvlwbZ7s93ENdXo4ViuOfc2ncaQ5S");

//Delare location array 
String[] location;
int currentLocation = 0;

// https://processing.org/reference/createFont_.html
PFont  fontLocation;


//https://www.yahoo.com/news/weather/


int visibility;
int temperature;

XML weatherResults;

void setup() {
  size(1000, 500);
  // https://processing.org/reference/createFont_.html
  fontLocation = createFont("Helvetica", 36);
  fill(255); 

  location = new String[11]; // Total number of locations listed below
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
  
  
  
  
  // gather data
  runGetWeatherByAddressChoreo(); 
  getXML(); // 
  //shapeColor(); 
  //displayText(); 
  
}

void draw() {
  fill(255,80);
  
  if (keyPressed) {
    // Switch to next location
    currentLocation++;

    // If you've reached the end of the list, go back to the start
    if (currentLocation > location.length-1 ) {
      currentLocation = 0;
    }

    runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
    getXML(); 
    //shapeColor(); 
    //displayText(); 
    
  }
}

//https://temboo.com/library/Library/Yahoo/Weather/
void runGetWeatherByAddressChoreo() {
  
  GetWeatherByAddress getWeatherByAddressChoreo = new GetWeatherByAddress(session);

  getWeatherByAddressChoreo.setAddress(location[currentLocation]);

  GetWeatherByAddressResultSet getWeatherByAddressResults = getWeatherByAddressChoreo.run();

  weatherResults = parseXML(getWeatherByAddressResults.getResponse());
}



void getXML() {
  
  XML condition = weatherResults.getChild("channel/item/yweather:condition");

  // Get current temp
  temperature = condition.getInt("temp");
  println("The current temperature in "+location[currentLocation]+" is "+temperature+"ºF");
   
  // Get current visibility
   visibility = condition.getInt("visibility");
  println("The current visibility in "+location[currentLocation]+" is "+visibility+"Miles");
  
}

void shapeColor() {
  // Set up the temperature range in Fahrenheit
  int minTemp = 0;
  int maxTemp = 100;

  
  float temperatureColor = map(temperature, minTemp, maxTemp, 0, 255);    

  // Set background color using temperature on a blue to red scale     
  background(color(temperatureColor, 0, 255-temperatureColor));
}

void displayText() {
  // Set up text margins
  int ShapeCentre = 35;


  


  // Display location with text
  textFont(fontLocation);
  text(location[currentLocation], ShapeCentre, ShapeCentre);
  
}