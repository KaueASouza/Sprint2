#include "DHT.h"

#define dht_type DHT11

int dht_pin = A1;

DHT dht_1 = DHT(dht_pin, dht_type);

void setup() {
  Serial.begin(9600);
  dht_1.begin();
}

void loop() {
  float umidade = dht_1.readHumidity();
  float temperatura = dht_1.readTemperature();
    
  Serial.print(umidade);
  Serial.print(";");
  Serial.println(temperatura);
    
  delay(1000);
}
