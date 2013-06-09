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
<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

WhereamiViewController *(^whereamiVC)(void) = ^WhereamiViewController *(void){
    WhereamiViewController *tempVC;
    tempVC = [[WhereamiViewController alloc] initWithNibName: @"WhereamiViewController"
                                                      bundle: nil];
    //do any additional setup
    return tempVC;
};


SPEC_BEGIN(WhereamiViewSpec)

describe(@"Where Am I View Controller", ^{
    __block WhereamiViewController *viewController;
    
    beforeEach(^{ // Occurs before each enclosed "it"
        viewController = whereamiVC();
    });
    
    afterEach(^{ // Occurs after each enclosed "it"
        viewController = nil;
    });
    
    context(@"after being initialized", ^{
        
        it(@"have a location manager", ^{
            [viewController.locationManager shouldNotBeNil];
            CLLocationAccuracy accuracy = viewController.locationManager.desiredAccuracy;
            [[theValue(accuracy) should] equal:theValue(kCLLocationAccuracyBest)];
        });
        
        it(@"should be a delegate for the location manager", ^{
            id <CLLocationManagerDelegate> delegate = viewController.locationManager.delegate;
            [[viewController should] equal:delegate];
        });
    });
    
    context(@"as the delegate for a location manager", ^{
        
        it(@"should implement locationManager: didUpdateLocations", ^{
            [[theBlock(^{
                [viewController locationManager: nil didUpdateLocations: nil];
            }) shouldNot] raise]; //an exception
        });
        
        it(@"should implement locationManager: didFailWithError", ^{
            [[theBlock(^{
                [viewController locationManager: nil didFailWithError: nil];
            }) shouldNot] raise]; //an exception
        });
        
        it(@"should implement locationManager: didUpdateHeading", ^{
            [[theBlock(^{
                [viewController locationManager: nil didUpdateHeading: nil];
            }) shouldNot] raise]; //an exception
        });
        
        it(@"should set the locationmanager's delegate to nil on dealloc", ^{
        //TODO: learn how to actually verify with Kiwi that an unsafe_unretained object is removed in dealloc
            
        });
    });
});


SPEC_END
