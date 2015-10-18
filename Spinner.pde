class Spinner {

  //Variables to determine shape dimensions
  int shapeX;
  int shapeY;
  int shapeW;
  int shapeH;
  //Variable to determine which shape is drawn
  float shapeType;
  //Fill color variable
  color shapeCol;
  //Variables to control rotation
  boolean on;
  boolean toggle;
  float theta;
  float speed;

  Spinner (int shpX, int shpY, float shpType, color c) {
    shapeX = shpX;
    shapeY = shpY;
    shapeType = shpType;
    shapeCol = c;
    on = false;
    toggle = false;
    theta = 0;
    speed = 0.1;
  }

  void click(int mx, int my) {
    // Check to see if the mouse is inside a spinner shape
    if ((mx > shapeX - shapeW/2) && (mx < shapeX + shapeW/2) && (my > shapeY - shapeH/2) && (my < shapeY + shapeH/2)) {
      on = !on;
      toggle = true;
    }
  }

  // Increment angle for rotation if shape has been clicked
  void spin() {
    if ((on == true) && (toggle == true)) {
      theta += speed;
    }
  }

  void display() {
    noStroke();
    fill(shapeCol);
    //Choose which kind of shape to draw depending on random variable in parameter
    if (shapeType > 2) {
      shapeW = 35;
      shapeH = 25;
    } 
    else if (shapeType > 1) {
      shapeW = 25;
      shapeH = 35;
    } 
    else {
      shapeW = 55;
      shapeH = 55;
    }
    //Rotation (if turned on) and drawing of rectangle are specified
    pushMatrix();
    translate(shapeX, shapeY);
    rotate(theta);
    if (shapeType > 1) {
      rect (0, 0, shapeW, shapeH);
    } 
    else {
      ellipseMode(CENTER);
      arc (0, -15, shapeW, shapeH, PI/4, 3*PI/4);
    }
    popMatrix();
  }

  void togglespin() {
    on = !on;
  }

  void reset() {
    on = false;
    toggle = false;
    theta = 0;
  }
}

