//
//  UCIViewController.h
//  UCI-Converter-Intro
//
//  Created by Ralf Brockhaus on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface ConverterViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *textboxFahrenheit;
@property (nonatomic, strong) IBOutlet UITextField *textboxCelsius;

-(void)calculateCelsius;
-(void)calculateFahrenheit;

@end
