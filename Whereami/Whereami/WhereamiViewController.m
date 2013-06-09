//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Brent Westmoreland on 6/8/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController()
<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        //Ch04 Bronze Challenge
        _locationManager.distanceFilter = 50.;
        [_locationManager startUpdatingLocation];
        
        //Ch04 Silver Challenge P1
        if ([CLLocationManager headingAvailable]){
            [_locationManager startUpdatingHeading];
        }
    }
    return self;
}

#pragma mark CLLocationManagerDelegate


//Ch04 Silver Challenge P2
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading
{
    DLog(@"New Heading: %@", newHeading);
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    DLog(@"Locations: %@", locations);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    DLog(@"Did fail with error: %@", error);
}

- (void)nilUnsafeUnretainedObjects
{
    //These objects are unsafe_unretained and should be removed manually to avoid a memory leak
    self.locationManager.delegate = nil;
}

- (void)dealloc
{
    [self nilUnsafeUnretainedObjects];
}

@end
