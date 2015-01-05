//
//  OrderListModel.h
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderListModel : NSObject
@property(nonatomic,strong)NSString*  id;
@property(nonatomic,strong)NSString* orderFlag;
@property(nonatomic,strong)NSString* orderNo;
@property(nonatomic,assign)int goodsAmount;
@property(nonatomic,strong)NSString* flagValue;
@property(nonatomic,strong)NSString* receiveName;
@property(nonatomic,strong)NSString* receiveAddress;
@property(nonatomic,strong)NSString* memberMobile;
@property(nonatomic,strong)NSString* memberName;
@property(nonatomic,strong)NSString* createDate;
@end
