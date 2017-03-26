//
//  GetDateInteractor.m
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "GetDateInteractor.h"

@implementation GetDateInteractor

#pragma mark - GetDateInteractorInputProtocol

- (void) getDate:(dateResponseBlock) successBlock {
    [self.apiDataManager getDate:successBlock];
}

@end
