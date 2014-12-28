//
//  ImageViewTableViewCell.h
//  WineSender
//
//  Created by michael on 12/28/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleScrollView.h"
@interface ImageViewTableViewCell : UITableViewCell
@property(nonatomic,strong)CycleScrollView *cycScrollView;
-(void)updateController:(NSArray*)imageArray;
@end
