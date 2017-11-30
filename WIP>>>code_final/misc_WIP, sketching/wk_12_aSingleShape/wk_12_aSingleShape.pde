import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;


TembooSession session = new TembooSession("fozzest", "myFirstApp", "BwBPvlwbZ7s93ENdXo4ViuOfc2ncaQ5S");

//Delare location array 
String[] location;
int currentLocation = 0;

// https://processing.org/reference/createFont_.html
PFont  fontLocation;
int ShapeCentre;

//https://www.yahoo.com/news/weather/
PVector pos;
PVector vel;
PVector target;
float speed = 10;
float angle;
float easeRate = 0.03;
float windX;
float windY;
float c;


int visibility;
int temperature;

XML weatherResults;

void setup() {
  size(1000, 1000);
  // https://processing.org/reference/createFont_.html
  fontLocation = createFont("Helvetica", 36);
  fill(255); 

  location = new String[1]; // Total number of locations listed below
  
  location[0] = "Sydney";
  
  
  
  
  
  // gather data
  runGetWeatherByAddressChoreo(); 
  getXML(); // 
  //shapeColor(); 
  //displayText(); 
  
}

void draw() {
  fill(255,80);
  shapeColor();
  drawShape(-100,-500);
  
 

    runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
    getXML(); 
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

  // Get current temp
  temperature = condition.getInt("temp");
  println("The current temperature in "+location[currentLocation]+" is "+temperature+"ºF");
   
  // Get current visibility
   visibility = condition.getInt("visibility");
  println("The current visibility in "+location[currentLocation]+" is "+visibility+"Miles");
  
}



void displayText() {
  // Set up text margins
  int ShapeCentre = 35;


  


  // Display location with text
  textFont(fontLocation);
  text(location[currentLocation], ShapeCentre, ShapeCentre);
  
}