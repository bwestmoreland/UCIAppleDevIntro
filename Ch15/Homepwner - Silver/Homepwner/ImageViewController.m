//
//  ImageViewController.m
//  Homepwner
//
//  Created by Brent Westmoreland on 6/21/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "ImageViewController.h"

@implementation ImageViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    CGSize size = self.image.size;
    
    self.scrollView.contentSize = size;
    
    [self.imageView setFrame: CGRectMake(0., 0., size.width, size.height)];
    
    self.imageView.image = self.image;
    
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}


@end
