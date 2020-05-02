import java.util.Scanner;
Scanner scan;

Cube cube;
PVector pos;
int size;
int cubeSize;
boolean locked; //whether or not the cube free rotation is locked

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
  locked = true;
  rotatingRight = false;
  rotationDegree = 0;
  rotateAnimation = false;
  animationDirection = '-';
  rotationSpeed = radians(10);
  strokeWeight(7);
  scan = new Scanner(System.in);
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
  }
  
  popMatrix();
}

void keyPressed(){
  if(!rotateAnimation){
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
    
    if(key == '0'){
      cube = new Cube(pos, cubeSize);
    }
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
