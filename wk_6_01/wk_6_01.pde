

//update for wk 06
//implentation of arrays

int num = 80;

float[] xpos = new float[num];
float[] ypos = new float[num];

float size = 300;
float g = 1000;
float sz2 = 0;
void setup() {
  size (1500, 750);
  background( 223, 255, 144);
  noStroke();
  smooth(); //examples online use this. it is used to makes shapes have anti-aliasing
}

void draw() {
  background( 223, 255, 144);
  //if (g <= 1000  ){
  //  g--;
  //}

  


  if (switchState) {
    
    for ( int i = 0; i< num ; i++){
    xpos[i]= xpos[i+1];
    ypos[i]= ypos[i+1];
  }
  xpos[xpos.length-1] = g - 1;
  ypos[ypos.length-1] = 500;
    //draw everything 
  for(int i = 0; i<xpos.length; i++){
    noStroke();
    fill((70-i*3),(108-i*2),(22-i*1));
    ellipse(xpos[i],ypos[i],i,i);
  }
  }


  fill(223, 255, 144);
  ellipse (990, 400, 300, 300);
  if (switchState) {
    fill(38, 54, 11);
  } else {
    fill(169, 219, 46);
  }
  ellipse(1000, 400, size, size);

  if (mousePressed) {
    size++;
    sz2= sz2 + 4;
    fill(0, 255, 0);
    ellipse (1000, 400, sz2, sz2);
    fill(169, 219, 46);
    ellipse (1000, 400, sz2-10, sz2 -10);
    fill(0, 255, 0);
    ellipse (1000, 400, sz2-50, sz2-50);
    fill(38, 54, 11);
    ellipse (1000, 400, sz2-90, sz2 -90);
    if (sz2>size) {
      sz2 = 0;

      if (size>600) {
        size=0;
      }
    }
  }
}


//void drawCircle(float x, float y) {

//  fill(223, 255, 144); // appearance of thicker circle
//  ellipse (x -10, y, 300, 300);

//  fill(169, 219, 46);

//  ellipse (g, y, 300, 300);
//}

void mousePressed() {
  if (mouseX< 1500 && mouseX> 100 ) {
    switchState = !switchState;
  }
}