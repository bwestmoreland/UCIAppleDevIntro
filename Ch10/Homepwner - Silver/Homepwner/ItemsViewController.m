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
        
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (UIView *)headerView
{
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed: @"HeaderView" owner: self options: nil];
    }
    return _headerView;
}

- (void)addNewItem:(UIButton *)sender
{
    Item *item = [[ItemStore sharedStore] createItem];
    NSIndexPath *lastRow = [NSIndexPath indexPathForRow:[[[ItemStore sharedStore] allItems] indexOfObject: item]
                                              inSection:0];
    [self.tableView insertRowsAtIndexPaths: @[ lastRow ]
                          withRowAnimation: UITableViewRowAnimationAutomatic];
}

- (void)toggleEditingMode:(UIButton *)sender
{
    if (self.editing){
        [sender setTitle: @"Edit" forState: UIControlStateNormal];
        [self setEditing: NO animated: YES];
        [self.tableView reloadData];
    }
    else {
        [sender setTitle: @"Done" forState: UIControlStateNormal];
        [self setEditing: YES animated: YES];
    }
}

- (void)dealloc
{
    _headerView = nil;
}

#pragma mark - UITableViewDelegate


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.headerView.bounds.size.height;
}

- (NSString *)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remove";
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView
          editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCellEditingStyle style;
    if (indexPath.row >= [[[ItemStore sharedStore] allItems] count]) {
        style = UITableViewCellEditingStyleNone;
    }
    else {
        style = UITableViewCellEditingStyleDelete;
    }
    return style;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL answer = NO;
    if (indexPath.row < [[[ItemStore sharedStore] allItems] count]) {
        answer = YES;
    }
    return answer;
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 1;
    count += [[[ItemStore sharedStore] allItems] count];
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
    }
    else {
        Item *item = [[[ItemStore sharedStore] allItems] objectAtIndex: indexPath.row];
        cell.textLabel.text = [item description];
    }
    
    return cell;
}

-   (void)tableView:(UITableView *)tableView
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
  forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ItemStore *store = [ItemStore sharedStore];
        NSArray *items = [store allItems];
        Item *item = items[indexPath.row];
        [store removeItem: item];
        
        [tableView deleteRowsAtIndexPaths: @[indexPath]
                         withRowAnimation: UITableViewRowAnimationAutomatic];
    }
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[ItemStore sharedStore] moveItemAtIndex: sourceIndexPath.row toIndex: destinationIndexPath.row];
}

@end
