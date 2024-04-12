// Código do sensor DHT11

#include "DHT.h" // Inclui a biblioteca DHT.h para interagir com o sensor DHT

#define dht_type DHT11 // Define o tipo de sensor DHT como DHT11

int dht_pin = A0; // Define o pino ao qual o sensor está conectado como A0

DHT dht_1 = DHT(dht_pin, dht_type); // Cria um objeto DHT chamado dht_1 associado ao pino e tipo definidos acima

void setup() {
  Serial.begin(9600); // Inicializa a comunicação serial com a velocidade de 9600 bauds
  dht_1.begin(); // Inicializa o sensor DHT
}

void loop() {
  float umidade = dht_1.readHumidity(); // Lê a umidade do sensor DHT e armazena em uma variável
  float temperatura = dht_1.readTemperature(); // Lê a temperatura do sensor DHT e armazena em uma variável

    Serial.println(" "); // Imprime uma linha vazia para separar os valores de umidade e temperatura
    Serial.print(umidade); // Imprime a umidade lida pelo sensor DHT
    Serial.print(" % "); // Imprime o símbolo de porcentagem após o valor da umidade
    Serial.print(temperatura); // Imprime a temperatura lida pelo sensor DHT
    Serial.println(" ºC"); // Imprime o símbolo de grau Celsius após o valor da temperatura
    delay(1000); // Aguarda 1 segundo antes de ler novamente os valores do sensor DHT
}
