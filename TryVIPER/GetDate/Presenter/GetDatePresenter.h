//
//  GetDatePresenter.h
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//


#import "GetDateProtocols.h"

@interface GetDatePresenter : NSObject <GetDatePresenterProtocol>

@property (nonatomic, weak) id <GetDateViewProtocol> view;
@property (nonatomic, strong) id <GetDateInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <GetDateWireFrameProtocol> wireFrame;

- (void) didRequestdate;

@end
