//
//  HatView.m
//  Hypnosister
//
//  Created by Brent Westmoreland on 6/12/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "HatView.h"

@implementation HatView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: frame]){
        [self setBackgroundColor: [UIColor clearColor]];
    }
    return self;
}

- (void)drawGradient:(CGRect)rect inContext:(CGContextRef)ctx
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    CGColorRef white = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.15] CGColor];
	CGColorRef blue = [[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.15] CGColor];
    
    NSArray *colors = @[(__bridge id) blue,
                        (__bridge id) white];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace,
                                                        (__bridge CFArrayRef)colors,
                                                        locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);
}

- (void)maskCircleOverRect:(CGRect)rect inContext:(CGContextRef)ctx
{
    CGPoint center;
    center.x = rect.origin.x + rect.size.width / 2.;
    center.y = rect.origin.y + rect.size.height / 2.;
    
    CGFloat radius = rect.size.height / 2.;
    
    CGContextAddArc(ctx,
                    center.x,
                    center.y,
                    radius,
                    0.,
                    M_PI * 2.,
                    YES);
    
    CGContextClip(ctx);
}

- (void)drawCircleBorderInRect:(CGRect)rect usingContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 3.);
    
    CGContextAddEllipseInRect(ctx, rect);
    
    CGContextStrokePath(ctx);
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor blackColor] setFill];
    [[UIColor blackColor] setStroke];
    
    [self maskCircleOverRect:rect inContext:ctx];
    
    UIImage *hat = [UIImage imageNamed: @"Icon"];
    
    [hat drawInRect: rect];
    
    [self drawGradient:rect inContext:ctx];
    
    [self drawCircleBorderInRect:rect usingContext:ctx];
}

@end
