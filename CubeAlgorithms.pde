import java.util.LinkedList;
import java.util.Arrays;

class CubeAlgorithms {

  //White Cross Algorithms
  //------------------------------------------------------------------------------------------------------------

  LinkedList<Character> TLtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('l');
    rval.add('f');
    return rval;
  }

  LinkedList<Character> TBtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('u');
    rval.add('R');
    rval.add('U');
    rval.add('F');
    return rval;
  }

  LinkedList<Character> TRtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('R');
    rval.add('F');
    return rval;
  }

  LinkedList<Character> FLtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('f');
    return rval;
  }

  LinkedList<Character> BLtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('l');
    rval.add('l');
    rval.add('f');
    rval.add('l');
    rval.add('l');
    return rval;
  }

  LinkedList<Character> BRtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('r');
    rval.add('F');
    rval.add('r');
    rval.add('r');
    return rval;
  }

  LinkedList<Character> FRtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('F');
    return rval;
  }

  LinkedList<Character> DFtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('F');
    rval.add('F');
    return rval;
  }

  LinkedList<Character> DLtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('d');
    rval.add('F');
    rval.add('F');
    return rval;
  }

  LinkedList<Character> DBtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('D');
    rval.add('D');
    rval.add('F');
    rval.add('F');
    return rval;
  }

  LinkedList<Character> DRtoTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('D');
    rval.add('F');
    rval.add('F');
    return rval;
  }

  LinkedList<Character> orientTF() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('F');
    rval.add('u');
    rval.add('L');
    rval.add('U');
    return rval;
  }

  //Algorithms for Solving F2L
  //--------------------------------------------------------------------------------------------------- 42 different states for the corner and side edge to be in (including solved position)

  //Corner correct, Edge not placed

  LinkedList<Character> cornerCorrectOrientEdge() { //1
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('U');
    rval.add('R');
    //Dw
    rval.add('d');
    rval.add('e');
    rval.add('R');
    rval.add('u');
    rval.add('u');
    rval.add('r');
    rval.add('U');
    rval.add('U');
    rval.add('R');
    rval.add('u');
    rval.add('r');

    rval.add('y');
    return rval;
  }

  LinkedList<Character> cornerCorrectEdgeTF() { //2
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('u');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    //Dw'
    rval.add('D');
    rval.add('E');
    rval.add('L');
    rval.add('u');
    rval.add('l');

    rval.add('Y');
    return rval;
  }

  LinkedList<Character> cornerCorrectEdgeTR() { //3
    LinkedList<Character> rval = new LinkedList<Character>();
    //Dw'
    rval.add('D');
    rval.add('E');
    rval.add('L');
    rval.add('u');
    rval.add('l');
    //Dw
    rval.add('d');
    rval.add('e');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    return rval;
  }

  //Corner in the first layer twisted clockwise

  LinkedList<Character> cornerCWCorrectEdge() { //7
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('R');
    rval.add('R');
    rval.add('u');
    rval.add('u');
    rval.add('R');
    rval.add('U');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    rval.add('u');
    rval.add('u');
    rval.add('R');
    return rval;
  }

  LinkedList<Character> cornerCWOrientEdge() { //8
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('U');
    rval.add('r');
    rval.add('u');
    rval.add('y');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    rval.add('f');
    rval.add('f');

    rval.add('Y');
    return rval;
  }

  LinkedList<Character> cornerCWEdgeTF() { //9
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('u');
    rval.add('u');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    rval.add('y');
    rval.add('L');
    rval.add('U');
    rval.add('l');

    rval.add('Y');
    return rval;
  }

  LinkedList<Character> cornerCWEdgeTR() { //10
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('U');
    rval.add('R');
    rval.add('u');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    return rval;
  }

  //corner in the first layer twisted counter-clockwise

  LinkedList<Character> cornerCCWCorrectEdge() { //11
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('U');
    rval.add('U');
    rval.add('r');
    rval.add('u');
    rval.add('R');
    rval.add('u');
    rval.add('r');
    rval.add('U');
    rval.add('U');
    rval.add('R');
    rval.add('R');
    return rval;
  }

  LinkedList<Character> cornerCCWOrientEdge() { //12
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('U');
    rval.add('R');
    rval.add('F');
    rval.add('L');
    rval.add('u');
    rval.add('u');
    rval.add('l');
    rval.add('f');
    return rval;
  }

  LinkedList<Character> cornerCCWEdgeTF() { //13
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('u');
    rval.add('u');
    rval.add('R');
    rval.add('Y');
    rval.add('R');
    rval.add('u');
    rval.add('u');
    rval.add('r');

    rval.add('y');
    return rval;
  }

  LinkedList<Character> cornerCCWEdgeTR() { //14
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('u');
    rval.add('R');
    rval.add('U');
    rval.add('r');
    rval.add('u');
    rval.add('R');
    return rval;
  }

  //Edge correctly positioned and oriented, corner in top right corner

  LinkedList<Character> edgeCorrectWhiteUp() { //4
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('u');
    rval.add('R');
    rval.add('U');
    rval.add('r');
    rval.add('u');
    rval.add('R');
    rval.add('U');
    rval.add('r');
    rval.add('u');
    rval.add('R');
    return rval;
  }

  LinkedList<Character> edgeCorrectWhiteFront() { //5
    LinkedList<Character> rval = new LinkedList<Character>();
    //Dw
    rval.add('d');
    rval.add('e');
    rval.add('R');
    rval.add('u');
    rval.add('r');
    rval.add('u');
    rval.add('u');
    rval.add('R');
    rval.add('u');
    rval.add('r');

    rval.add('y');
    return rval;
  }

  LinkedList<Character> edgeCorrectWhiteRight() { //5
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('U');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    rval.add('u');
    rval.add('u');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    return rval;
  }

  //Corner in top layer, white facing up

  LinkedList<Character> whiteFacingUpOrientEdge() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('U');
    rval.add('R');
    //Dw
    rval.add('d');
    rval.add('e');
    rval.add('R');
    rval.add('u');
    rval.add('r');

    rval.add('y');
    return rval;
  }

  LinkedList<Character> whiteFacingUpEdgeTFRightColorUp() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('Y');
    rval.add('R');
    rval.add('u');
    rval.add('u');
    rval.add('r');
    rval.add('u');
    rval.add('R');
    rval.add('U');
    rval.add('r');

    rval.add('y');
    return rval;
  }

  LinkedList<Character> whiteFacingUpEdgeTFFrontColorUp() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('u');
    rval.add('u');
    rval.add('r');
    rval.add('r');
    rval.add('U');
    rval.add('U');
    rval.add('R');
    rval.add('U');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    rval.add('R');
    return rval;
  }

  LinkedList<Character> whiteFacingUpEdgeTLRightColorUp() {
    LinkedList<Character> rval = new LinkedList<Character>();
    //Dw'
    rval.add('D');
    rval.add('E');
    rval.add('L');
    rval.add('u');
    rval.add('u');
    rval.add('l');
    rval.add('U');
    rval.add('L');
    rval.add('u');
    rval.add('l');

    rval.add('Y');
    return rval;
  }

  LinkedList<Character> whiteFacingUpEdgeTLFrontColorUp() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('u');
    rval.add('u');
    rval.add('r');
    rval.add('u');
    rval.add('R');
    rval.add('u');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    return rval;
  }

  LinkedList<Character> whiteFacingUpEdgeTRRightColorUp() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('Y');
    rval.add('u');
    rval.add('u');
    rval.add('R');
    rval.add('R');
    rval.add('u');
    rval.add('u');
    rval.add('r');
    rval.add('u');
    rval.add('R');
    rval.add('u');
    rval.add('r');
    rval.add('r');

    rval.add('y');
    return rval;
  }

  LinkedList<Character> whiteFacingUpEdgeTRFrontColorUp() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('u');
    rval.add('u');
    rval.add('R');
    rval.add('U');
    rval.add('r');
    rval.add('u');
    rval.add('R');
    return rval;
  }

  LinkedList<Character> whiteFacingUpEdgeTBRightColorUp() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('F');
    rval.add('L');
    rval.add('u');
    rval.add('u');
    rval.add('l');
    rval.add('f');
    return rval;
  }

  LinkedList<Character> whiteFacingUpEdgeTBFrontColorUp() {
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('u');
    rval.add('r');
    rval.add('U');
    rval.add('U');
    rval.add('R');
    rval.add('u');
    rval.add('r');
    rval.add('U');
    rval.add('R');
    return rval;
  }


  //Corner is top layer, white facing right

  LinkedList<Character> whiteFacingRightOrientEdge() {
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'U', 'r', 'D', 'E', 'r', 'u', 'R'));
  }

  LinkedList<Character> whiteFacingRightEdgeTFRightColorUp() {
    return new LinkedList<Character>(Arrays.asList('D', 'E', 'L', 'u', 'l', 'Y'));
  }

  LinkedList<Character> whiteFacingRightEdgeTFFrontColorUp() {
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'u', 'u', 'r', 'D', 'E', 'r', 'u', 'R'));
  }

  LinkedList<Character> whiteFacingRightEdgeTLRightColorUp() {
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'U', 'r', 'U', 'U', 'R', 'u', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingRightEdgeTLFrontColorUp() {
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'u', 'r', 'D', 'E', 'r', 'u', 'R'));
  }

  LinkedList<Character> whiteFacingRightEdgeTRRightColorUp() {
    return new LinkedList<Character>(Arrays.asList('r', 'U', 'R', 'u', 'u', 'Y', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingRightEdgeTRFrontColorUp() {
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'U', 'R', 'u', 'r', 'u', 'R'));
  }

  LinkedList<Character> whiteFacingRightEdgeTBRightColorUp() {
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'u', 'u', 'r', 'U', 'U', 'R', 'u', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingRightEdgeTBFrontColorUp() {
    return new LinkedList<Character>(Arrays.asList('r', 'u', 'R'));
  }

  // Corner in top layer, white facing front

  LinkedList<Character> whiteFacingFrontOrientEdge() {
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'u', 'R', 'd', 'e', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTFRightColorUp() {
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'u', 'r', 'U', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTFFrontColorUp() {
    return new LinkedList<Character>(Arrays.asList('l', 'm', 'u', 'l', 'F', 'L', 'U', 'L', 'M'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTLRightColorUp() {
    return new LinkedList<Character>(Arrays.asList('Y', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTLFrontColorUp() {
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'U', 'U', 'R', 'u', 'u', 'r', 'U', 'R'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTRRightColorUp() {
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'U', 'U', 'R', 'd', 'e', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTRFrontColorUp() {
    return new LinkedList<Character>(Arrays.asList('u', 'r', 'U', 'R'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTBRightColorUp() {
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'U', 'R', 'd', 'e', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTBFrontColorUp() {
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'u', 'R', 'u', 'u', 'r', 'U', 'R'));
  }
}
