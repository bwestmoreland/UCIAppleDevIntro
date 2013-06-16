//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Brent Westmoreland on 6/15/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemStore.h"
#import "Item.h"


@implementation ItemsViewController

- (id)init
{
    if (self = [super initWithStyle: UITableViewStyleGrouped]) {
        for (int i = 0; i <= 5; i++) {
            [[ItemStore sharedStore] createItem];

        }
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger sections = 2;
    return sections;
}

//Bronze Challenge

- (NSPredicate *)filterForSection: (NSInteger)section
{
    NSPredicate *filter;
    if (section) {
        filter = [NSPredicate predicateWithFormat:@"valueInDollars > 50"];
    }
    else {
        filter = [NSPredicate predicateWithFormat:@"valueInDollars < 50"];
    }
    return filter;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count;
    
    NSPredicate *filter = [self filterForSection: section];
    NSArray *filteredArray = [[[ItemStore sharedStore] allItems] filteredArrayUsingPredicate: filter];
    count = [filteredArray count];

    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass([UITableViewCell class]);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: identifier];
    }
    
    Item *item;
    
    NSPredicate *filter = [self filterForSection: indexPath.section];
    NSArray *filteredArray = [[[ItemStore sharedStore] allItems] filteredArrayUsingPredicate: filter];
    item = filteredArray[indexPath.row];

    
    cell.textLabel.text = [item description];
    
    return cell;
}



@end
