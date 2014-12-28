//
//  OrderListTableViewCell.h
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListModel.h"
@interface OrderListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellNumber;
@property (weak, nonatomic) IBOutlet UILabel *orderPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderAdressLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderStatusLabel;
@property (weak, nonatomic) IBOutlet UIButton *orderFollowButton;
-(void)updateController:(OrderListModel*)model;
@end
