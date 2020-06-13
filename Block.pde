//A block object for the cube
class Block {
  PVector pos; //position of the block on the screen
  int size; //size of the block

  /*
   * index 0 - top
   * index 1 - bottom
   * index 2 - front
   * index 3 - back
   * index 4 - left
   * index 5 - right
   */
  color[] colors;

  Block(PVector pos, int size, color[] colors) {
    this.pos = pos;
    this.size = size;
    this.colors = colors;
  }

  void display() {
    for (int i = 0; i < colors.length; i++) { //draws each face of the block with the color array
      drawFace(i);
    }
  }


  void display(String text) {
    for (int i = 0; i < colors.length; i++) { //draws each face of the block with the color array
      drawFace(i);
    }
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    text(text, 0, 0);
    popMatrix();
  }

  /**
   * This method draws the different faces of the blocks
   * @param the color of face being drawn
   */
  void drawFace(int face) {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    //noFill();
    stroke(10);
    fill(colors[face]);
    switch(face) {
    case 0:
      //top
      beginShape();
      vertex(0, 0, 0); 
      vertex(size, 0, 0);
      vertex(size, 0, size);
      vertex(0, 0, size);
      endShape(CLOSE);
      break;
    case 1: 
      //bottom
      beginShape();
      vertex(0, size, 0); 
      vertex(size, size, 0);
      vertex(size, size, size);
      vertex(0, size, size);
      endShape(CLOSE);
      break;
    case 2:
      //front
      beginShape();
      vertex(0, 0, size);
      vertex(0, size, size);
      vertex(size, size, size);
      vertex(size, 0, size);
      endShape(CLOSE);
      break;
    case 3:
      //back
      beginShape();
      vertex(0, 0, 0);
      vertex(0, size, 0);
      vertex(size, size, 0);
      vertex(size, 0, 0);
      endShape(CLOSE);
      break;
    case 4:
      //left
      beginShape();
      vertex(0, 0, 0);
      vertex(0, 0, size);
      vertex(0, size, size);
      vertex(0, size, 0);
      endShape(CLOSE);
      break;
    case 5:
      //right 
      beginShape();
      vertex(size, 0, 0);
      vertex(size, 0, size);
      vertex(size, size, size);
      vertex(size, size, 0);
      endShape(CLOSE);
      break;
    }
    popMatrix();
  }

  void setPos(PVector pos) {
    this.pos = pos;
  }

  PVector getPos() {
    return this.pos;
  }

  void setColors(color[] colors) {
    this.colors = colors;
  }

  color[] getColors() {
    return this.colors;
  }

  Block clone() {
    return new Block(this.pos, this.size, this.colors);
  }

  /**
   * This method switches the colors on the sides of the block when the block is turning
   * 
   * @param the direction that the block is turning
   */
  void turn(char direction) {
    //println(direction);
    int top = colors[0];
    int bottom = colors[1];
    int front = colors[2];
    int back = colors[3];
    int left = colors[4];
    int right = colors[5];
    switch(direction) {
    case 'u':
      colors[2] = right;
      colors[3] = left;
      colors[4] = front;
      colors[5] = back;
      break;
    case 'U':
      colors[2] = left;
      colors[3] = right;
      colors[4] = back;
      colors[5] = front;
      break;
    case 'd':
      colors[2] = left;
      colors[3] = right;
      colors[4] = back;
      colors[5] = front;
      break;
    case 'D':
      colors[2] = right;
      colors[3] = left;
      colors[4] = front;
      colors[5] = back;
      break;
    case 'f':
      colors[0] = left;
      colors[1] = right;
      colors[4] = bottom;
      colors[5] = top;
      break;
    case 'F':
      colors[0] = right;
      colors[1] = left;
      colors[4] = top;
      colors[5] = bottom;
      break;
    case 'b':
      colors[0] = right;
      colors[1] = left;
      colors[4] = top;
      colors[5] = bottom;
      break;
    case 'B':
      colors[0] = left;
      colors[1] = right;
      colors[4] = bottom;
      colors[5] = top;
      break;
    case 'l':
      colors[0] = back;
      colors[1] = front;
      colors[2] = top;
      colors[3] = bottom;
      break;
    case 'L':
      colors[0] = front;
      colors[1] = back;
      colors[2] = bottom;
      colors[3] = top;
      break;
    case 'r':
      colors[0] = front;
      colors[1] = back;
      colors[2] = bottom;
      colors[3] = top;
      break;
    case 'R': 
      colors[0] = back;
      colors[1] = front;
      colors[2] = top;
      colors[3] = bottom;
      break;
    case 'm':
      println("cube turning m clockwise");
      colors[0] = back;
      colors[1] = front;
      colors[2] = top;
      colors[3] = bottom;
      break;
    case 'M':
      colors[0] = front;
      colors[1] = back;
      colors[2] = bottom;
      colors[3] = top;
      break;
    case 'e':
      colors[2] = left;
      colors[3] = right;
      colors[4] = back;
      colors[5] = front;
      break;
    case 'E':
      colors[2] = right;
      colors[3] = left;
      colors[4] = front;
      colors[5] = back;
      break;
    default:
      println("Invalid direction");
    }
  }

  void setBlock(Block newBlock) {
    this.pos = newBlock.pos;
    this.size = newBlock.size;
    this.colors = newBlock.colors;
  }

  int getTop() {
    return colors[0];
  }

  int getBottom() {
    return colors[1];
  }

  int getFront() {
    return colors[2];
  }

  int getBack() {
    return colors[3];
  }

  int getLeft() {
    return colors[4];
  }

  int getRight() {
    return colors[5];
  }


  boolean hasColor(color c) {
    for (int i = 0; i < colors.length; i++) {
      if (colors[i] == c) {
        return true;
      }
    }
    return false;
  }
}
