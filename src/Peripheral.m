//
//  Periferal.m
//  example_basic
//
//  Created by 加藤 哲朗 on 5/3/14.
//
//

#import "Peripheral.h"
#import "MBCBeaconAdvertisementData.h"

@implementation Peripheral

@synthesize manager;

-(id)init
{
    if (self == [super init]) {
        // CBPeripheralManagerを初期化
        self.manager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                               queue:nil];
    }
}

-(id)initWithProximityUUID:(NSUUID *)_proximityUUID major:(uint16_t)_major minor:(uint16_t)_minor measuredPower:(int8_t)_power
{
    [self init];
    self->proximityUUID = _proximityUUID;
    self->major = _major;
    self->minor = _minor;
    self->power = _power;
    
    self->ready = NO;

    return self;
}

-(void)dealloc
{
    [super dealloc];
    
    // managerの解放をする?
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    // Bluetoothがオンのときにアドバタイズする
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
//        // アドバタイズ用のデータを作成
//        MBCBeaconAdvertisementData *beaconData
//        = [[MBCBeaconAdvertisementData alloc] initWithProximityUUID:proximityUUID
//                                                              major:major
//                                                              minor:minor
//                                                      measuredPower:power];
//        
//        // アドバタイズ開始
//        NSLog( peripheral == manager ? @"おなじ" : @"ちがう");
//        [manager startAdvertising:beaconData.beaconAdvertisement];
        ready = YES;
    }
}

- (void)startAdvertise
{
    if (ready) {
        // アドバタイズ用のデータを作成
        MBCBeaconAdvertisementData *beaconData
        = [[MBCBeaconAdvertisementData alloc] initWithProximityUUID:proximityUUID
                                                              major:major
                                                              minor:minor
                                                      measuredPower:power];
        
        // アドバタイズ開始
        [manager startAdvertising:beaconData.beaconAdvertisement];
    }
}

- (void)stopAdvertise
{
    [manager stopAdvertising];
}
@end
