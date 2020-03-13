//
//  TryVIPERTests.m
//  TryVIPERTests
//
//  Created by Arash on 1/26/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GetDateAPIDataManager.h"
#import "GetDateProtocols.h"
#import "MockGetDatePresenter.h"
#import "GetDateInteractor.h"

@interface TryVIPERTests : XCTestCase

@end

@implementation TryVIPERTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (MockGetDatePresenter *)testPresenter {
    MockGetDatePresenter *presenter = [MockGetDatePresenter new];
    id <GetDateInteractorInputProtocol> interactor = [GetDateInteractor new];
    id <GetDateAPIDataManagerProtocol> APIDataManager = [GetDateAPIDataManager new];
    
    // Connecting
    presenter.interactor = interactor;
    interactor.apiDataManager = APIDataManager;
    
    return presenter;
}

//for this test remember to run server--node server.js
- (void)testGettingDate {
    XCTestExpectation *dateReceivedExpectation = [self expectationWithDescription:@"date received"];
    
    MockGetDatePresenter *presenter = [self testPresenter];
    [presenter didRequestDate];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssert(presenter.date.length > 0, @"Presenter didRequestDate has populated the date.");
        NSLog(@"date received: %@", presenter.date);
        [dateReceivedExpectation fulfill];
    });
    
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
