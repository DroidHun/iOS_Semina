//
//  Vehicle.h
//  InstanceTypeTestApplication
//
//  Created by CrowDroid on 2013. 11. 18..
//  Copyright (c) 2013년 CrowDroid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject
+(instancetype)VehicleWithBasement;
//+(id)VehicleWithBasement;
@end

@interface Bicycle : Vehicle
-(void)ride;
@end

@interface Car : Vehicle
-(void)run;
@end

@interface Airplane : Vehicle
-(void)fly;
@end

