PVector pos;
PVector vel;
PVector target;
float speed = 10;
float angle;
float easeRate = 0.03;
float windX;
float windY;


ArrayList particles = new ArrayList();


float canvas = 300; //sets a 'size' for the array of particels to go

PFont fontData;
float slide = 0.1;

float boom;
float dropAmmount2;
float dropAmmount;


void rain() {
  boom = 60;
  dropAmmount = 20;
  //dropAmmount2= value77/100;;
  strokeWeight(map(value55, 0, 20000, 2, 20));
  background(#D3F0FF);
  if (frameCount > 10 &&(frameCount % 5) == 0) {


    //setting up rain canvas
    //random points for particles to be produced
    float x = random(-canvas, canvas);
    float z = random(-canvas, canvas);
    //behaviour of particles
    PVector acc = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));


    for (int i = 0; i < 80; i++) {

      //particles.add(new Particle(new PVector(x+, make it square, z+)));

      //make particles fill a 3D cube, 
      // particles.add(new Particle(new PVector(x+1), -100+1, z+1, acc));

      //adding a random number of particles to create 'splash'

      //dropAmmount = dropAmmount + value2/5;

      particles.add(new Particle(new PVector(x+random(5, dropAmmount), -100+random(5, dropAmmount), z+random(5, dropAmmount)), acc));
      if (value99 > value9Old) {
        dropAmmount2 = value99/100;
        particles.add(new Particle(new PVector(x+random(2, dropAmmount2), -100+random(5, dropAmmount2), z+random(5, dropAmmount2)), acc));
      }

      //particles.add(new Particle(new PVector(800+random(2, 10), -100+random(2, 10), z+random(2, 10)), acc));
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

    //https://processing.org/reference/abs_.html
    //use p and x to lock in exact specs                                        //change with weather
    float wave = abs(sin(radians(p.loc.x+frameCount)))*sin(radians(p.loc.z+frameCount*2))*cos(radians(p.loc.y))*boom;
    //float wave = abs(sin(radians(loc.x)*sin(radians(loc.y));
    //float wave = abs(sin(radians(p.loc.x)))*sin(radians(p.loc.z))*cos(radians(p.loc.y))*100;


    //println(value8);
    //println(value3);
    //if (keyPressed == true) {
    ////println(value8);
    ////boom = boom + value8/100;
    //boom = boom+1;
    //}else{
    //  boom=50;
    //}



    p.changeVel(wave);
    //create ground plane referencing curve created above^^^
    p.ground(wave);
    if (p.life < 0) {
      particles.remove(p);
    }
  }
  noStroke();
  fill(#D9FFD1);
  quad( 0, 100, 250, 350, 0, 400, -175, 300);

  fill(#93E582, 100);
  triangle(0, 400, 250, 350, 0, 100);
  fill(#329D1B, 100);
  triangle(0, 400, 0, 100, -175, 300);
}