//amount of vertices
int vertexCount;
//camera distance
float camDist;
//degress by which it moves
float rad;

//Vector arrays that store vector values for vertices
//array for the original values of vertices
PVector[] vertices;
//array for vertices when they explode
PVector[] exploded;
//color array stores colors for vertices
color[] palette;

void setup() {
  
  size(1000, 1000, P3D);
  //defining the camera distance
  camDist = height * 3;
  //returns minimum value
  rad = min(width, height);

  PShape caesar = loadShape("doggo.obj");
  //returns a shape determined by vertices
  PShape tessellation = caesar.getTessellation();
  //getting total amount of vertices from the shape
  vertexCount = tessellation.getVertexCount();
  println("vertexCount", vertexCount);
  
  //giving all arrays the size of vertexCount, in order to hold all of the array
  vertices = new PVector[vertexCount];
  exploded = new PVector[vertexCount];
  palette = new color[vertexCount];
  
  caesar.scale(4,4,4);

  for (int i = 0; i < vertexCount; ++i) {
    
    vertices[i] = tessellation.getVertex(i);
     
    float n = i / float(vertexCount);
    palette[i] = lerpColor(0xdfff0000, 0xdf7f00ff, n);

    float t = TWO_PI * n;
    
    exploded[i] = new PVector(cos(t) * rad,
      sin(t) * rad,
      sin(t) * cos(t) * rad);
  }
}

void draw() {
  float camTheta = frameCount * .01;
  float osc = frameCount * .005;
  float step = cos(camTheta) * .5 + .5;

  background(0xffffffff);
  //creates camera motion affect based off of the framecount
  camera(camDist * cos(camTheta), 0, camDist * sin(camTheta),
    0, 0, 0,
    0, 1, 0);

  
  for (int i = 0; i < vertexCount; ++i) {
    //
    float n = i / float(vertexCount);
    float t = TWO_PI * n;

    exploded[i].set(cos(t + osc) * rad,
      sin(t + osc) * rad,
      sin(t * osc) * cos(t + osc) * rad);
     
    PVector v = PVector.lerp(vertices[i], exploded[i], step);

    stroke(palette[i]);
    strokeWeight(lerp(20, 3, step));
    
    point(v.x, v.y, v.z);
  }
}
