//
//  ViewController.m
//  Example1
//
//  Created by CrowDroid on 13. 11. 6..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize testButton;
@synthesize testLabel;

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

-(IBAction)btnClicked:(id)sender
{
    //sender example - sender가 testButton이라면
    if(sender == [self testButton]){
        NSLog(@"Clicked");
        //
        [testLabel setText:@"Clicked!"];
    }
}

-(IBAction)segueBtnClicked:(id)sender
{
    NSLog(@"segueBtnClicked");
    [self performSegueWithIdentifier:@"EventSegue" sender:self];
}

-(IBAction)ibSegueBtnClicked:(id)sender
{
    NSLog(@"idSegueBtnClicked");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"PrepareForSegueInFirst");
    NSLog(@"%@",[segue identifier]);
}



@end
