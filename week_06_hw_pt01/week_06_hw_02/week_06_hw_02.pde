
//create a 'walking shape' that changes colour and size as the mouse 
//moves around the canvas
//


//update for week 6
//linked the initial walker to arrays

//made a new array that was more linked to randomness



int walk1 = 100;

float x[] = new float[walk1];
float y[] = new float[walk1];
float x2[] = new float[walk1];
float y2[] = new float[walk1];
int[] xR = { 0 , 980 };
int[] yR = { 0 , 480 };

//float xR[]  = new float[walk1];
//float yR[] = new float[walk1];
float w[] = new float[walk1];
float h[] = new float[walk1];
float dx[] = new float[walk1];
float dy[] = new float[walk1]; //movement

float[] rSize = {10, 20, 30, 40, 50};


int coB = 150;
int coR = 200;

 int line = 100;
int xL[] = new int[line];
int yL[] = new int[line];



void setup() {
  size(1000, 500);
  background(0);
  rectMode(CENTER);

  noStroke();

  for (int i = 0; i < walk1; i++) {
    x[i] = 500;
    y[i] = 250;
    //xR[i] = random(0,980);
    //yR[i] = random(0,480);
    //x2[i] = xR;
    //y2[i] = yR;
    w[i] = 50;
    h[i] = 50;
    
    

    
    //dx[i] = random(-4, 4); //using example code as a reference, introducing more randomness
    //dy[i] = random(-4, 4);
  }
}

void draw() {
  // float h = map(mouseY, 0, height, 1, 10);
  for (int i = xL.length-1; i > 0; i--) {
          xL[i] = xL[i-1];
          yL[i] = yL[i-1];
}
 xL[0] = mouseX; // 
     yL[0] = mouseY; // 
     for (int i = 0; i < x.length; i++) {
          stroke(i * 4, 255, 255);
          line(xL[i], yL[i], 500, 250);
     }

noStroke();
  for (int i = 0; i < walk1; i++) {
    w[i] = map(mouseX, 0, width, 1, 100);
    h[i] = map(mouseY, 0, height, 1, 100);
    
    fill(255);

    
    //map opacity
    rect(xR[1], yR[1], 20,20);
    //float opa = map(width, 0, 1000, 0, 255); //unable to map fade to x-axis
    float opa = map(w[i], 0, 255, 10, 1000);
    fill (coR, 200, coB, opa);


    ellipse(x[i], y[i], w[i], h[i]);
    

    if (x[i] < mouseX) {
      x[i] += 2;
      rect(xR[1], yR[1], 20,20);
      
    } else {
      x[i] -= 2;
      rect(xR[1], yR[0], 20,20);
    }
    if (y[i] < mouseY) {
      y[i] += 2;
    } else {
      y[i] -= 2;
      //rect(xR[1], yR[1], 20,20);
      //rect(xR[0], yR[0], 20,20);
    }

    if (y[i] < mouseY) { 
      //fill(coR, 255, coB);
      coR = coR + 1;
    } else {
      //fill(coR, 255, coB);
      coR = coR - 1;
    }

    if (y[i] < mouseX) { // instead of trying to complete the entire fill, I found that by
      // limiting it to one int, I could have more cusomisation over the colours
      // previously, colour would be overwriting itself from other functions
      // or only work if mouseX & mouseY were both + or -
      //fill(coR, 255, coB);
      coB = coB + 1;
    } else {
      //fill(coR, 255, coB);
      coB = coB - 1;
    }
  }
}