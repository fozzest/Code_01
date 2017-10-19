

//update for wk 06
//implentation of arrays

int num = 200;
float n = 5;

int ball = 50;

float x[] = new float[ball];
float y[] = new float[ball];
float r[] = new float[ball];
color c[] = new color[ball];


float[] xpos = new float[num];
float[] ypos = new float[num];

boolean switchState = false;
float size = 300;
float g = 1000;
float sz2 = 0;
void setup() {
  size (1500, 750);
  background( 223, 255, 144);
  noStroke();
  smooth(); //examples online use this. it is used to makes shapes have anti-aliasing

  for (int i = 0; i < ball; i++) {
    r[1] = 10;
    x[i] = 1000;
    y[i] = 400;
    //fill(c[i] = color(random(100), random(255), random(100)));
  }

}

void draw() {
  background( 223, 255, 144);

  if (switchState) {
    
    for ( int i = 0; i< num - 1 ; i++){
    xpos[i]= xpos[i+1];
    ypos[i]= ypos[i+1]; //
    
  }
  //lenght of array changes, new position of shape appears
  xpos[xpos.length-1] =  1000 - n;
  ypos[ypos.length-1] = 400;
  
  if (n<1000){
    n = n + 4;
  }
     
  for(int i = 0; i<num; i++){
    noStroke();
    fill((70-i*2),(200-i),(22-i)); 
    //same array being applied to colour of shape
    //as array changes, it is simultaneously altering colour
    
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
    //below is the original solution to the expanding rings
  
    
    size++;
    //sz2= sz2 + 4;
    //fill(0, 255, 0);
    //ellipse (1000, 400, sz2, sz2);
    //fill(169, 219, 46);
    //ellipse (1000, 400, sz2-10, sz2 -10);
    //fill(0, 255, 0);
    //ellipse (1000, 400, sz2-50, sz2-50);
    //fill(38, 54, 11);
    //ellipse (1000, 400, sz2-90, sz2 -90);
    //if (sz2>size) {
    //  sz2 = 0;

//      if (size>600) {
//        size=0;

// now, here is a solution using arrays

 for (int i = 0; i < ball; i++) {
    fill(c[i] = color(random(100), random(255), random(100)));
    ellipse(x[i], y[i], r[i]*2, r[i]*2);
    if (r[i] < 300){
      r[i] = r[i] +5;
    }else{
      
       r[i]= 0;

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