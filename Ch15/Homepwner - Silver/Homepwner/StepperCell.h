//
//  StepperCell.h
//  Homepwner
//
//  Created by Brent Westmoreland on 6/22/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//
#import "BaseCell.h"

@interface StepperCell : BaseCell


@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

- (IBAction)changeValue:(UIStepper *)sender;

@end
