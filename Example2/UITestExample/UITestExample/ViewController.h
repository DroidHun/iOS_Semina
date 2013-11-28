//
//  ViewController.h
//  UITestExample
//
//  Created by CrowDroid on 2013. 11. 25..
//  Copyright (c) 2013년 CrowDroidOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AlertViewDelegateTest;

@interface ViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    @public
    AlertViewDelegateTest *alertViewDelegateTest;
}

@property (strong) IBOutlet UITextField *textField;

-(IBAction)btnClicked:(id)sender;

@end
