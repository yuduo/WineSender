//
//  Common.h
//  ZHCloudProperty
//
//  Created by chenbin on 14-8-19.
//  Copyright (c) 2014年 song song. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )

//RGB
#define RGBA(r,g,b,a)				    [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

//导航栏背景
#define NavitionBarBackgroundImg        (SYSTEM_VERSION >=7.0)?@"bg_top_64.png":@"bg_top_44.png"

//使用宏定义方式判断是否为iphone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//ios7 屏幕从导航栏开始计算
#define AdaptationIOS7      if([[[UIDevice currentDevice] systemVersion] floatValue]>=7) {self.edgesForExtendedLayout = UIRectEdgeNone;}


#define AppDelegateEntity               ((AppDelegate *)[UIApplication sharedApplication].delegate)



#define IS_TABBAR_IS_HIDDEN (([UIScreen mainScreen].bounds.size.height - self.tabBarController.tabBar.frame.origin.y) != 49)

#define ARIALFONT(s) [UIFont fontWithName:@"Arial" size:(s)]
#define RGBCOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define M_PI        3.14159265358979323846264338327950288   /* pi             */
#define M_PI_2      1.57079632679489661923132169163975144   /* pi/2           */

#define SUPPORT_IOS8 0
