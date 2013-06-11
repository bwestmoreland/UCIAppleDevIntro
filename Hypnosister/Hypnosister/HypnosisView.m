//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Brent Westmoreland on 6/11/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect bounds = [self bounds];
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    
    CGContextSetLineWidth(context, 10);
    
    CGContextSetRGBStrokeColor(context, 0.6, 0.6, 0.6, 1.0);
    
    CGContextAddArc(context, center.x, center.y, maxRadius, 0.0, M_PI * 2., YES);
    
    CGContextStrokePath(context);
}
@end
