import java.util.LinkedList;

class CubeAlgorithms {
  
  //White Cross Algorithms
  //------------------------------------------------------------------------------------------------------------
  
  LinkedList<Character> TLtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('l');
    rval.add('f');
    return rval;
  }
  
  LinkedList<Character> TBtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('u');
    rval.add('R');
    rval.add('U');
    rval.add('F');
    return rval;
  }
  
  LinkedList<Character> TRtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('R');
    rval.add('F');
    return rval;
  }
  
  LinkedList<Character> FLtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('f');
    return rval;
  }
  
  LinkedList<Character> BLtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('l');
    rval.add('l');
    rval.add('f');
    rval.add('l');
    rval.add('l');
    return rval;
  }
  
  LinkedList<Character> BRtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('r');
    rval.add('r');
    rval.add('F');
    rval.add('r');
    rval.add('r');
    return rval;
  }
  
  LinkedList<Character> FRtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('F');
    return rval;
  }
  
  LinkedList<Character> DFtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('F');
    rval.add('F');
    return rval;
  }
  
  LinkedList<Character> DLtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('d');
    rval.add('F');
    rval.add('F');
    return rval;
  }
  
  LinkedList<Character> DBtoTF(){
    LinkedList<Character> rval = new LinkedList<Character>();
    rval.add('D');
    rval.add('D');
    rval.add('F');
    rval.add('F');
    return rval;
  }
  
  LinkedList<Character> DRtoTF(){
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
  
  
  
  
  
  
  
  
  
  
}
