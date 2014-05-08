//
//  ofxOsxBeaconPeripheral.cpp
//  example_basic
//
//  Created by 加藤 哲朗 on 4/30/14.
//
//

#include "ofxOsxBeaconPeripheral.h"


ofxOsxBeaconPeripheral::ofxOsxBeaconPeripheral() : peripheral(NULL) {
    
}

void ofxOsxBeaconPeripheral::setup(string uuid, int major, int minor, int power) {
    if (peripheral == NULL) {
        NSString *nsuuidstr = [NSString stringWithCString:uuid.c_str() encoding:[NSString defaultCStringEncoding]];
        NSUUID *nsuuid = [[NSUUID alloc] initWithUUIDString:nsuuidstr];
        peripheral = [Peripheral alloc];
        peripheral = [[Peripheral alloc] initWithProximityUUID:nsuuid major:major minor:minor measuredPower:power];
    }
}

