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
    UIView *header;
    if (section == 0){
        header = self.headerView;
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat headerHeight = 0.;
    if (section == 0) {
        headerHeight = self.headerView.bounds.size.height;
    }
    return headerHeight;
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
    if (indexPath.section == 1) {
        style = UITableViewCellEditingStyleNone;
    }
    else {
        style = UITableViewCellEditingStyleDelete;
    }
    return style;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 1;
    if (section == 0) {
        count = [[[ItemStore sharedStore] allItems] count];
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
    if (indexPath.section == 1){
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL answer = NO;
    if (indexPath.section == 0){
        answer = YES;
    }
    return answer;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (proposedDestinationIndexPath.section == 1) {
        return sourceIndexPath;
    }
    return proposedDestinationIndexPath;
}


@end
