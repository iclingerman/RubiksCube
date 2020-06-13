import java.util.LinkedList;
import java.util.Arrays;

LinkedList<Character> sequence;

Cube cube;
CubeAlgorithms CA;
PVector pos;
int size;
int cubeSize;
boolean locked; //whether or not the cube free rotation is locked

int solveStep;


//variables for the animation of the cube rotation
boolean rotatingRight;
float rotationDegree;
boolean rotateAnimation;
char animationDirection;
double rotationSpeed;

void setup() {
  size(800, 750, P3D);
  size = 100;
  cubeSize = size*3;
  pos = new PVector(width/2, height/2, 0);
  cube = new Cube(pos, cubeSize);
  CA = new CubeAlgorithms();
  locked = true;
  rotatingRight = false;
  rotationDegree = 0;
  rotateAnimation = false;
  animationDirection = '-';
  rotationSpeed = radians(20);
  strokeWeight(7);
  sequence = new LinkedList<Character>();
  randomizeCube(50);
  println(sequence);

  solveStep = 0;
}

void draw() {
  clear();
  background(255);
  drawInfo();
  drawKey();
  pushMatrix();
  translate(pos.x, pos.y, pos.z);

  if (!locked) {
    rotateX(-radians(mouseY));
    rotateY(radians(mouseX));
  } else {
    rotateX(-radians(30));
    rotateY(-radians(38));
  }
  switch(animationDirection) {
  case 'r':
    if (rotationDegree < PI/2) {
      cube.rotateCubeRight(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      //cube.turnRight('r');
      cube.turn('r');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'R':
    if (rotationDegree > -PI/2) {
      cube.rotateCubeRight(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      //cube.turnRight('R');
      cube.turn('R');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'l':
    if (rotationDegree > -PI/2) {
      cube.rotateCubeLeft(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      //cube.turnLeft('l');
      cube.turn('l');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'L':
    if (rotationDegree < PI/2) {
      cube.rotateCubeLeft(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      //cube.turnLeft('L');
      cube.turn('L');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'u':
    if (rotationDegree > -PI/2) {
      cube.rotateCubeUp(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      //cube.turnTop('u');
      cube.turn('u');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'U':
    if (rotationDegree < PI/2) {
      cube.rotateCubeUp(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      //cube.turnTop('U');
      cube.turn('U');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'd':
    if (rotationDegree < PI/2) {
      cube.rotateCubeDown(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      //cube.turnBottom('d');
      cube.turn('d');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'D':
    if (rotationDegree > -PI/2) {
      cube.rotateCubeDown(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      //cube.turnBottom('D');
      cube.turn('D');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'f':
    if (rotationDegree < PI/2) {
      cube.rotateCubeFront(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      //cube.turnFront('f');
      cube.turn('f');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'F':
    if (rotationDegree > -PI/2) {
      cube.rotateCubeFront(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      //cube.turnFront('F');
      cube.turn('F');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'b':
    if (rotationDegree > -PI/2) {
      cube.rotateCubeBack(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      //cube.turnBack('b');
      cube.turn('b');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'B':
    if (rotationDegree < PI/2) {
      cube.rotateCubeBack(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      //cube.turnBack('B');
      cube.turn('B');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'm':
    if (rotationDegree > -PI/2) {
      cube.rotateCubeMiddle(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      cube.turn('m');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'M':
    if (rotationDegree < PI/2) {
      cube.rotateCubeMiddle(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      cube.turn('M');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'e':
    if (rotationDegree < PI/2) {
      cube.rotateCubeEdge(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      cube.turn('e');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'E':
    if (rotationDegree > -PI/2) {
      cube.rotateCubeEdge(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      cube.turn('E');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'x':
    if (rotationDegree < PI/2) {
      cube.rotateVertical(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      cube.turnWholeCube(UP);
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'X':
    if (rotationDegree > -PI/2) {
      cube.rotateVertical(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      cube.turnWholeCube(DOWN);
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'y':
    if (rotationDegree > -PI/2) {
      cube.rotateHorizontal(rotationDegree);
      rotationDegree -= rotationSpeed;
    } else {
      cube.turnWholeCube(LEFT);
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'Y':
    if (rotationDegree < PI/2) {
      cube.rotateHorizontal(rotationDegree);
      rotationDegree += rotationSpeed;
    } else {
      cube.turnWholeCube(RIGHT);
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  default:
    cube.display();
    if (sequence.size() > 0) {
      turnSide(sequence.pollFirst());
    } else {
      rotationSpeed = radians(5); //was 10
      //println(solver.checkWhiteCross());
    }
  }

  popMatrix();
}

void keyPressed() {
  if (!rotateAnimation) {
    turnSide(key);
  }
}

void turnSide(char key) {
  if (key == '/') {
    if (locked) {
      locked = false;
    } else {
      locked = true;
    }
  } else if (key == 'r') {
    rotateAnimation = true;
    animationDirection = 'r';
  } else if (key =='R') {
    rotateAnimation = true;
    animationDirection = 'R';
  } else if (key == 'u') {
    rotateAnimation = true;
    animationDirection = 'u';
  } else if (key == 'U') {
    rotateAnimation = true;
    animationDirection = 'U';
  } else if (key == 'f') {
    rotateAnimation = true;
    animationDirection = 'f';
  } else if (key == 'F') {
    rotateAnimation = true;
    animationDirection = 'F';
  } else if (key == 'b') {
    rotateAnimation = true;
    animationDirection = 'b';
  } else if (key == 'B') {
    rotateAnimation = true;
    animationDirection = 'B';
  } else if (key == 'd') {
    rotateAnimation = true;
    animationDirection = 'd';
  } else if (key == 'D') {
    rotateAnimation = true;
    animationDirection = 'D';
  } else if (key == 'l') {
    rotateAnimation = true;
    animationDirection = 'l';
  } else if (key == 'L') {
    rotateAnimation = true;
    animationDirection = 'L';
  } else if (key == 'm') {
    rotateAnimation = true;
    animationDirection = 'm';
  } else if (key == 'M') {
    rotateAnimation = true;
    animationDirection = 'M';
  } else if (key == 'e') {
    rotateAnimation = true;
    animationDirection = 'e';
  } else if (key == 'E') {
    rotateAnimation = true;
    animationDirection = 'E';
  } else if (keyCode == RIGHT || key == 'Y') {
    rotateAnimation = true;
    animationDirection = 'Y';
  } else if (keyCode == LEFT || key == 'y') {
    rotateAnimation = true;
    animationDirection = 'y';
  } else if (keyCode == UP || key == 'x') {
    rotateAnimation = true;
    animationDirection = 'x';
  } else if (keyCode == DOWN || key == 'X') {
    rotateAnimation = true;
    animationDirection = 'X';
  }

  if (key == ' ') {
    println("SPACE");
    solveCube();
  }
  if (key == '0') {
    cube = new Cube(pos, cubeSize);
  }
}

//draws mouse position, fps and frame count to the top left corner of the screen
void drawInfo() {
  pushMatrix();
  textAlign(LEFT);
  fill(0);
  textSize(12);
  text("x: " + mouseX + ", y: " + mouseY, 10, 20);
  text("FPS: " +(int)frameRate, 10, 40);
  text("FC: " +frameCount, 10, 60);
  popMatrix();
}

//This method draws the key for the actions the user can perform on the cube
void drawKey() {
  pushMatrix();
  textAlign(LEFT);
  translate(10, 3*height/4);
  fill(0);
  textSize(15);
  text("Key", 0, 0);
  text("r - Right clockwise", 0, 20);
  text("l - Left clockwise", 0, 40);
  text("u - Top clockwise", 0, 60);
  text("d - Bottom clockwise", 0, 80);
  text("f - Front clockwise", 0, 100);
  text("b - Back clockwise", 0, 120);
  text("Shift + key - Counter-Clockwise", 0, 140);
  text("/ - unlock free rotation", 0, 160);
  text("0 - reset cube", 0, 180);
  popMatrix();
}

void setSequence(LinkedList<Character> sequence) {
  this.sequence = sequence;
}

void addToSequence(LinkedList<Character> s) { 
  for (int i = 0; i < s.size(); i++) {
    this.sequence.add(s.get(i));
  }
}

void randomizeCube(int numTurns) {
  sequence = new LinkedList<Character>();
  Character[] moves = new Character[] {'r', 'R', 'l', 'L', 'f', 'F', 'b', 'B', 'u', 'U', 'd', 'D'};
  for (int i = 0; i < numTurns; i++) {
    int rand = int(random(moves.length));
    sequence.add(moves[rand]);
  }
}

//--------------------------------------------------------------------------------------------------------------------------------- Methods for solving the cube

color WHITE = color(255);
color RED = color(255, 0, 0);
color GREEN = color(25, 165, 84);
color BLUE = color(0, 0, 255);
color YELLOW = color(255, 255, 0);
color ORANGE = color(255, 165, 0);

int numWhiteCrossDone = 0;
int numWhiteCornersDone = 0;
void solveCube() {
  switch(solveStep) {
  case 0: 
    whiteCross();
    break;
  case 1: 
    firstTwoLayers();
    break;
  }
}

void whiteCross() {
  color middleColor = cube.getBlock("011").getColors()[2];
  println("Solving White Cross");
  for (int i = 0; i < cube.topCross.size(); i++) {
    Block curr = cube.topCross.get(i);
    if (i == 0) { //TF
      if (curr.getTop() == WHITE && curr.getFront() == middleColor) {
        println("TF (oriented Correctly)");
        numWhiteCrossDone++;
        println(numWhiteCrossDone);
        if (numWhiteCrossDone < 4) {
          addToSequence(new LinkedList<Character>(Arrays.asList('y', ' ')));
        } else {
          addToSequence(new LinkedList<Character>(Arrays.asList('x', 'x', ' ')));
          solveStep++;
        }
        return;
      } else if (curr.getFront() == WHITE && curr.getTop() == middleColor) {
        println("TF (oriented Incorrectly)");
        addToSequence(CA.orientTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    } else if (i == 1) { //TL
      if ((curr.getTop() == WHITE && curr.getLeft() == middleColor) || (curr.getTop() == middleColor && curr.getLeft() == WHITE)) {
        addToSequence(CA.TLtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    } else if (i == 2) {
      if ((curr.getTop() == WHITE && curr.getBack() == middleColor) || (curr.getTop() == middleColor && curr.getBack() == WHITE)) {
        addToSequence(CA.TBtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    } else if (i == 3) {
      if ((curr.getTop() == WHITE && curr.getRight() == middleColor) || (curr.getTop() == middleColor && curr.getRight() == WHITE)) {
        addToSequence(CA.TRtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }
  }

  for (int i = 0; i < cube.middleEdges.size(); i++) {
    Block curr = cube.middleEdges.get(i);
    if (i == 0) {
      if ((curr.getFront() == WHITE && curr.getLeft() == middleColor) || (curr.getFront() == middleColor && curr.getLeft() == WHITE)) {
        addToSequence(CA.FLtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    } else if (i == 1) {
      if ((curr.getBack() == WHITE && curr.getLeft() == middleColor) || (curr.getBack() == middleColor && curr.getLeft() == WHITE)) {
        addToSequence(CA.BLtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    } else if (i == 2) {
      if ((curr.getBack() == WHITE && curr.getRight() == middleColor) || (curr.getBack() == middleColor && curr.getRight() == WHITE)) {
        addToSequence(CA.BRtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    } else if (i == 3) {
      if ((curr.getFront() == WHITE && curr.getRight() == middleColor) || (curr.getFront() == middleColor && curr.getRight() == WHITE)) {
        addToSequence(CA.FRtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }
  }

  for (int i = 0; i < cube.bottomCross.size(); i++) {
    Block curr = cube.bottomCross.get(i);
    if (i == 0) {
      if ((curr.getFront() == WHITE && curr.getBottom() == middleColor) || (curr.getFront() == middleColor && curr.getBottom() == WHITE)) {
        addToSequence(CA.DFtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    } else if (i == 1) {
      if ((curr.getLeft() == WHITE && curr.getBottom() == middleColor) || (curr.getLeft() == middleColor && curr.getBottom() == WHITE)) {
        addToSequence(CA.DLtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    } else if (i == 2) {
      if ((curr.getBack() == WHITE && curr.getBottom() == middleColor) || (curr.getBack() == middleColor && curr.getBottom() == WHITE)) {
        addToSequence(CA.DBtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    } else if (i == 3) {
      if ((curr.getRight() == WHITE && curr.getBottom() == middleColor) || (curr.getRight() == middleColor && curr.getBottom() == WHITE)) {
        addToSequence(CA.DRtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }
  }
}


void firstTwoLayers() {
  color front = cube.getBlock("011").getFront(); //middle front color
  color right = cube.getBlock("112").getRight(); //middle right color

  Block corner = cube.getBlock("022");
  Block edge = cube.getBlock("012");

  if (corner.hasColor(front) && corner.hasColor(right) && corner.hasColor(WHITE)) {
    if (corner.getFront() == front && corner.getRight() == right) { //corner and oriented correct
      if (edge.hasColor(front) && edge.hasColor(right)) {
        if (edge.getFront() == front && corner.getRight() == right) {
          //in place
          println("in place and correctly oriented");
          numWhiteCornersDone++;
          if (numWhiteCornersDone < 4) {
            addToSequence(new LinkedList<Character>(Arrays.asList('y', ' ')));
          } else {
            solveStep++;
          }
          return;
        } else {
          addToSequence(CA.cornerCorrectOrientEdge());
          addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
          return;
        }
      } else {
        for (int i = 0; i < cube.topCross.size(); i++) {
          edge = cube.topCross.get(i);
          if (edge.hasColor(front) && edge.hasColor(right)) {
            if (i == 0) {
              if (edge.getFront() == front) {
                addToSequence(CA.cornerCorrectEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getFront() == right) {
                addToSequence(new LinkedList<Character>(Arrays.asList('U')));
                addToSequence(CA.cornerCorrectEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (i == 1) {
              if (edge.getLeft() == front) {
                addToSequence(new LinkedList<Character>(Arrays.asList('U')));
                addToSequence(CA.cornerCorrectEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getLeft() == right) {
                addToSequence(new LinkedList<Character>(Arrays.asList('U', 'U')));
                addToSequence(CA.cornerCorrectEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (i == 2) {
              if (edge.getBack() == front) {
                addToSequence(new LinkedList<Character>(Arrays.asList('U', 'U')));
                addToSequence(CA.cornerCorrectEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getBack() == right) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u')));
                addToSequence(CA.cornerCorrectEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (i == 3) {
              if (edge.getRight() == front) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u')));
                addToSequence(CA.cornerCorrectEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getRight() == right) {
                addToSequence(CA.cornerCorrectEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            }
          }
        }
        //edge is located somewhere else (not in the top layer)
        addToSequence(new LinkedList<Character>(Arrays.asList('y', ' ')));
      }
    } else if (corner.getFront() == WHITE) { //corner in first layer twisted clockwise (don't think i need to check more in this if statement)
      if (edge.hasColor(front) && edge.hasColor(right)) { //edge is in the correct position, but not necessarily oriented correctly 
        if (edge.getFront() == front) { //The edge is correctly oriented
          addToSequence(CA.cornerCWCorrectEdge());
          addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
          return;
        } else { //edge is oriented incorrectly
          addToSequence(CA.cornerCWOrientEdge());
          addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
          return;
        }
      } else {//edge is located in top layer or in another edge spot on the cube
        for (int i = 0; i < cube.topCross.size(); i++) {
          edge = cube.topCross.get(i);
          if (edge.hasColor(front) && edge.hasColor(right)) {
            if (i == 0) {
              if (edge.getFront() == front) {
                addToSequence(CA.cornerCWEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getFront() == right) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u')));
                addToSequence(CA.cornerCWEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (i == 1) {
              if (edge.getLeft() == front) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u')));
                addToSequence(CA.cornerCWEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getLeft() == right) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u', 'u')));
                addToSequence(CA.cornerCWEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (i == 2) {
              if (edge.getBack() == front) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u', 'u')));
                addToSequence(CA.cornerCWEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getBack() == right) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u')));
                addToSequence(CA.cornerCWEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (i == 3) {
              if (edge.getRight() == front) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u')));
                addToSequence(CA.cornerCWEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getRight() == right) {
                addToSequence(CA.cornerCWEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            }
          }
        }
        //edge is located somewhere else (not in the top layer)
        addToSequence(new LinkedList<Character>(Arrays.asList('y', ' ')));
      }
    } else if (corner.getRight() == WHITE) { //corner in first layer twist counter clockwise
      if (edge.hasColor(front) && edge.hasColor(right)) { //edge is in the correct position, but not necessarily oriented correctly 
        if (edge.getFront() == front) { //The edge is correctly oriented
          addToSequence(CA.cornerCCWCorrectEdge());
          addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
          return;
        } else { //edge is oriented incorrectly
          addToSequence(CA.cornerCCWOrientEdge());
          addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
          return;
        }
      } else {//edge is located in top layer or in another edge spot on the cube
        for (int i = 0; i < cube.topCross.size(); i++) {
          edge = cube.topCross.get(i);
          if (edge.hasColor(front) && edge.hasColor(right)) {
            if (i == 0) {
              if (edge.getFront() == front) {
                addToSequence(CA.cornerCCWEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getFront() == right) {
                addToSequence(new LinkedList<Character>(Arrays.asList('U')));
                addToSequence(CA.cornerCCWEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (i == 1) {
              if (edge.getLeft() == front) {
                addToSequence(new LinkedList<Character>(Arrays.asList('U')));
                addToSequence(CA.cornerCCWEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getLeft() == right) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u', 'u')));
                addToSequence(CA.cornerCCWEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (i == 2) {
              if (edge.getBack() == front) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u', 'u')));
                addToSequence(CA.cornerCCWEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getBack() == right) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u')));
                addToSequence(CA.cornerCCWEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (i == 3) {
              if (edge.getRight() == front) {
                addToSequence(new LinkedList<Character>(Arrays.asList('u')));
                addToSequence(CA.cornerCCWEdgeTF());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getRight() == right) {
                addToSequence(CA.cornerCCWEdgeTR());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            }
          }
        }
        //edge is located somewhere else (not in the top layer)
        addToSequence(new LinkedList<Character>(Arrays.asList('y', ' ')));
      }
    }
  } else if (edge.hasColor(front) && edge.hasColor(right)) { //correct edge is located in the correct spot, but not neccesarily oriented 
    for (int i = 0; i < cube.topCorners.size(); i++) {
      corner = cube.topCorners.get(i);
      if (corner.hasColor(front) && corner.hasColor(right) && corner.hasColor(WHITE)) {
        //if i == 0, the corner is already located in the correct position
        if (i == 1) {//TFL
          addToSequence(new LinkedList<Character>(Arrays.asList('U')));
        } else if (i == 2) {//TBL
          addToSequence(new LinkedList<Character>(Arrays.asList('u', 'u')));
        } else if (i == 3) {//TBR
          addToSequence(new LinkedList<Character>(Arrays.asList('u')));
        }

        if (edge.getFront() == front) {
          if (corner.getTop() == WHITE) {
            addToSequence(CA.edgeCorrectWhiteUp());
            addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
            return;
          } else if (corner.getTop() == right) {
            addToSequence(CA.edgeCorrectWhiteRight());
            addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
            return;
          } else if (corner.getTop() == front) {
            addToSequence(CA.edgeCorrectWhiteFront());
            addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
            return;
          }
        } else if (edge.getFront() == right) {
          if (corner.getTop() == WHITE) {
            addToSequence(CA.whiteFacingUpOrientEdge());
            addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
            return;
          } else if (corner.getTop() == right) {
            addToSequence(CA.whiteFacingRightOrientEdge());
            addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
            return;
          } else if (corner.getTop() == front) {
            addToSequence(CA.whiteFacingFrontOrientEdge());
            addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
            return;
          }
        }
      }
    }
  } else { //else check if it is in the top layer, otherwise move on
    for (int i = 0; i < cube.topCorners.size(); i++) { //gets the top right corner of the cube
      corner = cube.topCorners.get(i);
      if (corner.hasColor(front) && corner.hasColor(right) && corner.hasColor(WHITE)) {
        if (i == 0) {
          println("corner in top right");
          break;
        } else if (i == 1) {
          addToSequence(new LinkedList<Character>(Arrays.asList('U', ' ')));
          return;
        } else if (i == 2) {
          addToSequence(new LinkedList<Character>(Arrays.asList('u', 'u', ' ')));
          return;
        } else if (i == 3) {
          addToSequence(new LinkedList<Character>(Arrays.asList('u', ' ')));
          return;
        }
      }
    }
    if (corner.hasColor(front) && corner.hasColor(right) && corner.hasColor(WHITE)) {
      for (int i = 0; i < cube.topCross.size(); i++) {
        edge = cube.topCross.get(i);
        if (edge.hasColor(front) && edge.hasColor(right)) {
          if (i == 0) {
            if (corner.getTop() == WHITE) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingUpEdgeTFFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingUpEdgeTFRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (corner.getTop() == front) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingFrontEdgeTFFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingFrontEdgeTFRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (corner.getTop() == right) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingRightEdgeTFFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingRightEdgeTFRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            }
          } else if (i == 1) {
            if (corner.getTop() == WHITE) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingUpEdgeTLFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingUpEdgeTLRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (corner.getTop() == front) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingFrontEdgeTLFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingFrontEdgeTLRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (corner.getTop() == right) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingRightEdgeTLFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingRightEdgeTLRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            }
          } else if (i == 2) {
            if (corner.getTop() == WHITE) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingUpEdgeTBFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingUpEdgeTBRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (corner.getTop() == front) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingFrontEdgeTBFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingFrontEdgeTBRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (corner.getTop() == right) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingRightEdgeTBFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingRightEdgeTBRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            }
          } else if (i == 3) {
            if (corner.getTop() == WHITE) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingUpEdgeTRFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingUpEdgeTRRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (corner.getTop() == front) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingFrontEdgeTRFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingFrontEdgeTRRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            } else if (corner.getTop() == right) {
              if (edge.getTop() == front) {
                addToSequence(CA.whiteFacingRightEdgeTRFrontColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              } else if (edge.getTop() == right) {
                addToSequence(CA.whiteFacingRightEdgeTRRightColorUp());
                addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
                return;
              }
            }
          }
        }
      }
      //the edge is not located in the top layer, but the corner is (and should be in the top right corner position)
      println("error, corner is in the top right but the edge is not located in the top layer or FR edge");
      for (int i = 0; i < cube.middleEdges.size()-1; i++) {
        edge = cube.middleEdges.get(i);
        if (edge.hasColor(front) && edge.hasColor(right)) {
          switch(i) {
          case 0:
            addToSequence(new LinkedList<Character>(Arrays.asList('L', 'U', 'l', ' ')));
            return;
          case 1:
            addToSequence(new LinkedList<Character>(Arrays.asList('l', 'U', 'L', ' ')));
            return;
          case 2:
            addToSequence(new LinkedList<Character>(Arrays.asList('R', 'u', 'r', ' ')));
            return;
          }
        }
      }
    }
  }
  println("error, the cube is not in a position to perform an algorithm");
  for (int i = 1; i < cube.bottomCorners.size(); i++) {
    corner = cube.bottomCorners.get(i);
    if (corner.hasColor(WHITE) && corner.hasColor(front) && corner.hasColor(right)) {
      switch(i) {
      case 1:
        addToSequence(new LinkedList<Character>(Arrays.asList('L', 'U', 'l', ' ')));
        return;
      case 2:
        addToSequence(new LinkedList<Character>(Arrays.asList('l', 'U', 'L', ' ')));
        return;
      case 3:
        addToSequence(new LinkedList<Character>(Arrays.asList('R', 'u', 'r', ' ')));
        return;
      }
    }
  }
}
