//
//  dateEntity.m
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "DateEntity.h"

@implementation DateEntity

- (instancetype) init:(NSDictionary *)dictionary {
    if (self = [self init]) {
        self.status = dictionary[@"status"];
        self.date = dictionary[@"date"];
    }
    return self;
}

@end
