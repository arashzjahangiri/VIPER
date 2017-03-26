//
//  GetDatePresenter.m
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "GetDatePresenter.h"

@implementation GetDatePresenter

#pragma mark - GetDatePresenterProtocol

- (void) didRequestdate {
    [self.interactor getDate:^(DateEntity *date) {
        [self.view showdate:date.date];
    }];
}

@end
