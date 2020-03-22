//A object for the cube //<>//
import java.util.LinkedList;
class Cube {
  PVector center; //3D vector of the center of the cube
  int size; //size of the cube
  int sizeOfBlock; //the size of the blocks in the cube based on the cube size
  Block[][][] cube; //the 3D array of blocks that make the cube

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
          //colors = new color[]{WHITE, YELLOW, RED, ORANGE, GREEN, BLUE};
          cube[i][j][k] = new Block(pos, sizeOfBlock, colors);
        }
      }
    }
  }

  void display() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
    }
  }
  
  /**
   * This method turns the right side of the cube by taking the blocks on the side in order around the center and placing a clone of the block in a linked list. 
   * This linked list is then rotated around depending on the oritation of the rotation. Then the colors of the blocks rotated as well. Finally, the faces of the blocks are changed to match their new position. 
   * This method essentially rotates just the colors of the blocks.
   *
   * @param the orientation of the turn. r = clockwise, R = counter-clockwise
   */
  void turnRight(char direction){
    print("Turing Right ");
    LinkedList<Block> list = new LinkedList<Block>();
    list.add(getBlock("002").clone());
    list.add(getBlock("102").clone());
    list.add(getBlock("202").clone());
    list.add(getBlock("212").clone());
    list.add(getBlock("222").clone());
    list.add(getBlock("122").clone());
    list.add(getBlock("022").clone());
    list.add(getBlock("012").clone());
    if(direction == 'r'){
      println("Clockwise");
      list.add(0, list.pollLast());
      list.add(0, list.pollLast());
    }else if(direction == 'R'){
      println("Counter-Clockwise");
      list.add(list.size()-1, list.pollFirst());
      list.add(list.size()-1, list.pollFirst());
    }
    getBlock("002").setColors(list.get(0).getColors());
    getBlock("102").setColors(list.get(1).getColors());
    getBlock("202").setColors(list.get(2).getColors());
    getBlock("212").setColors(list.get(3).getColors());
    getBlock("222").setColors(list.get(4).getColors());
    getBlock("122").setColors(list.get(5).getColors());
    getBlock("022").setColors(list.get(6).getColors());
    getBlock("012").setColors(list.get(7).getColors());

    getBlock("002").turn(direction);
    getBlock("102").turn(direction);
    getBlock("202").turn(direction);
    getBlock("212").turn(direction);
    getBlock("222").turn(direction);
    getBlock("122").turn(direction);
    getBlock("022").turn(direction);
    getBlock("012").turn(direction);
  }
  //TODO fix to use getBlock method for the rest of the turn methods
  
  //This method turns the top in a similar method as described above
  void turnTop(char direction){
    print("Turing Top ");
    LinkedList<Block> list = new LinkedList<Block>();
    list.add(cube[2][0][0].clone());
    list.add(cube[2][0][1].clone());
    list.add(cube[2][0][2].clone());
    list.add(cube[1][0][2].clone());
    list.add(cube[0][0][2].clone());
    list.add(cube[0][0][1].clone());
    list.add(cube[0][0][0].clone());
    list.add(cube[1][0][0].clone());
    if(direction == 'u'){
      println("Clockwise");
      list.add(0, list.pollLast());
      list.add(0, list.pollLast());
    }else if(direction == 'U'){
      println("Counter-Clockwise");
      list.add(list.size()-1, list.pollFirst());
      list.add(list.size()-1, list.pollFirst());      
    }
    cube[2][0][0].setColors(list.get(0).getColors());
    cube[2][0][1].setColors(list.get(1).getColors());
    cube[2][0][2].setColors(list.get(2).getColors());
    cube[1][0][2].setColors(list.get(3).getColors());
    cube[0][0][2].setColors(list.get(4).getColors());
    cube[0][0][1].setColors(list.get(5).getColors());
    cube[0][0][0].setColors(list.get(6).getColors());
    cube[1][0][0].setColors(list.get(7).getColors());
    
    cube[2][0][0].turn(direction);
    cube[2][0][1].turn(direction);
    cube[2][0][2].turn(direction);
    cube[1][0][2].turn(direction);
    cube[0][0][2].turn(direction);
    cube[0][0][1].turn(direction);
    cube[0][0][0].turn(direction);
    cube[1][0][0].turn(direction);
  }
  
  //This method turns the front in a similar method as described above
  void turnFront(char direction){
    print("Turing Front ");
    LinkedList<Block> list = new LinkedList<Block>();
    list.add(cube[0][0][0].clone());
    list.add(cube[0][0][1].clone());
    list.add(cube[0][0][2].clone());
    list.add(cube[0][1][2].clone());
    list.add(cube[0][2][2].clone());
    list.add(cube[0][2][1].clone());
    list.add(cube[0][2][0].clone());
    list.add(cube[0][1][0].clone());
    if(direction == 'f'){
      println("Clockwise");
      list.add(0, list.pollLast());
      list.add(0, list.pollLast());
    }else if(direction == 'F'){
      println("Counter-Clockwise");
      list.add(list.size()-1, list.pollFirst());
      list.add(list.size()-1, list.pollFirst());      
    }
    cube[0][0][0].setColors(list.get(0).getColors());
    cube[0][0][1].setColors(list.get(1).getColors());
    cube[0][0][2].setColors(list.get(2).getColors());
    cube[0][1][2].setColors(list.get(3).getColors());
    cube[0][2][2].setColors(list.get(4).getColors());
    cube[0][2][1].setColors(list.get(5).getColors());
    cube[0][2][0].setColors(list.get(6).getColors());
    cube[0][1][0].setColors(list.get(7).getColors());
    
    cube[0][0][0].turn(direction);
    cube[0][0][1].turn(direction);
    cube[0][0][2].turn(direction);
    cube[0][1][2].turn(direction);
    cube[0][2][2].turn(direction);
    cube[0][2][1].turn(direction);
    cube[0][2][0].turn(direction);
    cube[0][1][0].turn(direction);
  }
  
  //This method turns the back in a similar method as described above
  void turnBack(char direction){
    print("Turing Back ");
    LinkedList<Block> list = new LinkedList<Block>();
    list.add(cube[2][0][2].clone());
    list.add(cube[2][0][1].clone());
    list.add(cube[2][0][0].clone());
    list.add(cube[2][1][0].clone());
    list.add(cube[2][2][0].clone());
    list.add(cube[2][2][1].clone());
    list.add(cube[2][2][2].clone());
    list.add(cube[2][1][2].clone());
    if(direction == 'b'){
      println("Clockwise");
      list.add(0, list.pollLast());
      list.add(0, list.pollLast());
    }else if(direction == 'B'){
      println("Counter-Clockwise");
      list.add(list.size()-1, list.pollFirst());
      list.add(list.size()-1, list.pollFirst());      
    }
    cube[2][0][2].setColors(list.get(0).getColors());
    cube[2][0][1].setColors(list.get(1).getColors());
    cube[2][0][0].setColors(list.get(2).getColors());
    cube[2][1][0].setColors(list.get(3).getColors());
    cube[2][2][0].setColors(list.get(4).getColors());
    cube[2][2][1].setColors(list.get(5).getColors());
    cube[2][2][2].setColors(list.get(6).getColors());
    cube[2][1][2].setColors(list.get(7).getColors());
    
    cube[2][0][2].turn(direction);
    cube[2][0][1].turn(direction);
    cube[2][0][0].turn(direction);
    cube[2][1][0].turn(direction);
    cube[2][2][0].turn(direction);
    cube[2][2][1].turn(direction);
    cube[2][2][2].turn(direction);
    cube[2][1][2].turn(direction);
  }
  
  //This method turns the bottom in a similar method as described above
  void turnBottom(char direction){
    print("Turing Bottom ");
    LinkedList<Block> list = new LinkedList<Block>();
    list.add(cube[0][2][0].clone());
    list.add(cube[0][2][1].clone());
    list.add(cube[0][2][2].clone());
    list.add(cube[1][2][2].clone());
    list.add(cube[2][2][2].clone());
    list.add(cube[2][2][1].clone());
    list.add(cube[2][2][0].clone());
    list.add(cube[1][2][0].clone());
    if(direction == 'd'){
      println("Clockwise");
      list.add(0, list.pollLast());
      list.add(0, list.pollLast());
    }else if(direction == 'D'){
      println("Counter-Clockwise");
      list.add(list.size()-1, list.pollFirst());
      list.add(list.size()-1, list.pollFirst());      
    }
    cube[0][2][0].setColors(list.get(0).getColors());
    cube[0][2][1].setColors(list.get(1).getColors());
    cube[0][2][2].setColors(list.get(2).getColors());
    cube[1][2][2].setColors(list.get(3).getColors());
    cube[2][2][2].setColors(list.get(4).getColors());
    cube[2][2][1].setColors(list.get(5).getColors());
    cube[2][2][0].setColors(list.get(6).getColors());
    cube[1][2][0].setColors(list.get(7).getColors());
    
    cube[0][2][0].turn(direction);
    cube[0][2][1].turn(direction);
    cube[0][2][2].turn(direction);
    cube[1][2][2].turn(direction);
    cube[2][2][2].turn(direction);
    cube[2][2][1].turn(direction);
    cube[2][2][0].turn(direction);
    cube[1][2][0].turn(direction);
  }
  
  //This method turns the left in a similar method as described above
  void turnLeft(char direction) {
    print("Turing Left ");
    LinkedList<Block> list = new LinkedList<Block>();
    list.add(cube[2][0][0].clone());
    list.add(cube[1][0][0].clone());
    list.add(cube[0][0][0].clone());
    list.add(cube[0][1][0].clone());
    list.add(cube[0][2][0].clone());
    list.add(cube[1][2][0].clone());
    list.add(cube[2][2][0].clone());
    list.add(cube[2][1][0].clone());
    if(direction == 'l'){
      println("Clockwise");
      list.add(0, list.pollLast());
      list.add(0, list.pollLast());
    }else if(direction == 'L'){
      println("Counter-Clockwise");
      list.add(list.size()-1, list.pollFirst());
      list.add(list.size()-1, list.pollFirst());      
    }
    cube[2][0][0].setColors(list.get(0).getColors());
    cube[1][0][0].setColors(list.get(1).getColors());
    cube[0][0][0].setColors(list.get(2).getColors());
    cube[0][1][0].setColors(list.get(3).getColors());
    cube[0][2][0].setColors(list.get(4).getColors());
    cube[1][2][0].setColors(list.get(5).getColors());
    cube[2][2][0].setColors(list.get(6).getColors());
    cube[2][1][0].setColors(list.get(7).getColors());
    
    cube[2][0][0].turn(direction);
    cube[1][0][0].turn(direction);
    cube[0][0][0].turn(direction);
    cube[0][1][0].turn(direction);
    cube[0][2][0].turn(direction);
    cube[1][2][0].turn(direction);
    cube[2][2][0].turn(direction);
    cube[2][1][0].turn(direction);
  }
  
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
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 2; k == 2; k++) {
          cube[i][j][k].display();
        }
      }
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
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k == 0; k++) {
          cube[i][j][k].display();
        }
      }
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
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j == 0; j++) {
        for (int k = 0; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
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
    for (int i = 0; i < 3; i++) {
      for (int j = 2; j == 2; j++) {
        for (int k = 0; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
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
    for (int i = 0; i == 0; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
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
    for (int i = 2; i == 2; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          cube[i][j][k].display();
        }
      }
    }
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
