//
//  LoginViewController.m
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "TSMessage.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    // Do any additional setup after loading the view.
    _phoneTextField.text = @"15838279930";
    _passwordTextField.text = @"123456";
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
    if (_passwordTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入您的密码" type:TSMessageNotificationTypeWarning];
        return;
    }
    if (_phoneTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入您的账号" type:TSMessageNotificationTypeWarning];
        return;
    }
    NSArray *data = [NSArray arrayWithObjects:@{@"gid":@52,@"gcount":@1},@{@"gid":@82,@"gcount":@2}, nil];
    NSDictionary *localData = [NSDictionary dictionaryWithObjectsAndKeys:data,@"data",@"410100000",@"zoneCode", nil];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:_passwordTextField.text,@"password",
                   _phoneTextField.text,@"account",
                   localData,@"localData",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"login" forKey:@"METHOD_NAME"];
    [dic setValue:@"" forKey:@"SESSION_ID"];
    [dic setValue:@"loginCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        
        NSDictionary *dic = (NSDictionary*)returnObj;
        UserDefaultEntity.session_id = [dic valueForKey:@"SESSION_ID"];
        UserDefaultEntity.uid = [[dic valueForKey:@"OBJECT_DATA"] valueForKey:@"id"];
        UserDefaultEntity.zoneCode = [[dic valueForKey:@"OBJECT_DATA"] valueForKey:@"zone"];
        UserDefaultEntity.account = [[dic valueForKey:@"OBJECT_DATA"] valueForKey:@"account"];
        if (UserDefaultEntity.zoneCode == nil) {
            UserDefaultEntity.zoneCode = @"410100000";
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    } requestFailure:^(NSString *errorString) {
        
    }];
}
- (IBAction)forgetPasswordButtonClicked:(id)sender {
}

@end
