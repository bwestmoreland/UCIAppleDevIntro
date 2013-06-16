//
//  ItemStore.h
//  Homepwner
//
//  Created by Brent Westmoreland on 6/15/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

@class Item;

@interface ItemStore : NSObject

+ (ItemStore *)sharedStore;

- (NSArray *)allItems;
- (Item *)createItem;

@end
