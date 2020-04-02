
const int pushButton = 53;
const int PulsePin = 2;
int analogPin = A3;

unsigned int c_time = 0;
unsigned int p_time = 0;

float interval = 1;

bool buttonState = 0;
double read_voltage =5;

double pulse_time = 0;



void setup() {
  Serial.begin(9600);
  pinMode(pushButton, INPUT);
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  buttonState = digitalRead(pushButton);
  c_time = millis();
  led_dim();
  read_voltage = analogRead(analogPin);
  eval_voltage(5);
  
  if (buttonState == HIGH)
  {
    analogWrite(LED_BUILTIN, 255);
    digitalWrite(PulsePin, HIGH);
    delay(pulse_time);
    digitalWrite(PulsePin, LOW);
    analogWrite(LED_BUILTIN, 0);
    buttonState = 0;
    delay(3000);
    p_time  = millis();
  }
}


void led_dim()
{
  if ((interval / 8) >= (c_time - p_time))
  {
    analogWrite(LED_BUILTIN, 0);
  }
  else if ((2 * interval / 8) >= (c_time - p_time) && (interval / 8) < (c_time - p_time) )
  {
    analogWrite(LED_BUILTIN, 63);
  }
  else if ((3 * interval / 8) >= (c_time - p_time) && (2 * interval / 8) < (c_time - p_time) )
  {
    analogWrite(LED_BUILTIN, 127);
  }
  else if ((4 * interval / 8) >= (c_time - p_time) && (3 * interval / 8) < (c_time - p_time) )
  {
    analogWrite(LED_BUILTIN, 255);
  }
  else if ((5 * interval / 8) >= (c_time - p_time) && (4 * interval / 8) < (c_time - p_time) )
  {
    analogWrite(LED_BUILTIN, 255);
  }
  else if ((6 * interval / 8) >= (c_time - p_time) && (5 * interval / 8) < (c_time - p_time) )
  {
    analogWrite(LED_BUILTIN, 127);
  }
  else if ((7 * interval / 8) >= (c_time - p_time) && (6 * interval / 8) < (c_time - p_time) )
  {
    analogWrite(LED_BUILTIN, 63);
  }
  else if ((8 * interval / 8) >= (c_time - p_time) && (7 * interval / 8) < (c_time - p_time) )
  {
    analogWrite(LED_BUILTIN, 0);
    p_time  = millis();
  }
}

void eval_voltage(double read_voltage)
{
  if (read_voltage >= 4)
  {
    interval = 2000;
    pulse_time  =  0.15;  
  }
    if ((read_voltage >= 3) &&  (read_voltage < 4))
  {
    interval = 500;
    pulse_time  =  1;  
  }
      if ((read_voltage >= 2) &&  (read_voltage < 3))
  {
    interval = 250;
    pulse_time  =  3.5;  
  }
      if ((read_voltage >= 1) &&  (read_voltage < 2))
  {
    interval = 125;
    pulse_time  =  9;  
  }
      if ((read_voltage >= 0) &&  (read_voltage < 1))
  {
    interval = 64;
    pulse_time  =  15;  
  }

 }
