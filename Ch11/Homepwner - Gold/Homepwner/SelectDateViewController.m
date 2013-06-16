//
//  SelectDateViewController.m
//  Homepwner
//
//  Created by Brent Westmoreland on 6/16/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "SelectDateViewController.h"
#import "Item.h"

@implementation SelectDateViewController

- (void)viewDidLoad
{
    NSString *message = @"Insurance Fraud is a crime, violaters will be prosecuted";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: nil
                                                    message: message
                                                   delegate: nil
                                          cancelButtonTitle: @"Ok"
                                          otherButtonTitles: nil];
    [alert show];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    [self.datePicker setDate: self.item.dateCreated animated: YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.view endEditing: YES];
    
    self.item.dateCreated = self.datePicker.date;
}
@end
