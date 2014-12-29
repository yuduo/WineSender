//
//  CheckInViewController.m
//  WineSender
//
//  Created by michael on 12/29/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "CheckInViewController.h"

@interface CheckInViewController ()

@end

@implementation CheckInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)checkInButtonClicked:(id)sender {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"type",
                   UserDefaultEntity.uid,@"uid",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"sign" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"pointCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
        
    } requestFailure:^(NSString *errorString) {
        
    }];
}

@end
