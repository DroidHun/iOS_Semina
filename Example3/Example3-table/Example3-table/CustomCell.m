//
//  CustomCell.m
//  Example3-table
//
//  Created by CrowDroid on 2013. 12. 19..
//  Copyright (c) 2013년 CrowDroidOrganization. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize dataLabel;
@synthesize keyLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
