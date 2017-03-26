//
//  GetDateInteractor.h
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "GetDateProtocols.h"

@interface GetDateInteractor : NSObject <GetDateInteractorInputProtocol>

@property (nonatomic, strong) id <GetDateAPIDataManagerProtocol> apiDataManager;

- (void)getDate:(dateResponseBlock) successBlock;

@end
