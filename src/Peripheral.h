//
//  Periferal.h
//  example_basic
//
//  Created by 加藤 哲朗 on 5/3/14.
//
//

#import <Foundation/Foundation.h>
#import <IOBluetooth/IOBluetooth.h>

@interface Peripheral : NSObject<CBPeripheralManagerDelegate> {
    CBPeripheralManager *manager;
    NSUUID *proximityUUID;
    uint16_t major, minor;
    int8_t power;
    BOOL ready;
}

@property (strong, nonatomic) CBPeripheralManager *manager;

- (id)initWithProximityUUID:(NSUUID *)_proximityUUID
                      major:(uint16_t)_major
                      minor:(uint16_t)_minor
              measuredPower:(int8_t)_power;
- (void) startAdvertise;
- (void) stopAdvertise;

@end
