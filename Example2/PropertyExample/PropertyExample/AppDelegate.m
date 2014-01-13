//
//  AppDelegate.m
//  PropertyExample
//
//  Created by CrowDroid on 2013. 11. 21..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize retainString;
@synthesize assignString;
@synthesize strongString;
@synthesize weakString;

@synthesize retainCustomSetterString = _retainCustomString;
@synthesize strongCustomSetterString = _strongCustomString;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    //Retain ++
    [self setRetainString:@"retainString"];
    NSLog(@"%@",[self retainString]);
    
    //Retain Change X
    [self setAssignString:@"assignString"];
    NSLog(@"%@",[self assignString]);

    //ARC! , __strong, ownerShip ok
    [self setStrongString:@"strongString"];
    NSLog(@"%@",[self strongString]);

    //ARC! , __weak, ownerShip No.
    [self setWeakString:@"weakString"];
    NSLog(@"%@",[self weakString]);
    
    //Custom Setter. NON-ARC Style
    [self retainCustomSetter:@"retainCustomSetterString"];
    NSLog(@"%@", self.retainCustomSetterString);
    self.retainCustomSetterString = @"retainCustomSetterStringDot.";
    NSLog(@"%@",[self retainCustomSetterString]);
    
    //Custom Setter. ARC
    [self strongCustomSetter:@"strongCustomSetterString"];
    NSLog(@"%@", self.strongCustomSetterString);
    self.strongCustomSetterString = @"strongCustomSetterStringDot.";
    NSLog(@"%@", [self strongCustomSetterString]);
    
    //Error!
    //[self setReadOnlyString];
    NSLog(@"%@", self.readOnlyString);
}


//Non-Arc Style
-(void)retainCustomSetter:(NSString *)obj
{
    if(_retainCustomString != obj)
    {
        //[_retainCustomString release];
        //_retainCustomString =  [obj retain];
    }
}

//Arc-Style
-(void)strongCustomSetter:(NSString *)obj
{
    _strongCustomString = obj;
}

//Copy
-(void)copyStringSetter:(NSString *)obj
{
    
    //NON-ARC
    if(copyString!=obj){
    //    [copyString release];
        copyString = [obj copy];
    }
    
    //ARC
    //copyString = [obj copy];
   
}


//ReadOnly
-(NSString *)readreadOnly
{
    return readOnlyString;
}


@end
