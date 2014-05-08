//
//  ofxOsxBeaconPeripheral.h
//  example_basic
//
//  Created by 加藤 哲朗 on 4/30/14.
//
//

#ifndef __example_basic__ofxOsxBeaconPeripheral__
#define __example_basic__ofxOsxBeaconPeripheral__

#include "ofMain.h"

#ifdef __OBJC__
#include "Peripheral.h"
#endif

class ofxOsxBeaconPeripheral {
    
public:
    ofxOsxBeaconPeripheral();
    void setup(string uuid, int major, int minor, int power=-58);
    void startAdvertise();
    void stopAdvertise();
    
private:
    
#ifdef __OBJC__
    Peripheral *peripheral;
#else
    void *peripheral;
#endif
};

#endif /* defined(__example_basic__ofxOsxBeaconPeripheral__) */
