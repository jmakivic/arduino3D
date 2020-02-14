import processing.serial.*;
Serial myPort;
int vertexCount;

float camDist;
float rad;

PVector[] vertices;
PVector[] exploded;
color[] palette;
int distance;

void setup() {
  size(1000, 1000, P3D);
  
  //Setting up serialport
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
  
  
  

  camDist = height * 3;
  rad = min(width, height);

  PShape caesar = loadShape("doggo.obj");
  caesar.scale(8,8,8);
  PShape tessellation = caesar.getTessellation();
  vertexCount = tessellation.getVertexCount();
  println("vertexCount", vertexCount);

  vertices = new PVector[vertexCount];
  exploded = new PVector[vertexCount];
  palette = new color[vertexCount];

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
  if(myPort.available()>0){
   distance = myPort.read();
   println(distance);
  }
  float camTheta = frameCount * .01;
  float osc = frameCount * .005;
  float step = cos(camTheta) * .5 + .5;

  background(0xffffffff);
  camera(camDist * cos(camTheta), 0, camDist * sin(camTheta),
    0, 0, 0,
    0, 1, 0);

  for (int i = 0; i < vertexCount; ++i) {
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
