//
//  AppDelegate.m
//  Quiz
//
//  Created by Brent Westmoreland on 6/5/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "AppDelegate.h"

#import "QuizViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize quizViewController = _quizViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = self.quizViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark @property literals

- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    return _window;
}

- (void)setWindow:(UIWindow *)window
{
    _window = window;
}

- (QuizViewController *)quizViewController
{
    if (!_quizViewController) {
        _quizViewController = [[QuizViewController alloc] initWithNibName:@"QuizView" bundle: nil];
    }
    return _quizViewController;
}

- (void)setQuizViewController:(QuizViewController *)quizViewController
{
    _quizViewController = quizViewController;
}

@end
