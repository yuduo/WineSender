//
//  PictureModel.h
//  WineSender
//
//  Created by michael on 12/28/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PictureModel : NSObject
@property(nonatomic,strong)NSString *ADVERT_NAME;
@property(nonatomic,strong)NSString *COLUMN_NAME;
@property(nonatomic,assign)NSInteger SUBJECT_ID;
@property(nonatomic,assign)NSInteger ID;
@property(nonatomic,strong)NSString *PATH;
@property(nonatomic,strong)NSString *TYPE;

@end
