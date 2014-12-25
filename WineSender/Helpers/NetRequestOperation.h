//
//  NetRequestOperation.h
//  ZHCloudPropertyPM
//
//  Created by ewit song on 14/12/2.
//  Copyright (c) 2014年 song song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "MBProgressHUD.h"
@interface NetRequestOperation : NSObject{
    AFHTTPRequestOperationManager *requestOperationManager;
    MBProgressHUD *progressHUD;
    UIViewController *viewController;
}

@property(nonatomic,assign) BOOL isShowLoading;
@property(nonatomic,assign) int  timeOutSeconds;
-(instancetype)initWithViewController:(UIViewController*)Controlle;

- (void)PostRequest:(NSMutableDictionary*)parameters
     requestSuccess:(void (^)(NSString *returnObj))requestSuccess
     requestFailure:(void (^)(NSString *errorString))requestFailure;
-(void)cancelRequest;

@end
