//
//  DetailViewController.m
//  Homepwner
//
//  Created by Brent Westmoreland on 6/16/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "DetailViewController.h"
#import "CrosshairView.h"
#import "ImageStore.h"
#import "Item.h"

@implementation DetailViewController

- (void)setItem:(Item *)item
{
    _item = item;
    [self setTitle: item.itemName];
}

- (IBAction)takePicture:(UIBarButtonItem *)sender
{
    UIImagePickerController *imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.allowsEditing = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    CGRect crossHairRect = [imagePicker.view frame];
    
    imagePicker.cameraOverlayView = [[CrossHairView alloc] initWithFrame: crossHairRect];
    
    imagePicker.delegate = self;
    
    [self presentViewController: imagePicker
                       animated: YES
                     completion: nil];
}

//Implement Ch12 Silver Challenge

- (IBAction)deletePicture: (UIBarButtonItem *)sender
{
    if (self.item.imageKey) {
        [[ImageStore sharedStore] deleteImageForKey: self.item.imageKey];
        self.item.imageKey = nil;
        self.imageView.image = nil;
    }
}

//Silver Challenge

- (void)dismissKeyboard
{
    [self.view endEditing: YES];
}


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    self.imageView.image = image;
    
    CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uniqueIdString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
    
    NSString *key = (__bridge NSString *)uniqueIdString;
    
    self.item.imageKey = key;
    
    [[ImageStore sharedStore] setImage: image forKey: key];
    
    CFRelease(newUniqueId);
    CFRelease(uniqueIdString);
    
    [self dismissViewControllerAnimated: YES completion: nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad
{
    //Silver Challenge
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                          action: @selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO; //Allows other tappable areas to work
    
    [self.view addGestureRecognizer: tap];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    self.nameField.text = self.item.itemName;
    self.serialField.text = self.item.serialNumber;
    
    NSString *valueInDollars = [NSString stringWithFormat:@"%d", self.item.valueInDollars];
    self.valueField.text = valueInDollars;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    self.dateLabel.text = [dateFormatter stringFromDate: self.item.dateCreated];
    
    if (self.item.imageKey) {
        UIImage *image = [[ImageStore sharedStore] imageForKey: self.item.imageKey];
        self.imageView.image = image;
    }
    else {
        self.imageView.image = nil;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear: animated];
    
    [self.view endEditing: YES];
    
    self.item.itemName = self.nameField.text;
    self.item.serialNumber = self.serialField.text;
    self.item.valueInDollars = [self.valueField.text intValue];
}

@end
