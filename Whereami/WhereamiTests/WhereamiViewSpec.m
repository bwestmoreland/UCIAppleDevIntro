//
//  WhereamiViewSpec.m
//  Whereami
//
//  Created by Brent Westmoreland on 6/8/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "Kiwi.h"
#import "WhereamiViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface WhereamiViewController(TestAdditions)

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

WhereamiViewController *(^whereamiVC)(void) = ^WhereamiViewController *(void){
    WhereamiViewController *tempVC;
    tempVC = [[WhereamiViewController alloc] initWithNibName: @"WhereamiViewController"
                                                      bundle: nil];
    
    return tempVC;
};


SPEC_BEGIN(WhereamiViewSpec)

describe(@"Where Am I View Controller", ^{
    __block WhereamiViewController *viewController;
    
    context(@"after being initialized", ^{
        beforeEach(^{ // Occurs before each enclosed "it"
            viewController = whereamiVC();
        });
        
        afterEach(^{ // Occurs after each enclosed "it"
            viewController = nil;
        });
        
        it(@"have a location manager", ^{
            [viewController.locationManager shouldNotBeNil];
        });
    });
});


SPEC_END
