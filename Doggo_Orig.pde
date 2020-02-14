int childCount;

PShape doggo;
PShape[] children;
PShape[] childrenOrig;


void setup(){
  
  size(1000,1000, P3D);
  colorMode(RGB, 359,99,99);
  
  doggo = loadShape("doggo.obj");
  children = doggo.getChildren();
  childCount = children.length;
  println("childCount", childCount);
  
  println(childCount);
  
  childrenOrig = children;
  
  doggo.scale(4,4,4);



}

void draw(){
  
  background(0xffffffff);
  lights();
  camera(0,0,height*1.2, 0,0,0,0,-0.5,0);
  doggo.rotateY(.01);
  //new bug
  //doggo.rotateZ(-.01);
  rotateZ(-.01);
  
   for(int i=0; i<childCount; i++){
   children[i].setFill(color(i/float(childCount)*360,99,99,255));
   }
 
  
   for(int i=0; i<childCount; i++){
    
   
        
            float n = i/float(childCount);
        
            //children[i].translate(0.5*sin(i)*n, 0.5*cos(i)*n, 0.5*sin(i)*n);
            
            
            
            shape(children[i]);
            
           
  
      
      println("First loop exited");
 
    }
    
    
    
    
  
  }
  
