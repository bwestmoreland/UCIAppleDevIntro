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
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect bounds = [self bounds];
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    CGContextSetLineWidth(context, 10);
    
    [self.circleColor setStroke];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20 ) {
        CGContextAddArc(context, center.x, center.y, currentRadius, 0., M_PI * 2.,  YES);
        
        CGContextStrokePath(context);
    }
    
    NSString *text = @"You are getting sleepy";
    
    UIFont *font = [UIFont boldSystemFontOfSize: 28];
    
    CGRect textRect;
    
    textRect.size = [text sizeWithFont: font];
    
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    CGSize offset = CGSizeMake(4, 3);
    
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    [text drawInRect: textRect
            withFont: font];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake){
        DLog(@"Device started shaking");
        self.circleColor = [UIColor redColor];
    }
}

@end
