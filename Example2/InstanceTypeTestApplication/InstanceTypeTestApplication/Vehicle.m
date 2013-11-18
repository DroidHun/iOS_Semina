//
//  Vehicle.m
//  InstanceTypeTestApplication
//
//  Created by CrowDroid on 2013. 11. 18..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import "Vehicle.h"


@implementation Vehicle

//+(instancetype)VehicleWithBasement
+(id)VehicleWithBasement
{
    return [[self alloc] init];
}

@end


@implementation Car

-(void)run
{
    NSLog(@"Run");
}

@end

@implementation Bicycle

-(void)ride
{
    NSLog(@"Ride");
}

@end

@implementation Airplane

-(void)fly
{
    NSLog(@"Fly");
}

@end

