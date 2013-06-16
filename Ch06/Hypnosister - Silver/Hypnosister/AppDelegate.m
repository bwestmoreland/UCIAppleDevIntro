//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Brent Westmoreland on 6/11/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[UIApplication sharedApplication] setStatusBarHidden: YES
                                            withAnimation: UIStatusBarAnimationFade];
     
    
    CGRect screenRect = [[self window] bounds];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: screenRect];
    [scrollView setMinimumZoomScale: 1.0];
    [scrollView setMaximumZoomScale: 5.0];
    scrollView.delegate = self;
    [self.window addSubview: scrollView];
    
    CGRect bigRect = screenRect;
    
    self.view = [[HypnosisView alloc] initWithFrame: screenRect];
    [scrollView addSubview:self.view];
    
    scrollView.contentSize = bigRect.size;

    
    
    BOOL success = [self.view becomeFirstResponder];
    
    NSString *class = NSStringFromClass([self.view class]);
    
    if (success) {
        DLog(@"%@ became first responder", class );
    }
    else {
        DLog(@"That's a negative red dog leader, %@ did not become the first responder", class);
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    

    [self.window makeKeyAndVisible];
    return YES;
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.view;
}

@end
