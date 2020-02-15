//Save the values for each pin
const int trigPin =9;
const int echoPin = 10;


float distance;
float duration;
int dist;

void setup() {
  // put your setup code here, to run once:
  //Determine use of pins as INPUT or OUTPUT
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  //High baudrate for serial communication
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
  
  //Serial.println(dist);
  
  Serial.write(dist);
  
  //delay(100);
}
