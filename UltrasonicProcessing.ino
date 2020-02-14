const int trigPin =9;
const int echoPin = 10;

float distance;
float duration;
int dist;

void setup() {
  // put your setup code here, to run once:
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(2000000);
}

void loop() {
  // put your main code here, to run repeatedly:
digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  distance = (duration*.0343)/2;
  dist=(int)distance;
  
 
  
    Serial.write(dist);
  
  //delay(100);
}
