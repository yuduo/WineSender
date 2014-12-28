//
//  OrderListTableViewCell.m
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "OrderListTableViewCell.h"

@implementation OrderListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateController:(OrderListModel*)model
{
    _cellNumber.text = model.orderNo;
    _orderPriceLabel.text = model.goodsAmount;
    _orderTimeLabel.text = model.createDate;
    _orderAdressLabel.text = [NSString stringWithFormat:@"%@   %@   %@",model.receiveName,model.memberMobile,model.receiveAddress];
    _orderStatusLabel.text = model.flagValue;
}
@end
