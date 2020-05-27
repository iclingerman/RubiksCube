import java.util.LinkedList;

import java.util.Arrays;

LinkedList<Character> sequence;

Cube cube;
CubeAlgorithms CA;
PVector pos;
int size;
int cubeSize;
boolean locked; //whether or not the cube free rotation is locked

boolean whiteCrossDone;


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
  
  whiteCrossDone = false;
}

void draw() {
  clear();
  background(255);
  drawInfo();
  drawKey();
  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  
  if(!locked){
    rotateX(-radians(mouseY));
    rotateY(radians(mouseX));
  }else{
    rotateX(-radians(30));
    rotateY(-radians(38));
  }
  switch(animationDirection){
  case 'r':
    if(rotationDegree < PI/2){
      cube.rotateCubeRight(rotationDegree);
      rotationDegree += rotationSpeed;
    }else{
      //cube.turnRight('r');
      cube.turn('r');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'R':
    if(rotationDegree > -PI/2){
      cube.rotateCubeRight(rotationDegree);
      rotationDegree -= rotationSpeed;
    }else{
      //cube.turnRight('R');
      cube.turn('R');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'l':
    if(rotationDegree > -PI/2){
      cube.rotateCubeLeft(rotationDegree);
      rotationDegree -= rotationSpeed;
    }else{
      //cube.turnLeft('l');
      cube.turn('l');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'L':
    if(rotationDegree < PI/2){
      cube.rotateCubeLeft(rotationDegree);
      rotationDegree += rotationSpeed;
    }else{
      //cube.turnLeft('L');
      cube.turn('L');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'u':
    if(rotationDegree > -PI/2){
      cube.rotateCubeUp(rotationDegree);
      rotationDegree -= rotationSpeed;
    }else{
      //cube.turnTop('u');
      cube.turn('u');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'U':
    if(rotationDegree < PI/2){
      cube.rotateCubeUp(rotationDegree);
      rotationDegree += rotationSpeed;
    }else{
      //cube.turnTop('U');
      cube.turn('U');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'd':
    if(rotationDegree < PI/2){
      cube.rotateCubeDown(rotationDegree);
      rotationDegree += rotationSpeed;
    }else{
      //cube.turnBottom('d');
      cube.turn('d');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'D':
    if(rotationDegree > -PI/2){
      cube.rotateCubeDown(rotationDegree);
      rotationDegree -= rotationSpeed;
    }else{
      //cube.turnBottom('D');
      cube.turn('D');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'f':
    if(rotationDegree < PI/2){
      cube.rotateCubeFront(rotationDegree);
      rotationDegree += rotationSpeed;
    }else{
      //cube.turnFront('f');
      cube.turn('f');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'F':
    if(rotationDegree > -PI/2){
      cube.rotateCubeFront(rotationDegree);
      rotationDegree -= rotationSpeed;
    }else{
      //cube.turnFront('F');
      cube.turn('F');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'b':
    if(rotationDegree > -PI/2){
      cube.rotateCubeBack(rotationDegree);
      rotationDegree -= rotationSpeed;
    }else{
      //cube.turnBack('b');
      cube.turn('b');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
  case 'B':
    if(rotationDegree < PI/2){
      cube.rotateCubeBack(rotationDegree);
      rotationDegree += rotationSpeed;
    }else{
      //cube.turnBack('B');
      cube.turn('B');
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
    break;
   case 'x':
     if(rotationDegree < PI/2){
      cube.rotateVertical(rotationDegree);
      rotationDegree += rotationSpeed;
    }else{
      cube.turnWholeCube(UP);
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
     break;
   case 'X':
     if(rotationDegree > -PI/2){
      cube.rotateVertical(rotationDegree);
      rotationDegree -= rotationSpeed;
    }else{
      cube.turnWholeCube(DOWN);
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
     break;
   case 'y':
     if(rotationDegree > -PI/2){
      cube.rotateHorizontal(rotationDegree);
      rotationDegree -= rotationSpeed;
    }else{
      cube.turnWholeCube(LEFT);
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
     break;
   case 'Y':
     if(rotationDegree < PI/2){
      cube.rotateHorizontal(rotationDegree);
      rotationDegree += rotationSpeed;
    }else{
      cube.turnWholeCube(RIGHT);
      rotationDegree = 0;
      cube.display();
      rotateAnimation = false;
      animationDirection = '-';
    }
     break;
  default:
    cube.display();
    if(sequence.size() > 0){
      turnSide(sequence.pollFirst());
    }else{
      rotationSpeed = radians(10);
      //println(solver.checkWhiteCross());
                                                                
    }
  }
  
  popMatrix();
}

void keyPressed(){
  turnSide(key);
}

void turnSide(char key) {
  if(key == '/') {
      if(locked){
        locked = false;
      }else{
        locked = true;
      }
    }else if(key == 'r'){
      rotateAnimation = true;
      animationDirection = 'r';
    }else if(key =='R'){
      rotateAnimation = true;
      animationDirection = 'R';
    }else if(key == 'u'){
      rotateAnimation = true;
      animationDirection = 'u';
    }else if(key == 'U'){
      rotateAnimation = true;
      animationDirection = 'U';
    }else if(key == 'f'){
      rotateAnimation = true;
      animationDirection = 'f';
    }else if(key == 'F'){
      rotateAnimation = true;
      animationDirection = 'F';
    }else if(key == 'b'){
      rotateAnimation = true;
      animationDirection = 'b';
    }else if(key == 'B'){
      rotateAnimation = true;
      animationDirection = 'B';
    }else if(key == 'd'){
      rotateAnimation = true;
      animationDirection = 'd';
    }else if(key == 'D'){
      rotateAnimation = true;
      animationDirection = 'D';
    }else if(key == 'l'){
      rotateAnimation = true;
      animationDirection = 'l';
    }else if(key == 'L'){
      rotateAnimation = true;
      animationDirection = 'L';
    }else if(keyCode == RIGHT || key == 'Y'){
      rotateAnimation = true;
      animationDirection = 'Y';
    }else if(keyCode == LEFT || key == 'y'){
      rotateAnimation = true;
      animationDirection = 'y';
    }else if(keyCode == UP || key == 'x'){
      rotateAnimation = true;
      animationDirection = 'x';
    }else if(keyCode == DOWN || key == 'X'){
      rotateAnimation = true;
      animationDirection = 'X';
    }
    
    if(key == ' ') {
      solveCube();
    }
    if(key == '0'){
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

void setSequence(LinkedList<Character> sequence){
  this.sequence = sequence;
}

void addToSequence(LinkedList<Character> s){ 
  for(int i = 0; i < s.size(); i++) {
    this.sequence.add(s.get(i));
  }
}

void randomizeCube(int numTurns) {
  sequence = new LinkedList<Character>();
  Character[] moves = new Character[] {'r', 'R', 'l', 'L', 'f', 'F', 'b', 'B', 'u', 'U', 'd', 'D'};
  for(int i = 0; i < numTurns; i++){
    int rand = int(random(moves.length));
    sequence.add(moves[rand]);
  }
}


  /*
   * index 0 - top
   * index 1 - bottom
   * index 2 - front
   * index 3 - back
   * index 4 - left
   * index 5 - right
   */
  //--------------------------------------------------------------------------------------------------------------------------------- Methods for solving the cube

  color WHITE = color(255);
  color RED = color(255, 0, 0);
  color GREEN = color(25, 165, 84);
  color BLUE = color(0, 0, 255);
  color YELLOW = color(255, 255, 0);
  color ORANGE = color(255, 165, 0);

int numWhiteCrossDone = 0;
void solveCube(){
  //if(numWhiteCrossDone > 4) whiteCrossDone = true;
  if(!whiteCrossDone){
    whiteCross();
  }
    
}

void whiteCross() {
  color middleColor = cube.getBlock("011").getColors()[2];
  println("Solving White Cross");
  for(int i = 0; i < cube.topCross.size(); i++) {
    Block curr = cube.topCross.get(i);
    if(i == 0){ //TF
      if(curr.getTop() == WHITE && curr.getFront() == middleColor) {
        println("TF (oriented Correctly)");
        numWhiteCrossDone++;
        println(numWhiteCrossDone);
        if(numWhiteCrossDone < 4){
          addToSequence(new LinkedList<Character>(Arrays.asList('y', ' ')));
        }else {
          addToSequence(new LinkedList<Character>(Arrays.asList('x', 'x', 'y')));
          whiteCrossDone = true;
        }
        return;
      }else if(curr.getFront() == WHITE && curr.getTop() == middleColor) {
        println("TF (oriented Incorrectly)");
        addToSequence(CA.orientTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }else if(i == 1) { //TL
      if((curr.getTop() == WHITE && curr.getLeft() == middleColor) || (curr.getTop() == middleColor && curr.getLeft() == WHITE)) {
        addToSequence(CA.TLtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }else if(i == 2) {
      if((curr.getTop() == WHITE && curr.getBack() == middleColor) || (curr.getTop() == middleColor && curr.getBack() == WHITE)) {
        addToSequence(CA.TBtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }else if(i == 3) {
      if((curr.getTop() == WHITE && curr.getRight() == middleColor) || (curr.getTop() == middleColor && curr.getRight() == WHITE)) {
        addToSequence(CA.TRtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }
  }
  
  for(int i = 0; i < cube.middleEdges.size(); i++) {
    Block curr = cube.middleEdges.get(i);
    if(i == 0) {
      if((curr.getFront() == WHITE && curr.getLeft() == middleColor) || (curr.getFront() == middleColor && curr.getLeft() == WHITE)) {
        addToSequence(CA.FLtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }else if(i == 1) {
      if((curr.getBack() == WHITE && curr.getLeft() == middleColor) || (curr.getBack() == middleColor && curr.getLeft() == WHITE)) {
        addToSequence(CA.BLtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }else if(i == 2) {
      if((curr.getBack() == WHITE && curr.getRight() == middleColor) || (curr.getBack() == middleColor && curr.getRight() == WHITE)) {
        addToSequence(CA.BRtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }else if(i == 3) {
      if((curr.getFront() == WHITE && curr.getRight() == middleColor) || (curr.getFront() == middleColor && curr.getRight() == WHITE)) {
        addToSequence(CA.FRtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }
  }
  
  for(int i = 0; i < cube.bottomCross.size(); i++) {
    Block curr = cube.bottomCross.get(i);
    if(i == 0) {
      if((curr.getFront() == WHITE && curr.getBottom() == middleColor) || (curr.getFront() == middleColor && curr.getBottom() == WHITE)) {
        addToSequence(CA.DFtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }else if(i == 1) {
      if((curr.getLeft() == WHITE && curr.getBottom() == middleColor) || (curr.getLeft() == middleColor && curr.getBottom() == WHITE)) {
        addToSequence(CA.DLtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }else if(i == 2) {
      if((curr.getBack() == WHITE && curr.getBottom() == middleColor) || (curr.getBack() == middleColor && curr.getBottom() == WHITE)) {
        addToSequence(CA.DBtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }else if(i == 3) {
      if((curr.getRight() == WHITE && curr.getBottom() == middleColor) || (curr.getRight() == middleColor && curr.getBottom() == WHITE)) {
        addToSequence(CA.DRtoTF());
        addToSequence(new LinkedList<Character>(Arrays.asList(' ')));
        return;
      }
    }
  }
  
}
