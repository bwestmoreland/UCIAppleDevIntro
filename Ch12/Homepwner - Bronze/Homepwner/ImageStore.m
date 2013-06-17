//
//  ImageStore.m
//  Homepwner
//
//  Created by Brent Westmoreland on 6/16/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "ImageStore.h"

@implementation ImageStore
{
    NSMutableDictionary *dictionary;
}

+ (ImageStore *)sharedStore
{
    static ImageStore *_sharedStore;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStore = [[ImageStore alloc] init];
    });
    
    return _sharedStore;
}

- (id)init
{
    if (self = [super init]) {
        dictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey: (NSString *)key
{
    dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    return dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [dictionary removeObjectForKey: key];
}

@end
