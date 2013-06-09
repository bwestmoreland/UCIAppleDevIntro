//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Brent Westmoreland on 6/8/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController()

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [_locationManager startUpdatingLocation];
    }
    return self;
}


@end
