//
//  ViewController.m
//  SortMedian
//
//  Created by Brian Salinas on 10/5/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import "ViewController.h"
#import "ResultsView.h"
#include "Algorithms.h"

static NSString *defaultText = @"Touch here";
static NSString *placeHolderText = @"Enter list of numbers seperated by a space";

@interface ViewController () <UITextFieldDelegate>
@property (readwrite, nonatomic)UITextField *tField;
@property (readwrite, nonatomic)ResultsView *results;
@end

@implementation ViewController
{
    Algorithms *algorithms;
    vector<int> sortArray;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSArray *iList = [textField.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    sortArray.clear();
    for (NSString *numStr in iList) {
        NSNumber *number = [formatter numberFromString:numStr];
        if (number) sortArray.push_back([number intValue]);
    }
    
    NSLog(@"textFieldShouldReturn items: %ld", sortArray.size());
    
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldEndEditing: %@", textField.text);
    
    //    [textField resignFirstResponder];
    //    return sortArray.size() == 0 ? NO : YES;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidEndEditing");
    if (sortArray.size()) {
        vector<int> sortedList = algorithms->iSort(&sortArray[0], sortArray.size());
        // build the string to display
        
        vector<int>::iterator cur;
        for (cur = sortedList.begin(); cur != sortedList.end(); ++cur) {
            NSLog(@"...%d", *cur);
        }
    }
    [textField setPlaceholder:@"start over"];
}





// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    //    NSDictionary* info = [aNotification userInfo];
    //    NSLog(@"keyboardWasShown: %@", info);
    NSLog(@"keyboardWasShown");
    [_tField setPlaceholder:placeHolderText];
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    NSLog(@"keyboardWillBeHidden");
    [_tField setText:@""];
}

#define TEXTFIELD_HEIGHT 40.0
#define Y_TOP_COMPONENT 40.0
#define PORTRAIT_TEXT_WIDTH 200.0
#define LANDSCAPE_TEXT_WIDTH 360.0

- (void)buildTextField
{
    CGRect rect = CGRectMake(60.0,
                             Y_TOP_COMPONENT,
                             PORTRAIT_TEXT_WIDTH,
                             TEXTFIELD_HEIGHT);
    _tField = [[UITextField alloc] initWithFrame:rect];
    _tField.clearsOnBeginEditing = YES;
    _tField.delegate = self;
    
    _tField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _tField.returnKeyType = UIReturnKeyDone;
    _tField.borderStyle = UITextBorderStyleBezel;
    _tField.backgroundColor = [UIColor whiteColor];
    
    //    tView.background = [UIImage imageNamed:@"bg.png"];
    
    [_tField setText:defaultText];
    [_tField setPlaceholder:placeHolderText];
    [_tField setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:18]];
    [_tField setAdjustsFontSizeToFitWidth:YES];
    [_tField setTextColor:[UIColor darkTextColor]];
    [_tField setTextAlignment:UITextAlignmentCenter];
    [self.view addSubview:_tField];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    void (^transitionFrame)();
    transitionFrame = ^{
        if ((toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
            (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)) {
            self.tField.frame = CGRectMake(60.0,
                                           Y_TOP_COMPONENT,
                                           LANDSCAPE_TEXT_WIDTH,
                                           TEXTFIELD_HEIGHT);
            self.results.frame = CGRectMake(60.0,
                                            Y_TOP_COMPONENT + TEXTFIELD_HEIGHT + 20.0,
                                            LANDSCAPE_TEXT_WIDTH,
                                            120.0);
        } else {
            self.tField.frame = CGRectMake(60.0,
                                           Y_TOP_COMPONENT,
                                           PORTRAIT_TEXT_WIDTH,
                                           TEXTFIELD_HEIGHT);
            self.results.frame = CGRectMake(60.0,
                                            Y_TOP_COMPONENT + TEXTFIELD_HEIGHT + 20.0,
                                            PORTRAIT_TEXT_WIDTH,
                                            120.0);
        }
    };
    
    [UIView transitionWithView:self.tField
                      duration:duration
                       options:nil
                    animations:transitionFrame
                    completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerForKeyboardNotifications];
    [self buildTextField];
    
    algorithms = new Algorithms();
    _results = [[ResultsView alloc] initWithFrame:CGRectMake(60.0,
                                                             Y_TOP_COMPONENT + TEXTFIELD_HEIGHT + 20.0,
                                                             PORTRAIT_TEXT_WIDTH,
                                                             120.0)];
    _results.autoresizesSubviews = YES;
    [self.view addSubview:_results];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    delete algorithms;
}

@end
