//
//  ViewController.m
//  UITestExample
//
//  Created by CrowDroid on 2013. 11. 25..
//  Copyright (c) 2013년 CrowDroidOrganization. All rights reserved.
//

#import "ViewController.h"
#import "AlertViewDelegateTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    alertViewDelegateTest = [[AlertViewDelegateTest alloc] init];
    
    
    [[[UIAlertView alloc] initWithTitle:@"Title"
                                message:@"Message"
                               delegate:self
                      cancelButtonTitle:@"Cancel"
                      otherButtonTitles:@"first",nil] show];
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnClicked:(id)sender
{
    NSString *message = self.textField.text;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"AlertTitle" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", @"Second",@"Third", nil];
    [alert show];
    //[alert dismissWithClickedButtonIndex:0 animated:YES];
    
}

#pragma mark -
#pragma mark UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //버튼이 눌렸을 경우에 호출되는 메서드
    NSLog(@"clickedButtonAtIndex");
    NSString *message = [NSString stringWithFormat:@"Self \nButtonIndex : %d", buttonIndex];
    [[[UIAlertView alloc] initWithTitle:@"Title"
                                message:message
                               delegate:alertViewDelegateTest
                      cancelButtonTitle:@"Cancel"
                      otherButtonTitles:nil] show];
}



-(BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    //AlertView의 첫번째 Other Button을 활성화 할 것인지에 대한 여부
    NSLog(@"alertViewShouldEnableFirstOtherButton");
    return NO;
}

-(void)willPresentAlertView:(UIAlertView *)alertView
{
    //AlertView가 화면에 보이기 전에 호출되는 메서드
    NSLog(@"willPresentAlertView");
}

-(void)didPresentAlertView:(UIAlertView *)alertView
{
    //AlertView가 화면에 보인 후에 호출되는 메서드
    NSLog(@"didPresentAlertView");
}

-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //AlertView가 화면에서 사라지기 전에 호출되는 메서드
    NSLog(@"willDismissWithButtonIndex");
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //AlertView가 화면에서 사라진 후에 호출되는 메서드
    NSLog(@"didDismissWithButtonIndex");
}

-(void)alertViewCancel:(UIAlertView *)alertView
{
    //AlertView를 System에서 Dismiss한 경우에 불리는 메서드
    //User의 Cancel Btn Click하고는 연관이 없다.
    NSLog(@"alertViewCancel");
}


@end
