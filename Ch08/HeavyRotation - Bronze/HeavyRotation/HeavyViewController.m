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
    //Ch08 Bronze
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver: self
           selector: @selector(proximityStateChanged:)
               name: UIDeviceProximityStateDidChangeNotification
             object: [UIDevice currentDevice]];
    
}

//Ch08 Bronze

- (void)proximityStateChanged: (NSNotification *)notification
{
    UIDevice *device = [notification object];
    
    if (device.proximityState) {
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
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
