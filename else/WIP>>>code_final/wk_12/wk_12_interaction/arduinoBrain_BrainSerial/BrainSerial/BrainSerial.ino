
//  https://github.com/kitschpatrol/Arduino-Brain-Library


#include <Brain.h>


Brain brain(Serial);

void setup() {
    
    Serial.begin(9600);
}

void loop() {
    
    // "signal strength, attention, meditation, delta, theta, low alpha, high alpha, low beta, high beta, low gamma, high gamma"
    if (brain.update()) {
        Serial.println(brain.readErrors());
        Serial.println(brain.readCSV());
    }
}
