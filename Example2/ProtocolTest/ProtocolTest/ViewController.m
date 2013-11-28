//
//  ViewController.m
//  ProtocolTest
//
//  Created by CrowDroid on 2013. 11. 26..
//  Copyright (c) 2013년 CrowDroidOrganization. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark TestProcotol

-(void)protocolRequiredMethod
{
    NSLog(@"RequiredMethod");
}

-(void)protocolOptionMethod
{
    NSLog(@"protocolOptionMethod");
}

@end
