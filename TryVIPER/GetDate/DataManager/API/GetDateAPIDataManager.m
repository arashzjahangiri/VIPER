//
//  GetDateAPIDataManager.m
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "GetDateAPIDataManager.h"
#import "Networking.h"

@implementation GetDateAPIDataManager

#pragma mark - GetDateAPIDataManagerProtocol

- (void)getDate:(dateResponseBlock) successBlock {
    [Networking getWithPath:@"getCurrentDate" parameters:@{} success:^(NSDictionary * _Nonnull responseDict) {
        DateEntity *date = [[DateEntity alloc] init:responseDict[@"data"]];
        successBlock(date);
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

@end
