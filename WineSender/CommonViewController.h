//
//  CommonViewController.h
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetRequestOperation.h"
@interface CommonViewController : UIViewController
@property(nonatomic,strong) NetRequestOperation *netWorkOperation;
@end
