//
//  MapViewController.m
//  HypnoTime
//
//  Created by Brent Westmoreland on 6/15/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self setTitle: @"Map"];
        
    }
    return self;
}

- (void)loadView
{
    self.view = [[MKMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
