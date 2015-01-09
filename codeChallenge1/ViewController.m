//
//  ViewController.m
//  codeChallenge1
//
//  Created by Tewodros Wondimu on 1/9/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *operand1TextField;
@property (weak, nonatomic) IBOutlet UITextField *operand2TextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *webBarButtonItem;
@property int result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webBarButtonItem.enabled = false;
}

// When the Calculate UIButton is pressed the result of multiplication between the two values entered in the UITextFields is displayed in the Navigation Item's title
- (IBAction)onCalculateButtonTapped:(id)sender
{
    int operand1 = [self.operand1TextField.text floatValue];
    int operand2 = [self.operand2TextField.text floatValue];
    self.result = operand1 * operand2;
    self.navigationItem.title = [NSString stringWithFormat:@"%i", self.result];

    // The web bar button item is disabled unless the result of this multiplication is a multiple of 5
    if (self.result % 5 != 0)
    {
        self.webBarButtonItem.enabled = false;
    }
    else
    {
        self.webBarButtonItem.enabled = true;
    }

    // Removes the keyboard from screen
    [self.operand1TextField resignFirstResponder];
    [self.operand2TextField resignFirstResponder];
}

#pragma mark NAVIGATION

// Send the WebViewController the Answer
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *wvc = segue.destinationViewController;
    wvc.answer = self.result;
}

@end
