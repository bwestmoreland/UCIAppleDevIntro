//
//  AppDelegate.m
//  HeavyRotation
//
//  Created by Brent Westmoreland on 6/15/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "AppDelegate.h"
#import "HeavyViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIDevice *device = [UIDevice currentDevice];
    
    [device beginGeneratingDeviceOrientationNotifications];
    
    [device setProximityMonitoringEnabled:YES];
    
    
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver: self
           selector: @selector(orientationChanged:)
               name: UIDeviceOrientationDidChangeNotification
             object: device];
    
    HeavyViewController *hvc = [[HeavyViewController alloc] initWithNibName: @"HeavyView" bundle: nil];
    
    self.window.rootViewController = hvc;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)orientationChanged: (NSNotification *)note
{
    NSLog(@"Orientation Changed: %d", [[note object] orientation]);
}

@end
