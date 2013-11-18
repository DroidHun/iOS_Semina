//
//  ViewController.h
//  Example1
//
//  Created by CrowDroid on 13. 11. 6..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
{
    
}

@property (nonatomic, retain) IBOutlet UIButton *testButton;
@property (nonatomic, retain) IBOutlet UILabel *testLabel;



-(IBAction)btnClicked:(id)sender;

//Segue를 실행시키기 위한 Event 메서드 
-(IBAction)segueBtnClicked:(id)sender;

//ib에서 작성한 Segue Event Test를 위한 메서드
-(IBAction)ibSegueBtnClicked:(id)sender;

@end
