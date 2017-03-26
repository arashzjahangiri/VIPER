//
//  dateEntity.h
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateEntity : NSObject

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *date;

- (instancetype) init:(NSDictionary*) dictionary;

@end

