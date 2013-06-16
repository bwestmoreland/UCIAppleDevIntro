//
//  ItemStore.m
//  Homepwner
//
//  Created by Brent Westmoreland on 6/15/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"

@implementation ItemStore
{
    NSMutableArray *_allItems;
}

+ (ItemStore *)sharedStore
{
    static ItemStore *_sharedStore;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStore = [[ItemStore alloc] init];
    });

    return _sharedStore;
}

- (id)init
{
    if (self = [super init]) {
        _allItems = [NSMutableArray array];
    }
    
    return self;
}

- (Item *)createItem
{
    Item *rand = [Item randomItem];
    
    [_allItems addObject: rand];
    
    return rand;
}

- (NSArray *)allItems
{
    return [_allItems copy];
}

-(void)removeItem:(Item *)item
{
    [_allItems removeObjectIdenticalTo: item];
}

- (void)moveItemAtIndex:(int)oldIndex
                toIndex:(int)newIndex
{
    if (oldIndex == newIndex) {
        return;
    }
    
    Item *item = [_allItems objectAtIndex: oldIndex];
    
    [self removeItem: item];
    
    [_allItems insertObject: item atIndex: newIndex];
    
    NSLog(@"Moved from %d to %d", oldIndex, newIndex);
    
}
@end
