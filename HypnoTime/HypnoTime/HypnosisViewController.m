//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Brent Westmoreland on 6/15/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    HypnosisView *view = [[HypnosisView alloc] initWithFrame: frame];
    
    self.view = view;
}

@end
