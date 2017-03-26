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
        // To detect the network connection status, you must first call the single instance of the startMonitoring method to open the monitor
        [manager startMonitoring];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
            switch (status) {
                case AFNetworkReachabilityStatusUnknown: {
                    // Not recognized
                    NSLog(@"%@",@"Not recognized");
                    _networkStatus = AFNetworkReachabilityStatusUnknown;
                    break;
                }
                case AFNetworkReachabilityStatusNotReachable: {
                    // not connected
                    NSLog(@"%@",@"not connected");
                    _networkStatus = AFNetworkReachabilityStatusNotReachable;
                    break;
                }
                case AFNetworkReachabilityStatusReachableViaWWAN: {
                    // 3G
                    NSLog(@"%@",@"3G");
                    _networkStatus = AFNetworkReachabilityStatusReachableViaWWAN;
                    break;
                }
                case AFNetworkReachabilityStatusReachableViaWiFi: {
                    // WiFi
                    NSLog(@"%@",@"WiFi");
                    _networkStatus = AFNetworkReachabilityStatusReachableViaWiFi;
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
