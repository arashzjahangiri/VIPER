//
//  GetDateWireFrame.m
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "GetDateWireFrame.h"

@implementation GetDateWireFrame

+ (void)presentGetDateModuleFrom:(id)fromView {
/*
    // Generating module components
    id <GetDateViewProtocol> view = [[GetDateView alloc] init];
    id <GetDatePresenterProtocol> presenter = [GetDatePresenter new];
    id <GetDateInteractorInputProtocol> interactor = [GetDateInteractor new];
    id <GetDateAPIDataManagerProtocol> APIDataManager = [GetDateAPIDataManager new];
    
    id <GetDateWireFrameProtocol> wireFrame= [GetDateWireFrame new];
    
    // Connecting
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    interactor.apiDataManager = APIDataManager;
    
    //TOODO - New view controller presentation (present, push, pop, .. )
*/
}

+ (UIViewController*) initialViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GetDateView *view = [storyboard instantiateViewControllerWithIdentifier:@"GetDateViewController"];
    
    id <GetDatePresenterProtocol> presenter = [GetDatePresenter new];
    id <GetDateInteractorInputProtocol> interactor = [GetDateInteractor new];
    id <GetDateAPIDataManagerProtocol> APIDataManager = [GetDateAPIDataManager new];
    
    // we won't have any navigation on this project
    id <GetDateWireFrameProtocol> wireFrame= [GetDateWireFrame new];
    
    // Connecting
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    interactor.apiDataManager = APIDataManager;

    return view;
}

@end
