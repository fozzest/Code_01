/**
 * Flocking 
 * by Daniel Shiffman.  
 * 
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on 
 * rules of avoidance, alignment, and coherence.
 * 
 * Click the mouse to add a new boid.
 */

Flock flock;
float r=1;
void setup() {
  size(1200, 800);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 150; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
}

void draw() {
  //background(50);
  fill(0,0,0,20);
  rect(0,0,width,height);
  flock.run();
  //textSize(50 +r);
  //if (r>=1){
  //  r++;
  //}
  //fill(255);
  //text("yay", width/2-100,height/2+25);
  
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY));
  flock.addBoid(new Boid(mouseX,mouseY));
  flock.addBoid(new Boid(mouseX,mouseY));
  flock.addBoid(new Boid(mouseX,mouseY));
  flock.addBoid(new Boid(mouseX,mouseY));
}