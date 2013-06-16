//
//  QuizViewControllerSpec.m
//  Quiz
//
//  Created by Brent Westmoreland on 6/6/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "Kiwi.h"
#import "QuizViewController.h"

@interface QuizViewController (TestingExtensions)

@property (nonatomic) int currentQuestionIndex;
@property (strong, nonatomic) NSMutableArray *questions;
@property (strong, nonatomic) NSMutableArray *answers;

@end


SPEC_BEGIN(QuizViewControllerSpec)

QuizViewController * (^quizVC)(void) = ^QuizViewController *(void)  {
    QuizViewController *tempViewController = [[QuizViewController alloc] initWithNibName:@"QuizView"
                                                                                  bundle: nil];
    
    UILabel *questionLabel = [[UILabel alloc] init];
    UILabel *answerLabel = [[UILabel alloc] init];
    [tempViewController.view addSubview: questionLabel];
    [tempViewController.view addSubview: answerLabel];
    tempViewController.questionLabel = questionLabel;
    tempViewController.answerLabel = answerLabel;
    
    return tempViewController;
};

describe(@"Quiz View Controller", ^{
    __block QuizViewController *viewController;
    
    beforeAll(^{
        
    });
    
    beforeEach(^{ // Occurs before each enclosed "it"        
        viewController = quizVC();
        viewController.questionLabel.text = @"";
    });
    
    afterEach(^{ // Occurs after each enclosed "it"
        viewController = nil;
    });
    
    context(@"on launch", ^{
        it(@"should have a question index", ^{
            [[theValue(viewController.currentQuestionIndex) should] equal:0
                                                                withDelta:0.1];
        });
        it(@"should have a questions array", ^{
            [viewController.questions shouldNotBeNil];
            [[viewController.questions should] beKindOfClass:[NSMutableArray class]];
        });
        it(@"should have an answers array", ^{
            [viewController.answers shouldNotBeNil];
            [[viewController.answers should] beKindOfClass:[NSMutableArray class]];
        });
        it(@"should contain an equal number of items in the questions and answers arrays", ^{
            [[theValue(viewController.questions.count) should] equal:theValue(viewController.answers.count)];
        });
        it(@"should have a question label", ^{
            [viewController.questionLabel shouldNotBeNil];
            [[viewController.questionLabel.text should] equal:@""];
        });
    });
    context(@"after the show questions button is pressed", ^{
        beforeEach(^{ // Occurs before each enclosed "it"
            [viewController showQuestion: nil];
        });
        it(@"should increment the current question index", ^{
            [[theValue(viewController.currentQuestionIndex) should] equal:1
                                                                withDelta:0.1];
        });
        it(@"should show a question in the quesionLabel", ^{
            [[viewController.questionLabel.text should] equal:viewController.questions[viewController.currentQuestionIndex]];
        });
        it(@"should not go beyond the bounds of the array", ^{
            [[theBlock(^{
                [viewController showQuestion: nil];
                [viewController showQuestion: nil];
            }) shouldNot] raiseWithName: NSRangeException];
        });
        it(@"should set the answer label back to ???", ^{
            [[viewController.answerLabel.text should] equal:@"???"];
        });
    });
    context(@"after the show answers button is pressed", ^{
        beforeEach(^{ // Occurs before each enclosed "it"
            [viewController showAnswer: nil];
        });
        it(@"should show the answer text in the answerLabel", ^{
            NSString *answer = viewController.answers[viewController.currentQuestionIndex];
            [[viewController.answerLabel.text should] equal:answer];
        });
    });
});

SPEC_END
