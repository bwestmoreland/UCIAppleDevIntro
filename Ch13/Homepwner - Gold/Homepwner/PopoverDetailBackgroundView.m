//
//  PopoverDetailBackgroundView.m
//  Homepwner
//
//  Created by Brent Westmoreland on 6/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "PopoverDetailBackgroundView.h"

@implementation PopoverDetailBackgroundView

@synthesize arrowDirection = _arrowDirection;
@synthesize arrowOffset = _arrowOffset;

+ (UIEdgeInsets)contentViewInsets
{
    return UIEdgeInsetsZero;
}

+(CGFloat)arrowBase
{
    return 5.0;
}

+(CGFloat)arrowHeight
{
    return 5.0;
}

- (UIPopoverArrowDirection)arrowDirection
{
    return _arrowDirection;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection
{
    _arrowDirection = arrowDirection;
    [self setNeedsDisplay];
}

- (CGFloat)arrowOffset
{
    return _arrowOffset;
}

- (void)setArrowOffset:(CGFloat)arrowOffset
{
    _arrowOffset = arrowOffset;
    [self setNeedsDisplay];
}

@end
