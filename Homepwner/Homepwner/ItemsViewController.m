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

@interface ItemsViewController()

@property (nonatomic) BOOL isChapterNineBronzeChallenge;

@end

@implementation ItemsViewController

- (id)init
{
    if (self = [super initWithStyle: UITableViewStyleGrouped]) {
        for (int i = 0; i <= 5; i++) {
            [[ItemStore sharedStore] createItem];
            [self setIsChapterNineBronzeChallenge: NO];
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
    NSInteger sections = 1;
    if (self.isChapterNineBronzeChallenge) sections = 2;
    return sections;
}

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
    if (self.isChapterNineBronzeChallenge){
        //Ch09 Bronze Challenge
        NSPredicate *filter = [self filterForSection: section];
        NSArray *filteredArray = [[[ItemStore sharedStore] allItems] filteredArrayUsingPredicate: filter];
        count = [filteredArray count];
    }
    else {
        //Ch09 Silver Challenge
        count = [[[ItemStore sharedStore] allItems] count] + 1;
    }
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
    
    if (self.isChapterNineBronzeChallenge) {
        NSPredicate *filter = [self filterForSection: indexPath.section];
        NSArray *filteredArray = [[[ItemStore sharedStore] allItems] filteredArrayUsingPredicate: filter];
        item = filteredArray[indexPath.row];
    }
    else {
        item = [[[ItemStore sharedStore] allItems] objectAtIndex: indexPath.row];
    }
    
    cell.textLabel.text = [item description];
    
    return cell;
}



@end
