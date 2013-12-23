//
//  ViewController.m
//  Example3-table
//
//  Created by CrowDroid on 2013. 12. 19..
//  Copyright (c) 2013년 CrowDroidOrganization. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"file://localhost/Users/CrowDroid/Desktop/Plist.plist"];
    dataArray = [[NSMutableArray alloc] initWithContentsOfURL:url];
    
    
    //
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma UITableView Delegate


-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"TablePush" sender:self];
}

#pragma mark -
#pragma UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dataArray count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Header";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[dataArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"CustomCell";
    
	CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    [[cell dataLabel] setText:[[dataArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]]];
    
    return cell;
    
}

@end
