Table table;
//NewData [] newData;

void loadData() {
  Table table = loadTable("kauai.csv", "header");
  //newData = new NewData[table.getRowCount()];
  
  float val2 = table.getFloat(3, 2);
  println(val2);


  //for (int i = 0; i<table.getRowCount(); i++) {

  //  // Access each row of the table one at a time, in a loop.
  //  TableRow row = table.getRow(i);
    
  //  String wind = row.getString("Wind");
  //  float vis = row.getFloat("Vis(mi.)");
  //  String sky = row.getString("Sky");
  //  float temp = row.getFloat("Temp");
  //  float humidity = row.getFloat("Humidity");
  //  float pressure = row.getFloat("Pressure");
  //  String precip = row.getString("Precipitation");
    ////newData[i] = new NewData(wind, vis, sky, temp,humidity,pressure,precip);
  }
//}
//