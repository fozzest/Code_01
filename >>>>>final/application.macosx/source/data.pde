//initially researched Daniel Shiffman's piece about Data from Procesccing website
//After speaking with Bryan Ma, created a getRow counter in the draw loop that would qeue the code below:
//spoke with Justin, and he recommended I create a String with returns 
//sourcing the rows from the table
//then choosing certain collumns, as was done previously
//by using a String, 

// provides the scene name for the provided row
// "rain" | "cloud" | "sun"
String getSceneForRow(int row) {
  TableRow currentRow = table.getRow(row);
  float sky = currentRow.getFloat("Sky");
  float prep = currentRow.getFloat("Precipitation");

  if (sky == 1 && prep == 7) {
    return "rain";
  }

  if (sky == 1 && prep == 8) {
    return "cloud";
  }

  if (sky == 0 && prep == 8) {
    return "sun";
  }

  //in case sketch is faulty
  return "rain";
}