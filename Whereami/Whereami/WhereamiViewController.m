//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Brent Westmoreland on 6/8/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "WhereamiViewController.h"
#import <MapKit/MapKit.h>

@interface WhereamiViewController()

@end

@implementation WhereamiViewController

@synthesize activityIndicatorView = _activityIndicatorView;
@synthesize locationTitleField = _locationTitleField;
@synthesize worldView = _worldView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        //Ch04 Bronze Challenge
        _locationManager.distanceFilter = 50.;
        
        //Ch04 Silver Challenge P1
        if ([CLLocationManager headingAvailable]){
            [_locationManager startUpdatingHeading];
        }
    }
    return self;
}

#pragma mark UIViewController lifecycle

- (void)viewDidLoad
{
    [self configureWorldView];
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

#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D location = [userLocation coordinate];
    DLog(@"Latitude: %f Longitude: %f", location.latitude, location.longitude );
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 250, 250);
    [mapView setRegion:region animated:YES];
}


#pragma mark @property overrides and configuration

//activityIndicatorView

- (void)setActivityIndicatorView:(UIActivityIndicatorView *)activityIndicatorView
{
    [self willChangeValueForKey:@"activityIndicatorView"];
    _activityIndicatorView = activityIndicatorView;
    [self didChangeValueForKey:@"activityIndicatorView"];
    [self configureActivityIndicatorView];
}

- (UIActivityIndicatorView *)activityIndicatorView
{
    return _activityIndicatorView;
}

- (void)configureActivityIndicatorView
{
    self.activityIndicatorView.hidesWhenStopped = YES;
}

//locationTitleField

- (void)setLocationTitleField:(UITextField *)locationTitleField
{
    [self willChangeValueForKey:@"locationTitleField"];
    _locationTitleField = locationTitleField;
    [self didChangeValueForKey:@"locationTitleField"];
    [self configureLocationTitleTextField];
}

- (UITextField *)locationTitleField
{
    return _locationTitleField;
}

- (void)configureLocationTitleTextField
{
    self.locationTitleField.placeholder = @"Enter Location Name";
    self.locationTitleField.returnKeyType = UIReturnKeyDone;
}


//worldView

- (void)setWorldView:(MKMapView *)worldView
{
    [self willChangeValueForKey:@"worldView"];
    _worldView = worldView;
    [self didChangeValueForKey:@"worldView"];
    [self configureWorldView];
}

- (MKMapView *)worldView
{
    return _worldView;
}

- (void)configureWorldView
{
    self.worldView.showsUserLocation = YES;
}

@end
