//Used to keep track of the faces on the Polygon
int childCount;

//Stores the 3D model of the Dog
PShape doggo;
//An array that stores the individual faces of the dog 3D model
PShape[] children;



void setup(){
  
  //Determines the size of the viewport
  //P3D allows for manipulating the z-axis
  size(1000,1000, P3D);
  //Make it a RGB color mode
  colorMode(RGB, 359,99,99);
  
  //Load the obj file, stored in data folder
  doggo = loadShape("doggo.obj");
  //stores children, sub-shapes, in an array
  children = doggo.getChildren();
  //returns the size of the array
  childCount = children.length;
  println("childCount", childCount);
 
  //scales the size of the doggo
  doggo.scale(4,4,4);

}

void draw(){
  //White background
  background(0xffffffff);
  //lighting for 3D object
  lights();
  //camera object determines how you see your viewport
  //determines the axis of origin for the objects that you choose to display
  camera(0,0,height*1.2, 0,0,0,0,-0.5,0);
  //Rotates the dog around the y axis
  doggo.rotateY(.01);
  //new bug
  //doggo.rotateZ(-.01);
  rotateZ(-.01);
  
  //
   for(int i=0; i<childCount; i++){
     
     //Set random values for RGB, changes every frame
     children[i].setFill(color(random(0,255),random(0,50),random(0,255),255));
     
     //Display shape of altered polygons
     shape(children[i]);
   }
 

    
 
  }
  
