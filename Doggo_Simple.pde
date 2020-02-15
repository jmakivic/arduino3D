int childCount;

PShape doggo;
PShape[] children;



void setup(){
  
  size(1000,1000, P3D);
  colorMode(RGB, 359,99,99);
  
  doggo = loadShape("doggo.obj");
  children = doggo.getChildren();
  childCount = children.length;
  println("childCount", childCount);
 

  doggo.scale(4,4,4);
}

void draw(){
  
  background(0xffffffff);
  lights();
  camera(0,0,height*1.2, 0,0,0,0,-0.5,0);
  doggo.rotateY(.01);
  //Bug with Processing
  //suzanne.rotateZ(-.01);
  rotateZ(-0.1);
    
  for(int i=0; i<childCount; i++){
            //n relies on childCount, changes value every frame, creates dynamic quality
            float n = i/float(childCount);
            //print n for debugging purposes
            println(n);
            
            color color1 = color(255,0,125);
            color color2 = color(0,255,125);
            //lerpcolor provides gradiation between two colors
            //n determines how close the outputted color is to the first color
            children[i].setFill(lerpColor(color1,color2,n));
            
            children[i].translate(0.5*sin(i)*n, 0.5*cos(i)*n, 0.5*sin(i)*n);
            
            
            
            shape(children[i]);
            
           
  
      
      
 
    }
    
    
    
    
  
  }
  
