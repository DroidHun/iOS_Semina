//
//  TestProtocol.h
//  ProtocolTest
//
//  Created by CrowDroid on 2013. 11. 26..
//  Copyright (c) 2013년 CrowDroidOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TestProtocol <NSObject>

@required
-(void)protocolRequiredMethod;

@optional
-(void)protocolOptionMethod;


@end
