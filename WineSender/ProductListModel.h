//
//  ProductListModel.h
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductListModel : NSObject
@property(nonatomic,strong)NSString*  id;
@property(nonatomic,assign)float marketPrice;
@property(nonatomic,strong)NSString* mobileComment;
@property(nonatomic,strong)NSString* inventory;
@property(nonatomic,strong)NSString* name;
@property(nonatomic,strong)NSString* furl;
@property(nonatomic,assign)float memberPrice;
@property(nonatomic,strong)NSString* unitsId;
@property(nonatomic,strong)NSString* version;

@end
