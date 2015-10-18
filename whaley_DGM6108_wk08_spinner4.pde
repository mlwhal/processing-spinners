//Marika Whaley, DGM 6108, Week 8 Homework, 2 June 2012

//This sketch draws a pattern of two types of rectangles and a wedge shape 
//that spin when clicked.
//Pressing the ENTER key stops all spinning; SPACE resets to starting state.
//Using an object class makes it easy to change the kind of shapes that are drawn.
//Storing the objects in an array simplifies the code.

//Variables for objects' coordinates
int x = 25;
int y = 25;
//Variable to control spacing of objects
int spacing = 50;
//Variable for array items
int i = 0;

//Declare array of objects that will be drawn
Spinner[] spinners = new Spinner[100];

void setup() {
  size(500, 500);
  smooth();
  colorMode (HSB, 360, 100, 100);    //Allows for a range of fill color selection
  rectMode(CENTER);

  //Creation of objects with coordinates, shape type, and color parameters in a grid pattern
  for (y = 25; y < height; y += spacing) {
    for (x = 25; x < width; x += spacing) {
      spinners[i] = new Spinner(x, y, random(0, 3), color (random(46, 95), random(54, 96), 99));
      i++;
    }
  }
}

void draw() {
  //Background is called in draw method to refresh screen as objects spin
  background(236, 69, 85);
  //Background line pattern is drawn
  for (int lineX = 25; lineX < width; lineX += spacing) {
    strokeWeight(2);
    stroke(0);
    line (lineX, 0, lineX, height);
  }

  //Object methods are called to spin and to display
  for (int i = 0; i < spinners.length; i++) {
    spinners[i].spin();
    spinners[i].display();
  }
}

//mousePressed method starts rotation when mouse is clicked inside an object
void mousePressed() {
  for (int i = 0; i < spinners.length; i++) {
    spinners[i].click(mouseX, mouseY);
  }
}

//keyPressed method resets to starting state
void keyPressed() {
  if ((key == ENTER) || (key == RETURN)) {
    for (int i = 0; i < spinners.length; i++) {
      spinners[i].togglespin();
    }
  }
  if (key == ' ') {
    for (int i = 0; i < spinners.length; i++) {
      spinners[i].reset();
    }
  }
}

