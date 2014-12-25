//
//  LoginViewController.m
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

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
- (IBAction)registButtonClicked:(id)sender {
    RegistViewController *registViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"RegistViewController"];
    [self.navigationController pushViewController:registViewController animated:YES];
}
- (IBAction)loginButtonClicked:(id)sender {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:@"123456",@"password",
                   @"15838279930",@"account",
                   @"",@"localData",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"login" forKey:@"METHOD_NAME"];
    [dic setValue:@"" forKey:@"SESSION_ID"];
    [dic setValue:@"loginCommand" forKey:@"BEAN_NAME"];
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        
    } requestFailure:^(NSString *errorString) {
        
    }];
}

@end
