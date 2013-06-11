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
    
    CGRect screenRect = [[self window] bounds];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: screenRect];
    [self.window addSubview: scrollView];
    
    CGRect bigRect = screenRect;
    
    bigRect.size.width *= 2.0;
    
    HypnosisView *view = [[HypnosisView alloc] initWithFrame: screenRect];
    [scrollView addSubview:view];
    
    screenRect.origin.x = screenRect.size.width;
    
    HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame: screenRect];
    [scrollView addSubview: anotherView];
    
    
    scrollView.contentSize = bigRect.size;

    
    
    BOOL success = [view becomeFirstResponder];
    
    NSString *class = NSStringFromClass([view class]);
    
    if (success) {
        DLog(@"%@ became first responder", class );
    }
    else {
        DLog(@"That's a negative red dog leader, %@ did not become the first responder", class);
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    scrollView.pagingEnabled = YES;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
