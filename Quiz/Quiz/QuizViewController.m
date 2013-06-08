//
//  ViewController.m
//  Quiz
//
//  Created by Brent Westmoreland on 6/5/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (strong, nonatomic) NSMutableArray *questions;
@property (strong, nonatomic) NSMutableArray *answers;

@end

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.questions[0] = @"What is 7 + 7?";
        self.answers[0] = @"14";
        
        self.questions[1] = @"What is the capital of vermont?";
        self.answers[1] = @"Montpelier";
        
        self.questions[2] = @"From what is Cognac made?";
        self.answers[2] = @"Grapes";
    }
    return self;
}



#pragma mark question/answer methods

- (IBAction)showQuestion:(id)sender
{
    self.currentQuestionIndex += 1;
    
    if (self.currentQuestionIndex == self.questions.count) {
        self.currentQuestionIndex = 0;
    }
    
    self.questionLabel.text = self.questions[self.currentQuestionIndex];
    
    self.answerLabel.text = @"???";
    
}

- (IBAction)showAnswer:(id)sender
{
    self.answerLabel.text = self.answers[self.currentQuestionIndex];
}

#pragma mark @property declarations

- (NSMutableArray *)questions
{
    if (!_questions){
        _questions = [NSMutableArray array];
    }
    return _questions;
}

- (NSMutableArray *)answers
{
    if (!_answers){
        _answers = [NSMutableArray array];
    }
    return _answers;
}

#pragma mark View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
