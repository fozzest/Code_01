
float rate;
float xC;

void cloud() {
  boom = 60;
  dropAmmount = 20;
  dropAmmount2 = value77/100;
  strokeWeight(map(value55, 0, 20000, 2, 20));
  background(200);
  if (frameCount > 10 &&(frameCount % 5) == 0) {


    //setting up rain canvas
    //random points for particles to be produced
    float x = random(-canvas, canvas);
    float z = random(-canvas, canvas);
    //behaviour of particles
    PVector acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));


    for (int i = 0; i < 80; i++) {


      particles.add(new Particle(new PVector(x+random(5, dropAmmount), 400+random(5, dropAmmount), z+random(5, dropAmmount)), acc));

    }
  }

  translate(width/2, height/2-200);
  rotateY(radians(45));
  //stroke(255);
  //seeting up array list
  for (int i = 0; i < particles.size (); i++) {
    Particle p = (Particle) particles.get(i);
    p.update();
    //set rain roce                 //change with weather
    p.force(new PVector(0, 0.5, 0));

    boom =  value88/30;

                                                                                                                  //change with brain
    float wave = abs(sin(radians(p.loc.x+frameCount)))*sin(radians(p.loc.z+frameCount*2))*cos(radians(p.loc.y))*boom;

    p.changeVel(wave);

    p.ground(wave);
    if (p.life < 0) {
      particles.remove(p);
    }
    noStroke();
    fill(#D9FFD1);
    quad( 0, 100, 250, 350, 0, 400, -175, 300);

    fill(#93E582, 100);
    triangle(0, 400, 250, 350, 0, 100);
    fill(#329D1B, 100);
    triangle(0, 400, 0, 100, -175, 300);
  }

  fill(255);
  directionalLight(255, 255, 255, 0, 500, 0);
  for (int i = 1; i < mouseX/10; i++) {

    pushMatrix();   
    translate(0, 0, 30);
    rotateX(30);
    rotateY(45);
    translate(i * 10 * tan(frameCount*0.01*i/10), i * 10 * sin(frameCount*0.02*i/10)); 
    


    //cloudShape(); 

    popMatrix();
  }
}