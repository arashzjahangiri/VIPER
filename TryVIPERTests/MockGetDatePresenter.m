//
//  MockGetDatePresenter.m
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "MockGetDatePresenter.h"

@implementation MockGetDatePresenter

- (void) didRequestDate {
    [self.interactor getDate:^(DateEntity *date) {
        self.date = date.date;
    }];
}

@end
