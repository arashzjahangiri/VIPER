//
//  MockGetDatePresenter.m
//  TryVIPER
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "MockGetDatePresenter.h"
#import "GetDateWireFrame.h"
#import <XCTest/XCTest.h>

@implementation MockGetDatePresenter

- (void)testDidRequestDate {
    // Given
    id <GetDateInteractorInputProtocol> interactorMock = [GetDateInteractor new];
    id <GetDateViewProtocol> viewMock = [GetDateView new];
    id <GetDateWireFrameProtocol> wireFrameMock = [GetDateWireFrame new];
    GetDatePresenter *presenter = [GetDatePresenter new];
    presenter.interactor = interactorMock;
    presenter.view = viewMock;
    presenter.wireFrame = wireFrameMock;
    
    // When
    [presenter didRequestDate];
    
    // Then
    
}
@end
