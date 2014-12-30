//
//  ForgetPasswordViewController.m
//  WineSender
//
//  Created by michael on 12/30/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "TSMessage.h"
@interface ForgetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *verfyCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgainTextField;

@end

@implementation ForgetPasswordViewController

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
- (IBAction)submitButtonClicked:(id)sender {
    if (_verfyCodeTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入验证码" type:TSMessageNotificationTypeWarning];
        return;
    }
    if (_passwordTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入密码" type:TSMessageNotificationTypeWarning];
        return;
    }
    if (_passwordAgainTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入密码" type:TSMessageNotificationTypeWarning];
        return;
    }
    if (![_passwordAgainTextField.text isEqualToString:_passwordTextField.text]) {
        [TSMessage showNotificationWithTitle:@"密码不一致" type:TSMessageNotificationTypeWarning];
        return;
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:
                   @"2",@"type",
                   _verfyCodeTextField.text,@"vCode",
                   @"h2yAndroidRegister",@"mCode",
                   self.account,@"account",
                   _passwordTextField.text,@"nPwd",
                   _passwordTextField.text,@"sPwd",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"resetPw" forKey:@"METHOD_NAME"];
    [dic setValue:@"" forKey:@"SESSION_ID"];
    [dic setValue:@"loginCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        NSInteger res = [[returnArray valueForKey:@"result"]integerValue];
        switch (res) {
            case 1:
                [self.navigationController popToRootViewControllerAnimated:YES];
                break;
            case 2:
                [TSMessage showNotificationWithTitle:@"重设用户不存在" type:TSMessageNotificationTypeWarning];
                break;
            case 3:
                [TSMessage showNotificationWithTitle:@"验证码失效" type:TSMessageNotificationTypeWarning];
                break;
            case 4:
                [TSMessage showNotificationWithTitle:@"验证码错误" type:TSMessageNotificationTypeWarning];
                break;
            case 5:
                [TSMessage showNotificationWithTitle:@"新密码和确认密码不一致" type:TSMessageNotificationTypeWarning];
                break;
            
            default:
                break;
        }
        
    } requestFailure:^(NSString *errorString) {
        
    }];
}

@end
