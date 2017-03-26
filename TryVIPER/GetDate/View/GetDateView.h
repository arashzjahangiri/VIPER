//
//  GetDateView.h
//  TryVIPER
//
//  Created by Arash on 2/1/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDateProtocols.h"

@interface GetDateView : UIViewController <GetDateViewProtocol>

@property (nonatomic, strong) id <GetDatePresenterProtocol> presenter;

- (void)showdate:(NSString*)date;

@end
