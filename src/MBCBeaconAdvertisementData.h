//
//  MBCBeaconAdvertisementData.h
//  MacBeacon
//
//  Created by 加藤 哲朗 on 2013/12/24.
//  Copyright (c) 2013年 加藤 哲朗. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBCBeaconAdvertisementData : NSObject {
    NSUUID *proximityUUID;
    uint16_t major, minor;
    int8_t measuredPower;
}

@property (strong,nonatomic) NSUUID *proximityUUID;
@property (assign,nonatomic) uint16_t major;
@property (assign,nonatomic) uint16_t minor;
@property (assign,nonatomic) int8_t measuredPower;

- (id)initWithProximityUUID:(NSUUID *)proximityUUID
                      major:(uint16_t)major
                      minor:(uint16_t)minor
              measuredPower:(int8_t)power;


- (NSDictionary *)beaconAdvertisement;

@end
