    //A object for the cube //<>//
import java.util.LinkedList;
import java.util.ArrayList;

class Cube {
  PVector center; //3D vector of the center of the cube
  int size; //size of the cube
  int sizeOfBlock; //the size of the blocks in the cube based on the cube size
  Block[][][] cube; //the 3D array of blocks that make the cube
  
  
  //potentially keeping Array lists of all the sides (plus middles) in order to make the code for the turns more clean and potentially better future proof in case I add self solving abilities. 

  ArrayList<Block> right, left, top, bottom, front, back, middle, edge; 
  
  ArrayList<Block> topCross, middleEdges, bottomCross; //all of the possible edges

  color WHITE = color(255);
  color RED = color(255, 0, 0);
  color GREEN = color(25, 165, 84);
  color BLUE = color(0, 0, 255);
  color YELLOW = color(255, 255, 0);
  color ORANGE = color(255, 165, 0);

  public Cube(PVector center, int size) {
    this.center = center;
    this.size = size;
    this.sizeOfBlock = this.size/3;
    cube = new Block[3][3][3];
    boolean top, bottom, front, back, left, right; //booleans for assigning colors to the size of the cube
    top = bottom = front = back = left = right = false;
    for (int i = 0; i < 3; i++) {//sets the z coord 
      int z = 0;
      front = back = false;
      if (i==0) {
        z = sizeOfBlock/2;
        front = true;
      } else if (i==1) {
        z = -sizeOfBlock/2;
      } else if (i == 2) {
        z = -sizeOfBlock/2 - sizeOfBlock;
        back = true;
      }
      for (int j = 0; j < 3; j++) {//sets the y coord
        int y = 0;
        top = bottom = false;
        if (j==0) {
          y = sizeOfBlock/2 - sizeOfBlock - sizeOfBlock;
          top = true;
        } else if (j==1) {
          y = sizeOfBlock/2 - sizeOfBlock;
        } else if (j==2) {
          y = sizeOfBlock/2;
          bottom = true;
        }
        for (int k = 0; k < 3; k++) {//sets the x coord
          int x = 0;
          left = right = false;
          if (k==0) {
            x = sizeOfBlock/2 - sizeOfBlock - sizeOfBlock;
            left = true;
          } else if (k==1) {
            x = sizeOfBlock/2 - sizeOfBlock;
          } else if (k==2) {
            x = sizeOfBlock/2;
            right = true;
          }
          PVector pos = new PVector(x, y, z);

          //sets the color array for the block
          int[] colors = new int[6];
          if (top) colors[0] = WHITE;
          if(bottom) colors[1] = YELLOW;
          if(front) colors[2] = RED;
          if(back) colors[3] = ORANGE;
          if(left) colors[4] = GREEN;
          if(right) colors[5] = BLUE;
          cube[i][j][k] = new Block(pos, sizeOfBlock, colors);
        }
      }
    }
    
    this.right = createRight();
    this.left = createLeft();
    this.top = createTop();
    this.bottom = createBottom();
    this.front = createFront();
    this.back = createBack();
    this.middle = createMiddle();
    this.edge = createEdge();
    
    this.topCross = createTopCross();
    this.middleEdges = createMiddleEdges();
    this.bottomCross = createBottomCross();
    
  }

  void display() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          //if(i == 0 && j == 2 && k == 1) break;
          cube[i][j][k].display();
        }
      }
    }
  }
  
  ArrayList<Block> createRight(){
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("002"));
    rval.add(getBlock("102"));
    rval.add(getBlock("202"));
    rval.add(getBlock("212"));
    rval.add(getBlock("222"));
    rval.add(getBlock("122"));
    rval.add(getBlock("022"));
    rval.add(getBlock("012"));
    //keeping the middle block at the back of the list so it can still be roated in the animation, but not affect the turns as it does not move in the turns
    rval.add(getBlock("112"));
    return rval;
  }
  
  ArrayList<Block> createLeft(){
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("200"));
    rval.add(getBlock("100"));
    rval.add(getBlock("000"));
    rval.add(getBlock("010"));
    rval.add(getBlock("020"));
    rval.add(getBlock("120"));
    rval.add(getBlock("220"));
    rval.add(getBlock("210"));
    
    rval.add(getBlock("110")); //middle of left
    return rval;
  }
  
  ArrayList<Block> createTop() {
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("200"));
    rval.add(getBlock("201"));
    rval.add(getBlock("202"));
    rval.add(getBlock("102"));
    rval.add(getBlock("002"));
    rval.add(getBlock("001"));
    rval.add(getBlock("000"));
    rval.add(getBlock("100"));
    
    rval.add(getBlock("101")); //middle of top
    return rval;
  }
  
  ArrayList<Block> createBottom() {
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("020"));
    rval.add(getBlock("021"));
    rval.add(getBlock("022"));
    rval.add(getBlock("122"));
    rval.add(getBlock("222"));
    rval.add(getBlock("221"));
    rval.add(getBlock("220"));
    rval.add(getBlock("120"));
    
    rval.add(getBlock("121")); //middle of bottom
    return rval;
  }
  
  ArrayList<Block> createFront() {
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("000"));
    rval.add(getBlock("001"));
    rval.add(getBlock("002"));
    rval.add(getBlock("012"));
    rval.add(getBlock("022"));
    rval.add(getBlock("021"));
    rval.add(getBlock("020"));
    rval.add(getBlock("010"));
    
    rval.add(getBlock("011")); //middle of front
    return rval;
  }
  
  ArrayList<Block> createBack(){
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("202"));
    rval.add(getBlock("201"));
    rval.add(getBlock("200"));
    rval.add(getBlock("210"));
    rval.add(getBlock("220"));
    rval.add(getBlock("221"));
    rval.add(getBlock("222"));
    rval.add(getBlock("212"));
    
    rval.add(getBlock("211")); //midd of the back
    return rval;
  }
  
  ArrayList<Block> createMiddle() {
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("001"));
    rval.add(getBlock("101"));
    rval.add(getBlock("201"));
    rval.add(getBlock("211"));
    rval.add(getBlock("221"));
    rval.add(getBlock("121"));
    rval.add(getBlock("021"));
    rval.add(getBlock("011"));
    
    rval.add(getBlock("111")); //center block
    return rval;
 }
 
  ArrayList<Block> createEdge() {
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("210"));
    rval.add(getBlock("211"));
    rval.add(getBlock("212"));
    rval.add(getBlock("112"));
    rval.add(getBlock("012"));
    rval.add(getBlock("011"));
    rval.add(getBlock("010"));
    rval.add(getBlock("110"));
    
    rval.add(getBlock("111")); //center block
    return rval;
  }
  
  ArrayList<Block> createTopCross() {
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("001")); //TF
    rval.add(getBlock("100")); //TL
    rval.add(getBlock("201")); //TB
    rval.add(getBlock("102")); //TR
    return rval;
  }
  
  ArrayList<Block> createMiddleEdges() {
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("010")); //FL
    rval.add(getBlock("210")); //BL
    rval.add(getBlock("212")); //BR
    rval.add(getBlock("012")); //FR
    return rval;
  }
  
  ArrayList<Block> createBottomCross() {
    ArrayList<Block> rval = new ArrayList<Block>();
    rval.add(getBlock("021")); //DF
    rval.add(getBlock("120")); //DL
    rval.add(getBlock("221")); //DB
    rval.add(getBlock("122")); //DR
    return rval;
  }
  
  void turn(char direction){
    switch(Character.toLowerCase(direction)){
    case 'r':
      turn(direction, this.right);
      break;
    case 'l':
      turn(direction, this.left);
      break;
    case 'u':
      turn(direction, this.top);
      break;
    case 'd':
      turn(direction, this.bottom);
      break;
    case 'f':
      turn(direction, this.front);
      break;
    case 'b':
      turn(direction, this.back);
      break;
    default:
      println("ERROR, direction is not valid");
    }
  }
  
  void turn(char direction, ArrayList<Block> list){
    LinkedList<Block> temp = new LinkedList<Block>();
    for(int i = 0; i < list.size()-1; i++) {
      temp.add(list.get(i).clone());
    }
    println(direction);
    if(!Character.isUpperCase(direction)){
      //println("Clockwise");
      temp.add(0, temp.pollLast());
      temp.add(0, temp.pollLast());
    }else if(Character.isUpperCase(direction)){
      //println("Counter-Clockwise");
      temp.add(temp.size()-1, temp.pollFirst());
      temp.add(temp.size()-1, temp.pollFirst());
    }
    
    for(int i = 0; i < temp.size(); i++) {
      list.get(i).setColors(temp.get(i).getColors());
      list.get(i).turn(direction);
    }
    
  }
  
  
  /**
   * This method turns the right side of the cube by taking the blocks on the side in order around the center and placing a clone of the block in a linked list. 
   * This linked list is then rotated around depending on the oritation of the rotation. Then the colors of the blocks rotated as well. Finally, the faces of the blocks are changed to match their new position. 
   * This method essentially rotates just the colors of the blocks.
   *
   * @param the orientation of the turn. r = clockwise, R = counter-clockwise
   */
  
  
  //This method rotates the right side of the cube for the animation of the turn by rotating just the blocks the right side by the given rotation degree of the cube before displaying them and then the rest of the cube
  void rotateCubeRight(float radians){
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 2; k++) {
          //println(i + ", " + j + ", " + k);
          cube[i][j][k].display();
        }
      }
    }
    pushMatrix();
    rotateX(radians);
    for(int i = 0; i < right.size(); i++){
      right.get(i).display();
    }
    popMatrix();
  }
  
  //This method rotates the left side of the cube for the animation in the same method described above 
  void rotateCubeLeft(float radians){
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 1; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
    }
    pushMatrix();
    rotateX(radians);
    for(int i = 0; i < left.size(); i++){
      left.get(i).display();
    }
    popMatrix();
  }
  
  //This method rotates the top side of the cube for the animation in the same method described above
  void rotateCubeUp(float radians){
    for (int i = 0; i < 3; i++) {
      for (int j = 1; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
    }
    pushMatrix();
    rotateY(radians);
    for(int i = 0; i < top.size(); i++){
      top.get(i).display();
    }
    popMatrix();
  }
  
  //This method rotates the bottom side of the cube for the animation in the same method described above
  void rotateCubeDown(float radians){
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 2; j++) {
        for (int k = 0; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
    }
    pushMatrix();
    rotateY(radians);
    for(int i = 0; i < bottom.size(); i++){
      bottom.get(i).display();
    }
    popMatrix();
  }
  
  //This method rotates the front side of the cube for the animation in the same method described above
  void rotateCubeFront(float radians){
    for (int i = 1; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
    }
    pushMatrix();
    rotateZ(radians);
    for(int i = 0; i < front.size(); i++){
      front.get(i).display();
    }
    popMatrix();
  }
  
  //This method rotates the back side of the cube for the animation in the same method described above
  void rotateCubeBack(float radians){
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
    }
    pushMatrix();
    rotateZ(radians);
    for(int i = 0; i < back.size(); i++){
      back.get(i).display();
    }
    popMatrix();
  }
  
  //This method rotates the whole cube either in the x or y directions using a similar method of turns as the individual direction turns but for the whole cube
  void turnWholeCube(int direction){
    switch(direction){
    case UP:
      //Right
      this.turn('r', this.right);
      this.turn('r', this.middle);
      this.turn('L', this.left);
      break;
    case DOWN:
      //Right
      this.turn('R', this.right);
      this.turn('R', this.middle);
      this.turn('l', this.left);
      break;
    case RIGHT:
      //top
      this.turn('U', this.top);
      this.turn('U', this.edge);
      this.turn('d', this.bottom);
      break;
    case LEFT:
      this.turn('u', this.top);
      this.turn('u', this.edge);
      this.turn('D', this.bottom);
      break;
    }
  }
  
  void rotateHorizontal(float radians){
    pushMatrix();
    rotateY(radians);
    display();
    popMatrix();
  }
  
  void rotateVertical(float radians){
    pushMatrix();
    rotateX(radians);
    display();
    popMatrix();
  }
  
  //This method returns the block at the 3 number code given as a string, between 000 and 222 (zyx)
  Block getBlock(String codeString){
    int code = Integer.parseInt(codeString);
    int x = (code%10);
    code/=10;
    int y = code%10;
    code/=10;
    int z = code;
    return cube[z][y][x];
  }
  
  
  
  
}
