//
//  AppDelegate.m
//  ReferenceCountTest1
//
//  Created by CrowDroid on 2013. 11. 17..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

typedef struct {
    int aInt;
    float aFloat;
    NSString *string;
}Ext;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
     //   ruct exStruct str;
    Ext a;
    
    
    CFBridgingRetain(<#id X#>)
    
    CFBridgingRelease(<#CFTypeRef X#>)
    
    
    
    id obj = [[NSObject alloc] init];
    NSLog(@"[Reference Count test] First Alloc : %lu\n", [obj retainCount]);
    
    [obj retain];
    NSLog(@"[Reference Count test] retain : %lu\n", [obj retainCount]);
    [obj retain];
    NSLog(@"[Reference Count test] retain : %lu\n", [obj retainCount]);
    [obj retain];
    NSLog(@"[Reference Count test] retain : %lu\n", [obj retainCount]);
    
    [obj release];
    NSLog(@"[Reference Count test] release : %lu\n", [obj retainCount]);
    [obj release];
    NSLog(@"[Reference Count test] release : %lu\n", [obj retainCount]);
    [obj release];
    NSLog(@"[Reference Count test] release : %lu\n", [obj retainCount]);
    
    [obj release];
    //Error!
    //NSLog(@"[Reference Count test] release : %lu\n", [obj retainCount]);
    
    
    id pool = [[NSAutoreleasePool alloc] init];
    
    obj = [[[NSObject alloc] init] autorelease];
    NSLog(@"[Reference Count test] autorelase - First Alloc : %lu\n", [obj retainCount]);
    //Error!
    //[obj release];
    
    [pool release];
    
    [NSString stringWithFormat:@"%D", 11];
   
    @autoreleasepool {
        NSLog(@"[Reference Count test] autorelease - First Alloc : %lu\n", [obj retainCount]);
    }

    
    
//    // Insert code here to initialize your application
//    NSMutableString *consoleString = [[NSMutableString alloc] init];
//    id obj = [[NSObject alloc] init];
//    [consoleString appendFormat:@"[Reference Count test] First Alloc : %lu\n", [obj retainCount]];
//    [[self textView] setString:consoleString];
//    
//    [obj retain];
//    [consoleString appendFormat:@"[Reference Count test] retain : %lu\n", [obj retainCount]];
//    [[self textView] setString:consoleString];
//    [obj retain];
//    [consoleString appendFormat:@"[Reference Count test] retain : %lu\n", [obj retainCount]];
//    [[self textView] setString:consoleString];
//    [obj retain];
//    [consoleString appendFormat:@"[Reference Count test] retain : %lu\n", [obj retainCount]];
//    [[self textView] setString:consoleString];
//
//    [obj release];
//    [consoleString appendFormat:@"[Reference Count test] release : %lu\n", [obj retainCount]];
//    [[self textView] setString:consoleString];
//    [obj release];
//    [consoleString appendFormat:@"[Reference Count test] release : %lu\n", [obj retainCount]];
//    [[self textView] setString:consoleString];
//    [obj release];
//    [consoleString appendFormat:@"[Reference Count test] release : %lu\n", [obj retainCount]];
//    [[self textView] setString:consoleString];
//
//    [obj release];
//    //Error!
//    //[consoleString appendFormat:@"[Reference Count test] release : %lu\n", [obj retainCount]];
//    //[[self textView] setString:consoleString];

}

-(void) check
{

    

}

@end
