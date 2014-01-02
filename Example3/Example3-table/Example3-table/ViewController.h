//
//  ViewController.h
//  Example3-table
//
//  Created by CrowDroid on 2013. 12. 19..
//  Copyright (c) 2013년 CrowDroidOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *dataArray;
}

@property (nonatomic, strong) IBOutlet UINavigationItem *tableViewNavItem;
@property (nonatomic, strong) IBOutlet UITableView *testTableView;;

@end
