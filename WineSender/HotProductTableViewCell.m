//
//  HotProductTableViewCell.m
//  WineSender
//
//  Created by michael on 12/29/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "HotProductTableViewCell.h"
#import "ProductListModel.h"
#import "UIImageView+WebCache.h"
@implementation HotProductTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateController:(NSArray*)array
{
    if ([array count] == 3) {
        {
            ProductListModel *model = [array objectAtIndex:0];
            [_iconImageView1 sd_setImageWithURL:[NSURL URLWithString:[@"http://fp.jydapp.com:82/fp/image/show.htm?path=" stringByAppendingString: model.furl]] placeholderImage:[UIImage imageNamed:@"no_image.9.png"]];
            _nameLabel1.text = model.name;
            
        }
        {
            ProductListModel *model = [array objectAtIndex:1];
            [_iconImageView2 sd_setImageWithURL:[NSURL URLWithString:[@"http://fp.jydapp.com:82/fp/image/show.htm?path=" stringByAppendingString: model.furl]] placeholderImage:[UIImage imageNamed:@"no_image.9.png"]];
            _nameLabel2.text = model.name;
        }
        {
            ProductListModel *model = [array objectAtIndex:2];
            [_iconImageView3 sd_setImageWithURL:[NSURL URLWithString:[@"http://fp.jydapp.com:82/fp/image/show.htm?path=" stringByAppendingString: model.furl]] placeholderImage:[UIImage imageNamed:@"no_image.9.png"]];
            _nameLabel3.text = model.name;
        }
    }
}
@end
