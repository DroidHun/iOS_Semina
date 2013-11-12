//
//  ThirdViewController.m
//  Example1
//
//  Created by CrowDroid on 13. 11. 7..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Segue Event Test
-(IBAction)btnClicked:(id)sender
{
    NSLog(@"btnClicked");
}


//POPView Test
-(IBAction)backBtnClicked:(id)sender
{
    //Segue가 아닌 일반 PopViewController도 반응한다
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
