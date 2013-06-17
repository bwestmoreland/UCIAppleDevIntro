//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Brent Westmoreland on 6/11/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "CrosshairView.h"


@implementation CrossHairView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        [self setCrossHairColor: [UIColor greenColor]];
    }
    return self;
}

- (void)setCrossHairColor:(UIColor *)crossHairColor
{
    _crossHairColor = crossHairColor;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect bounds = [self bounds];
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    CGContextSetLineWidth(ctx, 10);
    
    [self.crossHairColor setStroke];
        
    [self drawCrossHairAtPoint: center onRect: rect inContext: ctx];

    CGContextStrokePath(ctx);
    
}

- (void)drawCrossHairAtPoint: (CGPoint)center onRect: (CGRect) rect inContext: (CGContextRef)ctx
{
    UIGraphicsPushContext(ctx);
    
    CGContextSetLineWidth(ctx, 3.);
    
    CGFloat size = rect.size.width / 4.;
    
    CGContextMoveToPoint(ctx, center.x, center.y - size);
    CGContextAddLineToPoint(ctx, center.x, center.y + size);
    
    
    CGContextMoveToPoint(ctx, center.x - size, center.y);
    CGContextAddLineToPoint(ctx, center.x + size, center.y);
    
    CGContextAddArc(ctx,
                    center.x,
                    center.y,
                    size / 2.,
                    0.,
                    M_PI * 2. ,
                    YES);
    
    
    UIGraphicsPopContext();
}

@end
