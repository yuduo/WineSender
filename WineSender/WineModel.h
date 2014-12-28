//
//  WineModel.h
//  WineSender
//
//  Created by michael on 12/28/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WineModel : NSObject
@property(nonatomic,assign)NSInteger fid ;
@property(nonatomic,strong)NSString* spec ;
@property(nonatomic,strong)NSString* id ;
@property(nonatomic,assign)float member_price;
@property(nonatomic,assign)float market_price;
@property(nonatomic,strong)NSString* mobile_comment;
@property(nonatomic,assign)NSInteger inventory ;
@property(nonatomic,strong)NSString* name ;
@property(nonatomic,strong)NSString* number ;
@property(nonatomic,strong)NSString* furl ;
@end
