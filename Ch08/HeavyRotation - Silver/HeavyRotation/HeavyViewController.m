//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by Brent Westmoreland on 6/15/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "HeavyViewController.h"

@implementation HeavyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Ch08 Silver
    [self.leftButton setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin];
    [self.rightButton setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin];
    [self.imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [self.slider setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait
            || UIDeviceOrientationIsLandscape(toInterfaceOrientation));
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setSlider:nil];
    [self setRightButton:nil];
    [self setLeftButton:nil];
    [super viewDidUnload];
}
@end
