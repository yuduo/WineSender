//
//  NetRequestOperation.m
//  ZHCloudPropertyPM
//
//  Created by ewit song on 14/12/2.
//  Copyright (c) 2014年 song song. All rights reserved.
//

#import "NetRequestOperation.h"

#import "ServiceCode.h"
#define TIMEOUTSECONDS 30
@implementation NetRequestOperation

-(instancetype)initWithViewController:(UIViewController*)Controlle{
    
    self = [super init];
    if (self) {
        requestOperationManager=[[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:SERVICE_URL]];
        viewController=Controlle;
        self.isShowLoading=YES;
        self.timeOutSeconds=TIMEOUTSECONDS;
    }
    return self;
}

- (void)PostRequest:(NSMutableDictionary*)parameters
            requestSuccess:(void (^)(NSString *returnObj))requestSuccess
            requestFailure:(void (^)(NSString *errorString))requestFailure
{
    if (self.isShowLoading) {
        [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];

    }
    NSError *parseError = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:parameters  options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *str =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    __block UIViewController *vc=viewController;

    requestOperationManager.requestSerializer.timeoutInterval=self.timeOutSeconds;
    [requestOperationManager POST:SERVICE_URL parameters:str  success:^(AFHTTPRequestOperation *operation, id responseObject) {
          [MBProgressHUD hideAllHUDsForView:vc.view animated:YES];
        NSDictionary *responseDictionary=responseObject;
        NSString *errorCode=[responseDictionary objectForKey:@"errorCode"];
        NSString *errorMessage=[responseDictionary objectForKey:@"errorMessage"];
        NSString *returnObj=[responseDictionary objectForKey:@"returnObj"];

//        if ([errorCode isEqualToString:SUCCESS_RESULT_CODE]) {
            requestSuccess(responseDictionary);

//        }else{
//            
//            if (![errorMessage isKindOfClass:[NSNull class]]&&errorMessage!=nil&&![errorMessage isEqualToString:@""]) {
//                requestFailure([responseDictionary objectForKey:@"errorMessage"]);
//            }else{
//                requestFailure(@"返回数据异常！");
//
//            }
//        }

        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
        {
          [MBProgressHUD hideAllHUDsForView:vc.view animated:YES];
        NSLog(@"%@",error.description);
           requestFailure(@"网络连接异常！");
    }];
}

-(void)cancelRequest{
    [requestOperationManager.operationQueue cancelAllOperations];
}

@end
