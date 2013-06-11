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
    
    CGRect viewFrame = CGRectMake(160, 240, 100, 150);
    
    HypnosisView *view = [[HypnosisView alloc] initWithFrame: viewFrame];
    
    [[self window] addSubview: view];
    
    CGRect anotherFrame = CGRectMake(20, 30, 50, 50);
    HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame: anotherFrame];
    
    [view addSubview: anotherView];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
