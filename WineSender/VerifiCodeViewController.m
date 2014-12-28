//
//  VerifiCodeViewController.m
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "VerifiCodeViewController.h"

@interface VerifiCodeViewController ()

@end

@implementation VerifiCodeViewController

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
- (IBAction)reSendVerfiCode:(id)sender {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:@"2",@"type",
                   @"h2yAndroidRegister",@"mCode",
                   @"18662302973",@"account",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"mobileCode" forKey:@"METHOD_NAME"];
    [dic setValue:@"" forKey:@"SESSION_ID"];
    [dic setValue:@"loginCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        
    } requestFailure:^(NSString *errorString) {
        
    }];
}
- (IBAction)sendVerfiCodeButtonClicked:(id)sender {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:
                   @"2",@"type",
                   @"868023",@"vCode",
                   @"h2yAndroidRegister",@"mCode",
                   @"18662302973",@"account",
                   @"868023",@"pwd",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"register" forKey:@"METHOD_NAME"];
    [dic setValue:@"" forKey:@"SESSION_ID"];
    [dic setValue:@"loginCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    } requestFailure:^(NSString *errorString) {
        
    }];
}

@end
