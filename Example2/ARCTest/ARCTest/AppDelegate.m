//
//  AppDelegate.m
//  ARCTest
//
//  Created by CrowDroid on 2013. 11. 21..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
//    NSString *constString = @"AutoReleased!";
    
    NSString *autoReleasedStringOut = nil;
    //[NSString stringWithFormat:@"%@", @"Auto Released!"];
    @autoreleasepool {
        NSString *autoReleasedStringIn = [NSString stringWithFormat:@"%@", @"AutoReleased"];
        NSLog(@"in pool : %@, RetainCount : 2", autoReleasedStringIn);
        //Retain++
        autoReleasedStringOut = autoReleasedStringIn;
        NSLog(@"in pool : Assign, RetainCount : 3");
    }
    NSLog(@"out pool : %@, RetainCount : 1", autoReleasedStringOut);
    
    
    NSString *str = [[NSString alloc] initWithFormat:@"%@", @"ARC, Bridge Test"];
    //Error!
    //[str release];

    //CF로 책임 옮김
    CFStringRef cfStr = CFBridgingRetain(str);
    NSLog(@"%@", cfStr);
    //카운트 처리
    CFRelease(cfStr);
    
    CFStringRef cfNsStr = CFSTR("CFString!");
    //ARC 적용
    NSString *nsCfStr = CFBridgingRelease(cfNsStr);
    NSLog(@"%@", nsCfStr);
}

@end
