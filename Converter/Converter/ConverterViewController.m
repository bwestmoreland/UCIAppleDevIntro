//
//  UCIViewController.m
//  UCI-Converter-Intro
//
//  Created by Ralf Brockhaus on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConverterViewController.h"

@implementation ConverterViewController



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.textboxFahrenheit.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textboxCelsius.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) calculateCelsius{
    float fFahrenheit = [self.textboxFahrenheit.text floatValue];
    self.textboxCelsius.text = [NSString stringWithFormat:@"%1.2f", (fFahrenheit-32)/9*5];

}

-(void) calculateFahrenheit {
    float fCelsius = [self.textboxCelsius.text floatValue];
    self.textboxFahrenheit.text =  [NSString stringWithFormat:@"%1.2f", fCelsius *9 / 5 +32];
}


-(BOOL) textFieldShouldReturn:(UITextField *) theTextField {
    
    if(theTextField == self.textboxFahrenheit) {
        [self.textboxFahrenheit resignFirstResponder];
        [self calculateCelsius];
    }
    
    if(theTextField == self.textboxCelsius) {
        [self.textboxCelsius resignFirstResponder];
        [self calculateFahrenheit];
    }
    
    return TRUE;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)viewDidUnload {
    [self setTextboxFahrenheit:nil];
    [super viewDidUnload];
}
@end
