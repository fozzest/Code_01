float arrange = 220;
float rot;
float col;
float rate = 0.000005; 
float cont = 0;
float r;
float w;

void setup() {
  size(1000, 600);
  noStroke();
  background(255);
}

void draw() {
  fill(255);
  rect(0,0,width,height);
  translate(500, 300);
  rot=rot+0.00005;
  rotate(radians(rot));

//https://processing.org/reference/ellipseMode_.html
 ellipseMode(RADIUS);
  for (float i=0; i<10; i ++) {
//https://processing.org/examples/milliseconds.html    
    arrange= 220 + 100*sin(millis()*i/10000);
    
    //if (i>10){
    //  i=10;
    //}
    
    r=40;
    
    fill (#468E17);
    rect(arrange*cos(i)-i+ w, arrange*sin(i)-i+w,r,r);  
    
    //represents a higher Beta brain activity
     if (keyPressed) {
    if (key == 'w' || key == 'W') {
      w= random(0,7);
    }
  } else {
    w=0;
  }
    
  }
}