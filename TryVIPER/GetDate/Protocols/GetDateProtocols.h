//
//  GetDateProtocols.h
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateEntity.h"

typedef void(^dateResponseBlock)(DateEntity *);

@protocol GetDateAPIDataManager;
@protocol GetDateInteractorInputProtocol;
@protocol GetDatePresenterProtocol;
@protocol GetDateAPIDataManagerProtocol;


@protocol GetDateViewProtocol
@required

@property (nonatomic, strong) id <GetDatePresenterProtocol> presenter;

- (void)showdate:(NSString*)date;

@end

@protocol GetDateWireFrameProtocol
@required

+ (void)presentGetDateModuleFrom:(id)fromView;

@end

@protocol GetDatePresenterProtocol
@required

@property (nonatomic, weak) id <GetDateViewProtocol> view;
@property (nonatomic, strong) id <GetDateInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <GetDateWireFrameProtocol> wireFrame;

- (void) didRequestdate;

@end


@protocol GetDateInteractorOutputProtocol

@end

@protocol GetDateInteractorInputProtocol
@required

@property (nonatomic, strong) id <GetDateAPIDataManagerProtocol> apiDataManager;

- (void)getDate:(dateResponseBlock) successBlock;

@end


@protocol GetDateDataManagerInputProtocol <NSObject>
@required

- (void)getDate:(dateResponseBlock) successBlock;

@end

@protocol GetDateAPIDataManagerProtocol <GetDateDataManagerInputProtocol>


@end
