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

  LinkedList<Character> whiteFacingUpOrientEdge() { //15
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

  LinkedList<Character> whiteFacingUpEdgeTFRightColorUp() { //16
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

  LinkedList<Character> whiteFacingUpEdgeTFFrontColorUp() { //17
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

  LinkedList<Character> whiteFacingUpEdgeTLRightColorUp() { //18
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

  LinkedList<Character> whiteFacingUpEdgeTLFrontColorUp() { //19
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

  LinkedList<Character> whiteFacingUpEdgeTRRightColorUp() { //21
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

  LinkedList<Character> whiteFacingUpEdgeTRFrontColorUp() { //20
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

  LinkedList<Character> whiteFacingUpEdgeTBRightColorUp() { //23
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('F');
    rval.add('L');
    rval.add('u');
    rval.add('u');
    rval.add('l');
    rval.add('f');
    return rval;
  }

  LinkedList<Character> whiteFacingUpEdgeTBFrontColorUp() { //22
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

  LinkedList<Character> whiteFacingRightOrientEdge() { //24
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'U', 'r', 'D', 'E', 'r', 'u', 'R'));
  }

  LinkedList<Character> whiteFacingRightEdgeTFRightColorUp() { //25
    return new LinkedList<Character>(Arrays.asList('D', 'E', 'L', 'u', 'l', 'Y'));
  }

  LinkedList<Character> whiteFacingRightEdgeTFFrontColorUp() { //26
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'u', 'u', 'r', 'D', 'E', 'r', 'u', 'R'));
  }

  LinkedList<Character> whiteFacingRightEdgeTLRightColorUp() { //27
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'U', 'r', 'U', 'U', 'R', 'u', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingRightEdgeTLFrontColorUp() { //28
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'u', 'r', 'D', 'E', 'r', 'u', 'R'));
  }

  LinkedList<Character> whiteFacingRightEdgeTRRightColorUp() { //30
    return new LinkedList<Character>(Arrays.asList('r', 'U', 'R', 'u', 'u', 'Y', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingRightEdgeTRFrontColorUp() { //29
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'U', 'R', 'u', 'r', 'u', 'R'));
  }

  LinkedList<Character> whiteFacingRightEdgeTBRightColorUp() { //32
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'u', 'u', 'r', 'U', 'U', 'R', 'u', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingRightEdgeTBFrontColorUp() { //31
    return new LinkedList<Character>(Arrays.asList('r', 'u', 'R'));
  }

  // Corner in top layer, white facing front

  LinkedList<Character> whiteFacingFrontOrientEdge() { //33
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'u', 'R', 'd', 'e', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTFRightColorUp() { //34
    return new LinkedList<Character>(Arrays.asList('d', 'e', 'R', 'u', 'r', 'U', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTFFrontColorUp() { //35
    return new LinkedList<Character>(Arrays.asList('l', 'm', 'u', 'l', 'F', 'L', 'U', 'L', 'M'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTLRightColorUp() { //36
    return new LinkedList<Character>(Arrays.asList('Y', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTLFrontColorUp() { //37
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'U', 'U', 'R', 'u', 'u', 'r', 'U', 'R'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTRRightColorUp() { //39
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'U', 'U', 'R', 'd', 'e', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTRFrontColorUp() { //38
    return new LinkedList<Character>(Arrays.asList('u', 'r', 'U', 'R'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTBRightColorUp() { //41
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'U', 'R', 'd', 'e', 'R', 'U', 'r', 'y'));
  }

  LinkedList<Character> whiteFacingFrontEdgeTBFrontColorUp() { //40
    return new LinkedList<Character>(Arrays.asList('U', 'r', 'u', 'R', 'u', 'u', 'r', 'U', 'R'));
  }
  
  //Algorithms for orienting bottom edges (2 look CFOP OLL)
  //---------------------------------------------------------------------------------------------------
  
  LinkedList<Character> orientEdgesBar() {
    return new LinkedList<Character>(Arrays.asList('f', 'r', 'u', 'R', 'U', 'F'));
  }
  
  LinkedList<Character> orientEdgesL() {
    return new LinkedList<Character>(Arrays.asList('f', 's', 'r', 'u', 'R', 'U', 'F', 'S'));
  }
  
  LinkedList<Character> orientEdgesAll() {
    return new LinkedList<Character>(Arrays.asList('f', 'r', 'u', 'R', 'U', 'F', 'f', 's', 'r', 'u', 'R', 'U', 'F', 'S'));
  }
  
  //Algorithms for orienting bottom corners (2 look CFOP OLL)
  //---------------------------------------------------------------------------------------------------
  
  LinkedList<Character> orientCornersHeadlights() {
    return new LinkedList<Character>(Arrays.asList('r', 'r', 'd', 'R', 'u', 'u', 'r', 'D', 'R', 'u', 'u', 'R'));
  }
  
  LinkedList<Character> orientCornersT() {
    return new LinkedList<Character>(Arrays.asList('L', 'M', 'U', 'l', 'u', 'r', 'U', 'R', 'm', 'f'));
  }
  
  LinkedList<Character> orientCornersBowtie() {
    return new LinkedList<Character>(Arrays.asList('R', 'f', 'r', 'B', 'R', 'F', 'r', 'b'));
  }
  
  LinkedList<Character> orientCornersSune() {
    return new LinkedList<Character>(Arrays.asList('r', 'u', 'R', 'u', 'r', 'u', 'u', 'R'));
  }
  
  LinkedList<Character> orientCornersAntisune() {
    return new LinkedList<Character>(Arrays.asList('r', 'u', 'u', 'R', 'U', 'r', 'U', 'R'));
  }
  
  LinkedList<Character> orientCornersPi() {
    return new LinkedList<Character>(Arrays.asList('r', 'U', 'U', 'r', 'r', 'U', 'r', 'r', 'U', 'r', 'r', 'U', 'U', 'r'));
  }
  
  LinkedList<Character> orientCornersH() {
    return new LinkedList<Character>(Arrays.asList('r', 'u', 'u', 'R', 'U', 'r', 'u', 'R', 'U', 'r', 'U', 'R'));
  }
  
  LinkedList<Character> permutateEdgesUPerm() {
    return new LinkedList<Character>(Arrays.asList('r', 'U', 'r', 'u', 'r', 'u', 'r', 'U', 'R', 'U', 'r', 'r'));
  }
  
  LinkedList<Character> permutateEdgesInverseUPerm() {
    return new LinkedList<Character>(Arrays.asList('r', 'r', 'u', 'r', 'u', 'R', 'U', 'R', 'U', 'R', 'u', 'R'));
  }
  
  LinkedList<Character> permutateEdgesHPerm() {
    return new LinkedList<Character>(Arrays.asList('M', 'M', 'u', 'M', 'M', 'u', 'u', 'M', 'M', 'u', 'M', 'M'));
  }
  
  LinkedList<Character> permutateEdgesZPerm() {
    return new LinkedList<Character>(Arrays.asList('M', 'M', 'u', 'M', 'M', 'u', 'M', 'u', 'u', 'M', 'M', 'u', 'u', 'M', 'u', 'u'));
  }
  
  LinkedList<Character> permutateCornersAcross() {
    return new LinkedList<Character>(Arrays.asList('X', 'r', 'U', 'R', 'd', 'r', 'u', 'R', 'D', 'r', 'u', 'R', 'd', 'r', 'U', 'R', 'D', 'x'));
  }
  
  LinkedList<Character> permutateCornersCycle() {
    return new LinkedList<Character>(Arrays.asList('x', 'R', 'u', 'R', 'd', 'd', 'r', 'U', 'R', 'd', 'd', 'r', 'r', 'X'));
  }
  
  LinkedList<Character> permutateCornersReverseCycle() {
    return new LinkedList<Character>(Arrays.asList('x', 'r', 'r', 'd', 'd', 'r', 'u', 'R', 'd', 'd', 'r', 'U', 'r', 'X'));
  }
}
