//
//  DetailViewController.h
//  Homepwner
//
//  Created by Brent Westmoreland on 6/16/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//
@class Item;

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) Item *item;

- (IBAction)selectDate:(UIButton *)sender;

@end
