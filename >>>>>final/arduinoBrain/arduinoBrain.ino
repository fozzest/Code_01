// how the brain information is passed from the MindFlex to Processing
//most code is referenced from link below:
//  https://github.com/kitschpatrol/Arduino-Brain-Library
//serial information brought over serial.list [3]


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
