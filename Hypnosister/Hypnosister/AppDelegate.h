//
//  AppDelegate.h
//  Hypnosister
//
//  Created by Brent Westmoreland on 6/11/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView, HatView;

@interface AppDelegate : UIResponder
<UIApplicationDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HypnosisView *view;
@property (strong, nonatomic) HatView *hatView;

@end
