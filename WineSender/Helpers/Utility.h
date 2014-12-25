//
//  Utility.h
//  ZHCloudCustomer
//
//  Created by ewit song on 14-3-24.
//  Copyright (c) 2014年 song song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Utility : NSObject
//颜色代码换
+(UIColor *) colorWithHexString: (NSString *) stringToConvert;
+(UIImage *)createSingleColorImage:(UIColor *)color andImageSize:(CGSize)size;
+(BOOL)checkTel:(NSString *)str;
+(BOOL)isValidateEmail:(NSString *)email;

+(void)makeCall:(NSString *)callName andViewController:(UIViewController *)vc;
@end

