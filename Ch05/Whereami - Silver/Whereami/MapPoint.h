//
//  MapPoint.h
//  Whereami
//
//  Created by Brent Westmoreland on 6/10/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

@interface MapPoint : NSObject
<MKAnnotation>

@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;


- (id) initWithCoordinate: (CLLocationCoordinate2D)coordinate
                    title: (NSString *)title;

@end
