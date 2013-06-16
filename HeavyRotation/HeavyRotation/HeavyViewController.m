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
    
    // Ch08 Silver
    [self.leftButton setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin];
    [self.rightButton setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin];
    [self.imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [self.slider setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
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

//Ch08 Gold Challenge
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    CGRect viewBounds = [self.view bounds];
    
    NSLog(@"View Bounds: %@", NSStringFromCGRect(viewBounds));
    
    CGFloat magicInset = 10.;
    
    CGRect portraitFrame;
    portraitFrame.size.height = 44.0;
    portraitFrame.size.width = 74.0;
    portraitFrame.origin.y = CGRectGetMidY(viewBounds) - portraitFrame.size.height * .5;
    portraitFrame.origin.x = magicInset;
    
    CGRect landscapeFrame;
    landscapeFrame.size = portraitFrame.size;
    landscapeFrame.origin.y = CGRectGetMidY(viewBounds) - landscapeFrame.size.height * .5;
    landscapeFrame.origin.x = CGRectGetMaxX(viewBounds) - landscapeFrame.size.width - magicInset;
    
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        self.willAnimateButton.frame = portraitFrame;
        NSLog(@"Portrait: %@", NSStringFromCGRect(portraitFrame));
    }
    else {
        self.willAnimateButton.frame = landscapeFrame;
        NSLog(@"Landscape: %@", NSStringFromCGRect(landscapeFrame));
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
    [self setWillAnimateButton:nil];
    [super viewDidUnload];
}
@end
