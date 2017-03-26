//
//  GetDateWireFrame.h
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "GetDateProtocols.h"
#import "GetDateView.h"
#import "GetDatePresenter.h"
#import "GetDateInteractor.h"
#import "GetDateAPIDataManager.h"

@interface GetDateWireFrame : NSObject <GetDateWireFrameProtocol>

+ (void)presentGetDateModuleFrom:(id)fromView;
+ (UIViewController*) initialViewController;

@end
