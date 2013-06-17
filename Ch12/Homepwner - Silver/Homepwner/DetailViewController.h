//
//  DetailViewController.h
//  Homepwner
//
//  Created by Brent Westmoreland on 6/16/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//
@class Item;

@interface DetailViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@property (strong, nonatomic) Item *item;

- (IBAction)takePicture:(UIBarButtonItem *)sender;
- (IBAction)deletePicture:(UIBarButtonItem *)sender;

@end
