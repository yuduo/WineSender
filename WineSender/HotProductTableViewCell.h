//
//  HotProductTableViewCell.h
//  WineSender
//
//  Created by michael on 12/29/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotProductTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView3;
@property (weak, nonatomic) IBOutlet UITextField *nameLabel1;
@property (weak, nonatomic) IBOutlet UITextField *nameLabel2;
@property (weak, nonatomic) IBOutlet UITextField *nameLabel3;
-(void)updateController:(NSArray*)array;
@end
