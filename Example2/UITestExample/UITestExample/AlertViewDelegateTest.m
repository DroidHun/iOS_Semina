//
//  AlertViewDelegateTest.m
//  UITestExample
//
//  Created by CrowDroid on 2013. 11. 25..
//  Copyright (c) 2013년 CrowDroidOrganization. All rights reserved.
//

#import "AlertViewDelegateTest.h"

@implementation AlertViewDelegateTest


#pragma mark -
#pragma mark UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSString *message = [NSString stringWithFormat:@"Delegate Test \nButtonIndex : %d", buttonIndex];
    [[[UIAlertView alloc] initWithTitle:@"Title" message:message
                               delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil] show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Dismiss test");
}


@end
