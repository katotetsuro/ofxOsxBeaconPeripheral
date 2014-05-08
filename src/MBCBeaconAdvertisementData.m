//
//  MBCBeaconAdvertisementData.m
//  MacBeacon
//
//  Created by 加藤 哲朗 on 2013/12/24.
//  Copyright (c) 2013年 加藤 哲朗. All rights reserved.
//

#import "MBCBeaconAdvertisementData.h"

@implementation MBCBeaconAdvertisementData

@synthesize proximityUUID;
@synthesize major;
@synthesize minor;
@synthesize measuredPower;

- (id)initWithProximityUUID:(NSUUID *)_proximityUUID
                      major:(uint16_t)_major
                      minor:(uint16_t)_minor
              measuredPower:(int8_t)_power {
    self = [super init];
    
    if (self) {
        self.proximityUUID = _proximityUUID;
        self.major = _major;
        self.minor = _minor;
        self.measuredPower = _power;
    }
    
    return self;
}


- (NSDictionary *)beaconAdvertisement {
    NSString *beaconKey = @"kCBAdvDataAppleBeaconKey";
    
    unsigned char advertisementBytes[21] = {0};
    
    [self.proximityUUID getUUIDBytes:(unsigned char *)&advertisementBytes];
    
    advertisementBytes[16] = (unsigned char)(self.major >> 8);
    advertisementBytes[17] = (unsigned char)(self.major & 255);
    
    advertisementBytes[18] = (unsigned char)(self.minor >> 8);
    advertisementBytes[19] = (unsigned char)(self.minor & 255);
    
    advertisementBytes[20] = self.measuredPower;
    
    NSMutableData *advertisement = [NSMutableData dataWithBytes:advertisementBytes length:21];
    
    return [NSDictionary dictionaryWithObject:advertisement forKey:beaconKey];
}
@end
