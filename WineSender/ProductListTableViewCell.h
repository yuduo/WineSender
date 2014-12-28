//
//  ProductListTableViewCell.h
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductListModel.h"
@interface ProductListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *inPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *outPriceLabel;
-(void)updateController:(ProductListModel*)model;
@end
