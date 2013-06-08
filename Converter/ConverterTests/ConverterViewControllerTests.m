//
//  ConverterViewControllerTests.m
//  UCI-Converter-Intro
//
//  Created by Brent Westmoreland on 4/17/13.
//
//

#import "ConverterViewControllerTests.h"
#import "ConverterViewController.h"

@interface ConverterViewControllerTests(){
    NSString *thirtyTwoDegrees;
    NSString *zeroDegrees;
}

@property (strong, nonatomic) ConverterViewController *converterViewController;

@end


@implementation ConverterViewControllerTests

- (void)setUp
{
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    self.converterViewController = [storyboard instantiateViewControllerWithIdentifier:@"ConverterViewController"];
    [self.converterViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    thirtyTwoDegrees = @"32.00";
    zeroDegrees = @"0.00";
    
}

- (void)tearDown
{
    [super tearDown];
    self.converterViewController = nil;
}

- (void)testThatConverterViewControllerCanBeInstantiated
{
    STAssertNotNil(self.converterViewController, @"the ConverterViewController should be able to be instantiated");
}

- (void)testThatTextboxFahrenheitCanBeSet
{
    self.converterViewController.textboxFahrenheit.text = thirtyTwoDegrees;
    STAssertEqualObjects(self.converterViewController.textboxFahrenheit.text, thirtyTwoDegrees,
                         @"The fahrenheit textfield should be able to be set");
}

- (void)testThatTextboxCelsiusCanBeSet
{
    self.converterViewController.textboxCelsius.text = zeroDegrees;
    STAssertEqualObjects(self.converterViewController.textboxCelsius.text, zeroDegrees,
                         @"The celsius textfield should be able to be set");
}

- (void)testThatConvertCelsiusConvertsTemperatureProperly
{
    self.converterViewController.textboxFahrenheit.text = @"Tom";
    self.converterViewController.textboxCelsius.text = zeroDegrees;
    [self.converterViewController calculateFahrenheit];
    STAssertEqualObjects(self.converterViewController.textboxFahrenheit.text, thirtyTwoDegrees,
                         @"Zero degrees celsius should equal thirtyTwo degrees fahrenheit");
}

- (void)testThatConvertFahrentheitConvertsTemperatureProperly
{
    self.converterViewController.textboxCelsius.text = @"Bob";
    self.converterViewController.textboxFahrenheit.text = thirtyTwoDegrees;
    [self.converterViewController calculateCelsius];
    STAssertEqualObjects(self.converterViewController.textboxCelsius.text, zeroDegrees,
                         @"Thirty two degrees celsius should equal zero degrees fahrenheit");
}



@end
