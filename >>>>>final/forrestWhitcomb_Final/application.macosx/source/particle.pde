//particles are shown in main sketch as rain

class Particle {
  PVector loc; //this will be the location of each particle
  PVector vel; //speed by which the particles move
  PVector acc; //change in speed
  float bounce = -0.2; //change in 'splash'

  //int expand = 0;
  float life = random(100, 300);

  //particles, when placed, need a position, and a direction/speed
  Particle(PVector loc, PVector acc) {

    //https://processing.org/reference/this.html
    this.loc = loc;
    //PVector loc;
    vel = new PVector();
    this.acc = acc;
    //PVector acc;
  }

  void update() {
    life--;
    //https://processing.org/examples/primitives3d.html
    stroke(0, 100, 255);
    point(loc.x, loc.y, loc.z); 
    //loc. can be spliced into different ways to use the same LOCATION point for 3 differnt axis
    //however, havent been able to find a way to use this with 3D shapes, like SPHEREs
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void changeVel(float wave) {
    //using the equation for the 3D wave produced on main page

    if (loc.y > canvas-wave ) {
      //if the 'height' of the rain is in contact with the wave, make sure it stays within one pixel of wave motion
      acc = new PVector(random(-.1, .1), random(-.1, .1), random(-.1, .1));
    }
  }

  //tutor assisted in finding a way to spring the particles
  void force(PVector force) {
    //acc.add(PVector(force));
    //cannot divide a PVector by a PVector
    //this caused me many issues, solved with '.div'
    // //https://processing.org/reference/PVector_div_.html
    acc.add(PVector.div(force, 1));
  }

  void ground(float wave) {
    //idea of this function is to keep every particle
    //within the defined 'box'

    //every location of every particle must be accounted for

    //thus, for ever loc. , the location is reset to exist within the canvas
    //whetehr it is above or below the canvas

    //if the location exceeds the canvas ground
    //velocity is slowed, so as to keep everyhting on the wave plane

    //xaxis
    if (loc.x > canvas) { 
      vel.x = vel.x* bounce ; 
      loc.x = canvas;
    }
    if (loc.x < -canvas) { 
      vel.x = vel.x* bounce; 
      loc.x = -canvas;
    }

    //if (loc.x > canvas) { 
    //  vel. = vel; 
    //  loc.x = canvas;
    //}

    //yaxis

    if (loc.y < -canvas) { 
      vel.y = vel.y *bounce; 
      //the bounce is added to maintain a good distribution over the plane
      loc.y = -canvas;
    }
    if (loc.y > canvas-wave) { 
      vel.y = vel.y *bounce; 
      loc.y = canvas-wave;
    }


    //Zaxis


    if (loc.z < -canvas) { 
      vel.z =  vel.z* bounce ; 
      loc.z = -canvas;
    }
    if (loc.z > canvas) { 
      vel.z =  vel.z * bounce ; 
      loc.z = canvas;
    }
  }
}