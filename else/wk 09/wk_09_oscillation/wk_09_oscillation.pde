float x[] = new float[100];
//float amplitude;   //wave amplitude
//float rate;
//float diameter;
//float radius = diameter/2;
//int w;
//float g;

//void setup() {
//  size(1000, 500);
//  noStroke();
//  amplitude = 200;
//  fill(255);
//  rect(0, 0, width, height);
//  frameRate(10);
//}

//void draw() {
//  fill(255, 10);
//  rect(0, 0, width, height);
//  fill(random(255, 200), 0, 0);
//  diameter = random(1, 4);
//  translate(0, height/2);
//  for (int i = 0; i < x.length; i++) {
//    //x[i] = x+1;
//    //for (float x = radius; x <= width-radius; x += diameter*1.5) {
//    float angle = -x[i]*0.01; 
//    //x[i] =x++;
//    w= 100;
//    w= w-1;
//    float yPos = amplitude*sin(rate + angle);
//    float xPos = map(i, 0, x.length, 100, width-w);
//    //float yPos = map(i,0,amplitude*sin(rate + angle), 100, height-100);
//    ellipse(xPos, yPos, diameter, diameter);
//  }
//  rate = rate+0.1;
//}



////another option


float top;
int he =0;

void setup() {
  size(1000, 500);
}

void draw() {
  background(255, 0, 0);

  stroke(255); 
  for (int i=0; i<200; i+=1) {
    //https://processing.org/reference/sin_.html
    float w = width/200;
    top = 200*sin(i);
    //link sin to the height of lines
    //uses sin to in some ways map the tops of the lines
    line(i*w+10, 0, i*w, height/2+top);
    line(i*w, height, i*w+10, height/2-top); 
    //distribute the liens along the y azis using 'w'
    //by cutting the lines by their height, it creates an equal distribution on either end of the y axis
  }
  //he++;
}