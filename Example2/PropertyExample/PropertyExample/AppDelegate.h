//
//  AppDelegate.h
//  PropertyExample
//
//  Created by CrowDroid on 2013. 11. 21..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    
    //Mapping Test
    NSString *_retainCustomString;
    NSString *_strongCustomString;
    
    NSString *readOnlyString;
    NSString *copyString;
}

-(void)retainCustomSetter:(NSString *)obj;
-(void)strongCustomSetter:(NSString *)obj;
-(void)copyStringSetter:(NSString *)obj;
-(NSString *)readreadOnly;

@property (assign) IBOutlet NSWindow *window;

//Test
@property (retain) NSString *retainString;
@property (assign) NSString *assignString;

@property (strong) NSString *strongString;
@property (weak) NSString *weakString;

@property (nonatomic, copy, setter = copyStringSetter:) NSString *copyString;


@property (nonatomic, retain, setter = retainCustomSetter:) NSString *retainCustomSetterString;
@property (nonatomic, strong, setter = strongCustomSetter:) NSString *strongCustomSetterString;

@property (readonly, getter = readreadOnly) NSString *readOnlyString;



@end
