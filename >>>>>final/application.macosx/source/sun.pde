

void sun() {
  boom = 60;
  dropAmmount = 20;
  dropAmmount2 = value77/50;
  strokeWeight(map(value55, 0, 20000, 2, 20));
  background(#FFF8AD);
  if (frameCount > 10 &&(frameCount % 5) == 0) {


    //setting up rain canvas
    //random points for particles to be produced
    float x = random(-canvas, canvas);
    float z = random(-canvas, canvas);
    //behaviour of particles
    PVector acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));


    for (int i = 0; i < 80; i++) {

      //adding a random number of particles to create 'splash'

      //dropAmmount = dropAmmount + value2/5;

      particles.add(new Particle(new PVector(x+random(5, dropAmmount), 300+random(5, dropAmmount), z+random(5, dropAmmount)), acc));
    }
  }



  translate(width/2, height/2-200);
  rotateY(radians(45));
  //stroke(255);
  //seeting up array list
  for (int i = 0; i < particles.size (); i++) {
    Particle p = (Particle) particles.get(i);
    p.update();
    //set rain roce                
    p.force(new PVector(0, 0.5, 0));

    boom =  value88/30;

    //https://processing.org/reference/abs_.html
    //change with weather
    float wave = abs(sin(radians(p.loc.x+frameCount)))*sin(radians(p.loc.z+frameCount*2))*cos(radians(p.loc.y))*boom;

    p.changeVel(wave);
    //create ground plane referencing curve created above^^^
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
}