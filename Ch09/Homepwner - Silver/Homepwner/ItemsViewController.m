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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count;

    //Ch09 Silver Challenge
    count = [[[ItemStore sharedStore] allItems] count] + 1;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass([UITableViewCell class]);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: identifier];
    }
    
    //Ch09 Silver Challenge
    if (indexPath.row >= [[[ItemStore sharedStore] allItems] count]){
        cell.textLabel.text = @"No more items!";
        return cell;
    }
    
    Item *item;

    item = [[[ItemStore sharedStore] allItems] objectAtIndex: indexPath.row];

    
    cell.textLabel.text = [item description];
    
    return cell;
}



@end
