//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Brent Westmoreland on 6/11/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "HypnosisView.h"
@interface HypnosisView()

@property (nonatomic) BOOL hasShaken;

@end


@implementation HypnosisView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
        self.hasShaken = NO;
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
        
        if (!self.hasShaken) {
            //Ch06 Bronze Challenge
            [[UIColor colorWithRed: arc4random() % 255/ 255.0
                             green: arc4random() % 255/ 255.0
                              blue: arc4random() % 255/ 255.0
                             alpha: 1.] setStroke];
        }
        
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
    
    CGContextSaveGState(context);
    
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    [text drawInRect:textRect
            withFont:font];
    
    CGContextRestoreGState(context);
    
    [self drawCrossHairAtPoint: center onRect: textRect inContext: context];

    CGContextStrokePath(context);
    
}

//Ch06 Silver Challenge - Shapes

- (void)drawCrossHairAtPoint: (CGPoint)center onRect: (CGRect) rect inContext: (CGContextRef)context
{
    UIGraphicsPushContext(context);
    
    CGContextSetLineWidth(context, 2.);
    
    CGFloat size = rect.size.width / 4.;
    
    CGContextMoveToPoint(context, center.x, center.y - size);
    CGContextAddLineToPoint(context, center.x, center.y + size);
    
    
    CGContextMoveToPoint(context, center.x - size, center.y);
    CGContextAddLineToPoint(context, center.x + size, center.y);
    
    [[UIColor greenColor] setStroke];
    
    UIGraphicsPopContext();
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake){
        DLog(@"Device started shaking");
        self.hasShaken = YES;
        self.circleColor = [UIColor redColor];
    }
}

@end
