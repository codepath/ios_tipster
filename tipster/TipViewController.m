//
//  TipViewController.m
//  tipster
//
//  Created by Timothy Lee on 7/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (nonatomic, strong) NSArray *tipAmounts;

- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
        self.tipAmounts = @[@(0.1), @(0.15), @(0.2)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.billTextField.delegate = self;
    
    [self.tipControl addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventValueChanged];
    self.tipControl.selectedSegmentIndex = 1;
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    [self updateValues];
    
    return YES;
}

#pragma mark - Private methods

- (void)onDoneButton {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float tipPercentage = [self.tipAmounts[self.tipControl.selectedSegmentIndex] floatValue];
    
    float bill = [self.billTextField.text floatValue];
    float tip = tipPercentage * bill;
    float total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", total];
}

@end
