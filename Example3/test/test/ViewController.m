//
//  ViewController.m
//  test
//
//  Created by CrowDroid on 2014. 1. 3..
//  Copyright (c) 2014년 CrowDroidOrganization. All rights reserved.
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
- (IBAction)hello:(id)sender {
    [self.lbl setText:@"Hello, World!"];
    self.lbl.text = @"Hello,World";
}

@end
