//
//  StepperCell.m
//  Homepwner
//
//  Created by Brent Westmoreland on 6/22/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "StepperCell.h"

@implementation StepperCell


- (IBAction)changeValue: (UIStepper *)sender
{
    NSString *selector = NSStringFromSelector(_cmd);
    
    selector = [selector stringByAppendingString:@"atIndexPath:"];
    
    SEL newSelector = NSSelectorFromString(selector);
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell: self];
    
    if (indexPath && [self.controller respondsToSelector: newSelector]) {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.controller performSelector: newSelector
                              withObject: sender
                              withObject: indexPath];
#pragma clang diagnostic pop
        
    }

}
@end
