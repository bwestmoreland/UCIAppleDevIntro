//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Brent Westmoreland on 6/15/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemsViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UIView *headerView;

- (IBAction)addNewItem:(UIButton *)sender;
- (IBAction)toggleEditingMode:(UIButton *)sender;


@end
