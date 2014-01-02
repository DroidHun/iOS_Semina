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

@synthesize tableViewNavItem;


//For EditMode.
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.testTableView setEditing:editing animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [tableViewNavItem setLeftBarButtonItem:self.editButtonItem];
    
    
    NSString *dataPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, 0)[0] stringByAppendingPathComponent:@"tableData.plist"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if(![manager isReadableFileAtPath:dataPath]){NSLog(@"not Found");};
    
    
    NSArray *dataArray2  = [NSArray arrayWithContentsOfFile:dataPath];
    if(dataArray2 == nil)
    {
        NSLog(@"File not found.");
    }
    
    //NSURL *url = [NSURL URLWithString:@"file://localhost/Users/CrowDroid/Desktop/Plist.plist"];
    //dataArray = [[NSMutableArray alloc] initWithContentsOfURL:url];
    dataArray = [@[
                   [@[@"1", @"2", @"3"] mutableCopy],
                   [@[@"1", @"2", @"3"] mutableCopy],
                   [@[@"1", @"2", @"3"] mutableCopy],
                   [@[@"1", @"2", @"3"] mutableCopy]
                   ] mutableCopy];
    
    
    for (int i=0; i < [dataArray count]; i++)
    {
        NSMutableArray *subArray = [dataArray objectAtIndex:i];
        for (int k=0; k < [subArray count]; k++)
        {
            [subArray replaceObjectAtIndex:k withObject:
             k % 2 > 0 ? @"여\n러\n줄\n텍\n스\n트\n입\n니\n다. 긴긴 텍스트!" : @"짧은 1줄 텍스트지요."];
        }
    }
    
    //
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDelegate

//입력 반응
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"TablePush" sender:self];
}

//Height Row, Section, Footer
//Height를 계산한다.
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *dataString = [[dataArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:17], NSParagraphStyleAttributeName:paragraphStyle};
    CGSize size = [dataString boundingRectWithSize:CGSizeMake(320, 1000) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                        attributes:attributes  context:nil].size;
    
    return size.height + 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 55.f;
}

//Customo Header, Custom Footer
//UIDataSource의 메서드들과 합쳐서 데이터를 가져오고, 그에 따른 뷰를 구성하면 된다.
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 55)];
    NSString *headerTitle = [self tableView:self.testTableView titleForHeaderInSection:section];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.f, 10.f, 300, 25)];
    [headerLabel setText:headerTitle];
    [headerLabel setTextColor:[UIColor whiteColor]];
    [view addSubview:headerLabel];
    [view setBackgroundColor:[UIColor blackColor]];
    return view;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 55)];
    NSString *footerTitle = [self tableView:self.testTableView titleForFooterInSection:section];
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.f, 10.f, 300, 25)];
    [footerLabel setText:footerTitle];
    [footerLabel setTextColor:[UIColor whiteColor]];
    [view addSubview:footerLabel];
    [view setBackgroundColor:[UIColor redColor]];
    return view;
}

//Edit Style 지정
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
            return UITableViewCellEditingStyleDelete;
            break;
        case 1:
            return UITableViewCellEditingStyleInsert;
            break;
        default:
            return UITableViewCellEditingStyleNone;
            break;
    }
}

//Delete Title 지정
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"DeletionTitle!?";
}

//EditMode - indentation
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO ;
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


- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Single Editting Mode");
}
- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Single Editting Ended");
}

#pragma mark -
#pragma mark UITableView DataSource

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
    static NSString *tableIdentifier = @"CustomCell";
    
    //iOS 5 - Story Board - Prototype Cell 사용 이후부터는 cell이 nil인 경우가 없음
	CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    //[[cell dataLabel] setText:[[dataArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]]];
    
    //iOS 5 - Story Board 사용 이전 방식 - xib Load
    if (cell == nil) {
		cell = [[[NSBundle mainBundle] loadNibNamed:@"xib file name" owner:self options:nil] objectAtIndex:0];
	}
    
    NSString *dataString = [[dataArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    [[cell dataLabel] setText:dataString];
    
    NSLog(@"%@", [[cell dataLabel] text]);
    
    
    [indexPath row] % 2 == 0 ?    [cell setBackgroundColor:[UIColor magentaColor]]
                                : [cell setBackgroundColor:[UIColor grayColor]] ;
    
    return cell;
    
}

//Insert Button, Deletion Button 클릭 시 발동
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"commitEditingStyle");
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [[dataArray objectAtIndex:[indexPath section]] removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        [[dataArray objectAtIndex:[indexPath section]] insertObject:@"inserted" atIndex:[indexPath row]];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
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


//Quick Index
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"1",@"2",@"3"];
}


@end
