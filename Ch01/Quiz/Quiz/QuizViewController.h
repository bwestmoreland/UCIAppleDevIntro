//
//  ViewController.h
//  Quiz
//
//  Created by Brent Westmoreland on 6/5/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;


@end
