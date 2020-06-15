# RubiksCube
A virtual model of a 3x3 Rubik's Cube

Keys for turning the sides of cube:  
r - turn right clockwise  
l - turn left clockwise  
u - turn top clockwise  
d - turn bottom clockwise  
f - turn front clockwise  
b - turn back clockwise  
Shift + key - turn counter-clockwise  
/ - unlock free rotation  
0 - reset the cube

# Updates 
3/21/2020:   
The cube supports animated rotations for the right, left, top, bottom, front, and back sides of the cube. The default position of the cube is showing the red face as the front and showing 3 sides of the cube. Free rotation can be activated to rotate the cube with the mouse. 

5/2/2020:  
The cube now supports animated whole cube turns using the arrow keys. Although functionally the same, the cube object now keeps track of lists of the blocks on the sides of the cube that can be turned. Using these lists allows all of the turning mechanics to be done in one function that uses iteration over the side list to change the colors on the side turning. This allows for more concise code to turn the sides of the cube. 

5/26/2020:  
After the cube is created, it selects 50 random moves to randomize itself. By pressing space, the cube will start to solve itself. Currently, it only solves the white cross step. 

6/13/2020:  
The cube is now able to solve the first two layers of the rubiks using the CFOP F2L algorithms in most cases of the cube, there are some unlikely outliers not currently addressed. In addition, the method of determining the correct F2L algorithm is rather complication and will mostly likely be simplified in the future. 

6/15/2020:   
The cube now solves all the way up to through the OLL stop of the 2 look CFOP method. Several bugs still exist occasionally in the solving of the cube to be fixed later. 
