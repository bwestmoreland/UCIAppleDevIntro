//
//  MapPoint.m
//  Whereami
//
//  Created by Brent Westmoreland on 6/10/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

- (id)init
{
    return [self initWithCoordinate: CLLocationCoordinate2DMake( 43.07, -89.32)
                              title: @"Home"];
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                   title:(NSString *)title
{
    if (self = [super init]){
        _coordinate = coordinate;
        [self setTitle: title];
    }
    return self;
}

@end
