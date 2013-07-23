//
//  TipViewController.h
//  tipster
//
//  Created by Timothy Lee on 7/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *billTextField;
@property (nonatomic, weak) IBOutlet UILabel *tipLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalLabel;
@property (nonatomic, weak) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onDoneButton;

@end
