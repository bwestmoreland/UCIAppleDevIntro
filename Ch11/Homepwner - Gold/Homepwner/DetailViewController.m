//
//  DetailViewController.m
//  Homepwner
//
//  Created by Brent Westmoreland on 6/16/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "DetailViewController.h"
#import "SelectDateViewController.h"
#import "Item.h"

@implementation DetailViewController

- (void)setItem:(Item *)item
{
    _item = item;
    [self setTitle: item.itemName];
}

- (IBAction)selectDate:(id)sender
{
    SelectDateViewController *selectDateViewController;
    
    selectDateViewController = [[SelectDateViewController alloc] initWithNibName: @"SelectDateView"
                                                                          bundle: nil];
    
    selectDateViewController.item = self.item;
    
    [self.navigationController pushViewController: selectDateViewController
                                         animated: YES];
    
}

//Silver Challenge

- (void)dismissKeyboard
{
    [self.view endEditing: YES];
}


#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad
{
    //Silver Challenge
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                          action: @selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO; //Allows other tappable areas to work
    
    [self.view addGestureRecognizer: tap];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    self.nameField.text = self.item.itemName;
    self.serialField.text = self.item.serialNumber;
    
    NSString *valueInDollars = [NSString stringWithFormat:@"%d", self.item.valueInDollars];
    self.valueField.text = valueInDollars;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    self.dateLabel.text = [dateFormatter stringFromDate: self.item.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear: animated];
    
    [self.view endEditing: YES];
    
    self.item.itemName = self.nameField.text;
    self.item.serialNumber = self.serialField.text;
    self.item.valueInDollars = [self.valueField.text intValue];
}

@end
