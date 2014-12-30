//
//  BuyCardListModel.h
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuyCardListModel : NSObject
@property(nonatomic,strong)NSString*  fid;
@property(nonatomic,assign )int count;
@property(nonatomic,assign)int gid;
@property(nonatomic,assign)float memberPrice;
@property(nonatomic,assign)int cid;
@property(nonatomic,assign)float version;
@property(nonatomic,strong)NSString*  furl;
@property(nonatomic,strong)NSString*  name;
@end
