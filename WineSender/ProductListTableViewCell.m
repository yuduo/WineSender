//
//  ProductListTableViewCell.m
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "ProductListTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation ProductListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateController:(ProductListModel*)model
{
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:[@"http://fp.jydapp.com:82/fp/image/show.htm?path=" stringByAppendingString: model.furl]] placeholderImage:[UIImage imageNamed:@"no_image.9.png"]];
    _titleLabel.text = model.name;
    _inPriceLabel.text = [NSString stringWithFormat:@"%f", model.memberPrice];
    _outPriceLabel.text = [NSString stringWithFormat:@"%f",model.marketPrice];
}
@end
