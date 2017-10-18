
//create a canvas(1000, 500)
//white background (255)
//create command (int) to move objects
//make a setting sun (ellipse) that is controlled by mouseY
//make a rectangle representing sky
//make a rectangle representing water
//make a set of clouds using ellipses that travel to the left
//make a boat that travels to the right
//make a bird that travels along a rotating caqnvas (???)
//make an island

//create a function to move objects at a certain pace
int move;
float cloudPieceX = 40;
float cloudPieceY = 40;
float cloudPositionX = 240 ;
float cloudPositionY = 100;
//float fullCloud = (cloudPostionX, cloudPositionY +125-move/5, cloudPieceX, cloudPieceY);
//float fullCloud did not work...
//float cloudMove = -move*3;
//this command froze the cloud...
//aborted making 'cloudMove'


//float cloudPiece = (240+125-move/5, 100, 40, 40);
//this command did not work
// I tried multiple ways to 
void setup() //the world setup
{
  size(1000, 500);
  background(255);
  move = 1;
  //signifies the distance moved. this is one(1) pixel 
}


void draw() //contents
{ 
  move = move + 1;

  //Sky
  fill(60 + mouseY/2, 180 - mouseY, 210 - mouseY);
  rect(0, 0, 1000, 250);
  //colour starts at a range that is blue, and then kept so it only becomes red then dark

  //nighttime
  // fill(0, 0, 0, mouseY-100);
  //rect(0, 0, 1000, 1000);
  //this should be placed below everything, as I actually want the entire screen to be dark.

  //Sun
  noStroke();
  fill(255, 255 - mouseY/2, 0);
  ellipse (500, mouseY, 350, 350);
  //https://forum.processing.org/two/discussion/8492/how-to-make-an-object-change-color-when-the-mouse-is-inside
  //used this link to figure out how to contain colour and change along mouseY

  //nighttime
  fill(0, 0, 0, mouseY-100);
  rect(0, 0, 1000, 1000);

  // I wasn't able to see the other objects I had created until I placed these following commands here.
  // From what I gathereed, they have to remain above (thus below in code) from the background

  Water();
  
  buildBoat(100 + move*2, 240, 150 + move*2 , 240, 90 + move*2, 160, 255);
  //revised this to create more boats using functions
  //fill(c);
  //triangle (x1, y1, x2, y2, x3, y3);
  buildBoat(100 + move*2, 240, 150 + move*2 , 240, 90 + move*2, 160, 255);
  
  Cloud();
  
  Island();
  
  //Bird ():
}


void Water()
{
  fill(0, 50, 160);
  rect(0, 250, 1000, 250);
}

void buildBoat(float x1, float y1, float x2, float y2, float x3, float y3, int c)
{
  fill(c);
  triangle (x1, y1, x2, y2, x3, y3);
  //triangle(100 + move*2, 240, 150 + move*2 , 240, 90 + move*2, 160);
  
}


void Cloud()
{
  fill(255);

  //ellipse (cloudPiece);
  ellipse(cloudPositionX+ -move, cloudPositionY, cloudPieceX, cloudPieceY);
  ellipse(cloudPositionX+90 + -move, cloudPositionY - 10, cloudPieceX + 20, cloudPieceY + 20);
  ellipse(cloudPositionX+40+ -move, cloudPositionY - 20, cloudPieceX *2, cloudPieceY *2);
  //fullCloud;

  //use negatives to move objects to the left
  //looked up ways to move objects accross screen at same rate
}

void Island ()
{
  fill (150, 250, 120);
  triangle (900, 300, 1250, 300, 1000, 100);
  fill (150, 250, 120);
  ellipse (1000, 307, 200, 100);
}