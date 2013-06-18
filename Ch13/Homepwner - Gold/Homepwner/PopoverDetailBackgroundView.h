//
//  PopoverDetailBackgroundView.h
//  Homepwner
//
//  Created by Brent Westmoreland on 6/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

@interface PopoverDetailBackgroundView : UIPopoverBackgroundView

@property (nonatomic, readwrite) CGFloat arrowOffset;
@property (nonatomic, readwrite) UIPopoverArrowDirection arrowDirection;

+ (UIEdgeInsets)contentViewInsets;
+ (CGFloat)arrowHeight;
+ (CGFloat)arrowBase;

@end
