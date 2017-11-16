//goal is to have a planet with a ring of moving material
//asteroid pushes through material, altering material's course


ArrayList<Particle> particles = new ArrayList<Particle>();
//int asteroid = 5;
//float Asteroid[] = new float[asteroid];
//ArrayList<Asteroid> asteroid = new ArrayList<asteroid>();
Asteroid a;

PImage img;
void setup() {
  size(1000, 500);
  background(50);
  a= new Asteroid(width/2,height/2-50);
  
}

void draw() {
  //background (0);
  fill(0,0,0,50);
  rect(0,0,width,height);
  img = loadImage("moon.png");
  //resize(100, 100);
  image(img, width/2-200, height/2-200,400,400);
  //Asteroid.add(new Asteroid());
  a.update();
  a.display();
    
    //Asteroid a = Asteroid();
    
   
  
  
  //particles.add(new Particle(width/2, height));
  //particles.add(new Particle(width/2, 0));
  //particles.add(new Particle(0, 0));
  //particles.add(new Particle(0, height));
  //particles.add(new Particle(0, height/2));
  //particles.add(new Particle(width, height/2));
  //particles.add(new Particle(width, height));
  //particles.add(new Particle(width, 0));
  particles.add(new Particle(width/2, height/2));
  pushMatrix();
  translate(0,0);
  //float ro = 0;
  //translate(0,0);
  rotate(PI);
  particles.add(new Particle(width/2, height/2));
  
  //ro += 1;
  
  popMatrix();
  
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    //p.addAttract(width, height, 10);
    p.addAttract(0, 0,8);
    //if(p.pos.x> 501){
    //  p.addAttract(width*2, 0,10);
    //}
    // if(p.pos.x< 499){
    //  p.addAttract(-width/10, height,10);
    //}
    //if(p.pos.y>501){
    //  p.addAttract(width/2, height,10);
    //}
      
    //p.addAttract(width, height,10);
    //p.addAttract(width/2, height/2,10);
    //p.contact(0,0,20);
    p.update();
    p.display();
    
    
    if (p.life < 0) {
      particles.remove(i);
    }
  }
}