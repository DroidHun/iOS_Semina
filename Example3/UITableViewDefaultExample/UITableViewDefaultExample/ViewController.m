//
//  ViewController.m
//  UITableViewDefaultExample
//
//  Created by CrowDroid on 2014. 1. 2..
//  Copyright (c) 2014년 CrowDroidOrganization. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dataArray = [@[@[@"1", @"2"]] mutableCopy];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dataArray count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Header";
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"Footer";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[dataArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSLog(@"new one");
    }
    else
    {
        NSLog(@"old one");
    }
    
    NSString *dataString = [[dataArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:dataString];
    
    return cell;
    
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return @[@"Header"];
//}

//Edit Style 지정
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{            return UITableViewCellEditingStyleDelete;
            //return UITableViewCellEditingStyleInsert;
}
//Move
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSLog(@"moveRowAtIndexPath");
    id sourceObj = [[dataArray objectAtIndex:[sourceIndexPath section]] objectAtIndex:[sourceIndexPath row]];
    id dstObj = [[dataArray objectAtIndex:[destinationIndexPath section]] objectAtIndex:[destinationIndexPath row]];
    
    [[dataArray objectAtIndex:[sourceIndexPath section]] replaceObjectAtIndex:[sourceIndexPath row] withObject:dstObj];
    [[dataArray objectAtIndex:[destinationIndexPath section]] replaceObjectAtIndex:[destinationIndexPath row] withObject:sourceObj];
}

//Long click Menu
- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//Copy, paste 지원
- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    return action == @selector(copy:) || action == @selector(paste:);
}

//Menu Action
- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    if (action == @selector(copy:)) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = [[dataArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    }
    else if (action == @selector(paste:))
    {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [[dataArray objectAtIndex:[indexPath section]] insertObject:
         [NSString stringWithFormat:@"PASTED : %@", pasteboard.string] atIndex:[indexPath row]];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
@end
