//
//  NetworkStatusManager.m
//  TryVIPER
//
//  Created by Arash on 16/6/3.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "NetworkStatusManager.h"


@implementation NetworkStatusManager


+ (instancetype)sharedManager {
    
    static NetworkStatusManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        // To detect the network connection status, at first call the single instance of the startMonitoring method to open the monitor
        [manager startMonitoring];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
            switch (status) {
                case AFNetworkReachabilityStatusUnknown: {
                    // Not recognized
                    NSLog(@"%@",@"Not recognized");
                    self.networkStatus = AFNetworkReachabilityStatusUnknown;
                    break;
                }
                case AFNetworkReachabilityStatusNotReachable: {
                    // not connected
                    NSLog(@"%@",@"not connected");
                    self.networkStatus = AFNetworkReachabilityStatusNotReachable;
                    break;
                }
                case AFNetworkReachabilityStatusReachableViaWWAN: {
                    // 3G
                    NSLog(@"%@",@"3G");
                    self.networkStatus = AFNetworkReachabilityStatusReachableViaWWAN;
                    break;
                }
                case AFNetworkReachabilityStatusReachableViaWiFi: {
                    // WiFi
                    NSLog(@"%@",@"WiFi");
                    self.networkStatus = AFNetworkReachabilityStatusReachableViaWiFi;
                    break;
                }
                default: {
                    break;
                }
            }
        }];
    }
    return self;
}

@end
