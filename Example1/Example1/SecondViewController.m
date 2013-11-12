//
//  SecondViewController.m
//  Example1
//
//  Created by CrowDroid on 13. 11. 7..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

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
    NSLog(@"SecondViewDidLoad");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backBtnClicked:(id)sender
{
    NSLog(@"backClicked");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"PrepareForSegueInSecond");
    NSLog(@"%@",[segue identifier]);
    
    UINavigationController *navigationController = segue.destinationViewController;
    UIViewController *naviRootViewController = (UIViewController *)[navigationController topViewController];
    [naviRootViewController setTitle:@"Navi!"];

}


@end
