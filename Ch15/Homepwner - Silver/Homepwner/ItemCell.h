//
//  ItemCell.h
//  Homepwner
//
//  Created by Brent Westmoreland on 6/20/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//
#import "BaseCell.h"

@interface ItemCell : BaseCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;


- (IBAction)showImage:(UIButton *)sender;

@end
