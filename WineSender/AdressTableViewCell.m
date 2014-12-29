//
//  AdressTableViewCell.m
//  WineSender
//
//  Created by michael on 12/29/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "AdressTableViewCell.h"

@implementation AdressTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateController:(AdressModel*)model
{
    _nameLabel.text = model.people;
    _phoneLabel.text = model.mobile;
    _adressLabel.text = model.zone_name;
}
@end
