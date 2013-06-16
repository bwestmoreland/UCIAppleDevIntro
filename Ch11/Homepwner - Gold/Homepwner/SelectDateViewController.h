//
//  SelectDateViewController.h
//  Homepwner
//
//  Created by Brent Westmoreland on 6/16/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//
@class Item;

@interface SelectDateViewController : UIViewController

@property (strong, nonatomic) Item *item;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end
