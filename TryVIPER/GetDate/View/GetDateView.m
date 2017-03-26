//
//  GetDateView.m
//  TryVIPER
//
//  Created by Arash on 2/1/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "GetDateView.h"

@interface GetDateView ()
{
    UIImageView *animationImageView;
}
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@end

@implementation GetDateView

- (IBAction)getDate:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.dateLabel setText:@"fetching ..."];
        [self animating];
    });
    [self.presenter didRequestdate];
}

#pragma mark - GetDateViewProtocol

- (void)showdate:(NSString*)date {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self stopAnimating];
        [self.dateLabel setText:date];
    });
}

- (void)animating
{
    [_refreshButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    // Load images
    NSArray *imageNames = @[@"refresh.png", @"refresh2.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
    animationImageView = [[UIImageView alloc] initWithFrame:self.refreshButton.frame];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.45;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
}

- (void)stopAnimating{
    [_refreshButton setImage:[UIImage imageNamed:@"refresh"] forState:UIControlStateNormal];
    [animationImageView stopAnimating];
}
@end
