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

Shape[] s = new Shape[11];


TembooSession session = new TembooSession("fozzest", "myFirstApp", "BwBPvlwbZ7s93ENdXo4ViuOfc2ncaQ5S");

 
String[] location;
int currentLocation = 0;
float anglee;
// https://processing.org/reference/createFont_.html
PFont  fontLocation;


//https://www.yahoo.com/news/weather/


int visibility;
int temperature;


XML weatherResults;

void setup() {
  size(1000, 500);
  // https://processing.org/reference/createFont_.html
  fontLocation = createFont("Helvetica", 45);
  fill(255,80); 
  for (int i = 0; i < s.length; i++) {
    s[i] = new Shape(0, 0) ;
    //anglee=(cos(angle) * magnitude, sin(angle) * magnitude);
  }

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
  getXML(); // 
  //shapeColor(); 
  //displayText(); 
  
}

void draw() {
  fill(255,80);
  rect(0,0,width,height);
  
  //runGetWeatherByAddressChoreo(); 
  //getXML(); 
    
  for (int i = 0; i < s.length; i++) {
    s[i].displayText();
    s[i].display();
    currentLocation++;
  }

    
    if (currentLocation > location.length-1 ) {
      currentLocation = 0;
    }

    
    //shapeColor(); 
    //displayText(); 
    
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
  //working through the presented data types, locate the desired data
  // Get current temp
  temperature = condition.getInt("temp");
  println("The current temperature in "+location[currentLocation]+" is "+temperature+"ºF");
   
  // Get current visibility
  XML condition2 = weatherResults.getChild("channel/item/yweather:condition");
  
   visibility = condition2.getInt("vis");
  println("The current visibility in "+location[currentLocation]+" is "+visibility+"Miles");
  
}