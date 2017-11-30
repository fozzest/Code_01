//testing differetn ways of gathering data
//via https://processing.org/tutorials/data/


// The data from the Table object will fill the array of Bubble objects



Table table;
Bubble[] bubbles;

void setup() {
  size(480, 360);
  loadData();
}

void draw() {
  background(255);
  // Display all bubbles
  for (int i = 0; i<bubbles.length; i++) {
    bubbles[i].display();
  }
}

void loadData() {
  // "header" indicates the file has header row. The size of the array 
  // is then determined by the number of rows in the table. 
  table = loadTable("Lihue.csv", "header");
  bubbles = new Bubble[table.getRowCount()];


  for (int i = 0; i<table.getRowCount(); i++) {
    // Iterate over all the rows in a table.
    TableRow row = table.getRow(i);

  
    // Access the fields via their column name (or index).
    float time = row.getFloat("Time");
    float temp = row.getFloat("Temp.");
    float vis = row.getFloat("Visibility");
    float wD = row.getFloat("Wind Dir");
    float wS = row.getFloat("Wind Speed");
    float percip = row.getFloat("Percip");
    float cloud = row.getFloat("Cloud");
    // Make a Bubble object out of the data from each row.
    bubbles[i] = new Bubble(temp, wS, 40, 40);
  }
}


void mousePressed() {
  // When the mouse is pressed, create a new row and set the values for each column of that row.
  TableRow row = table.addRow();
  row.setFloat("x", mouseX);
  row.setFloat("y", mouseY);
  row.setFloat("diameter", random(40, 80));
  row.setString("name", "Blah");

  // If the table has more than 10 rows, delete the oldest row.
  if (table.getRowCount()>22) {
    table.getRow(0);
  }

  // This writes the table back to the original CSV file
  // and reloads the file so that what's drawn matches.
  saveTable(table, "Lihue/Lihue.csv");
  loadData();
}

// This simple Bubble class draws a circle to the window 
// and displays a text label when the mouse hovers.
class Bubble {
  float x, y;
  float diameter;
  String name;
  
  boolean over = false;
  
  // Create the Bubble
  Bubble(float tempX, float tempY, float tempD, String s) {
    x = tempX;
    y = tempY;
    diameter = tempD;
    name = s;
  }
  
  // Checking if mouse is over the bubble
  void rollover(float px, float py) {
    float d = dist(px, py, x, y);
    if (d<diameter/2) {
      over = true; 
    } else {
      over = false;
    }
  }
  
  // Display the Bubble
  void display() {
    stroke(0);
    strokeWeight(2);
    noFill();
    ellipse(x, y, diameter, diameter);
    if (over) {
      fill(0);
      textAlign(CENTER);
      text(name, x, y+diameter/2+20);
    }
  }
}