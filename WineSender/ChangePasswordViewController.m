//
//  ChangePasswordViewController.m
//  WineSender
//
//  Created by michael on 1/5/15.
//  Copyright (c) 2015 michael. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "TSMessage.h"
@interface ChangePasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldTextField;
@property (weak, nonatomic) IBOutlet UITextField *newpassTextField;

@property (weak, nonatomic) IBOutlet UITextField *repeatNewTextField;

@end

@implementation ChangePasswordViewController

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
- (IBAction)changePassButtonClicked:(id)sender {
    if (_oldTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入旧密码" type:TSMessageNotificationTypeWarning];
        return;
    }
    if (_newpassTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入密码" type:TSMessageNotificationTypeWarning];
        return;
    }
    if (_repeatNewTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入密码" type:TSMessageNotificationTypeWarning];
        return;
    }
    if (![_newpassTextField.text isEqualToString:_repeatNewTextField.text]) {
        [TSMessage showNotificationWithTitle:@"密码不一致" type:TSMessageNotificationTypeWarning];
        return;
    }
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:
                   UserDefaultEntity.uid,@"uid",
                   _newpassTextField.text,@"sPwd",
                   _repeatNewTextField.text,@"nPwd",
                   _oldTextField.text,@"oPwd",
                   
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"modifyPw" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"loginCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        NSInteger res = [[returnArray valueForKey:@"result"]integerValue];
        switch (res) {
            case 1:
                [self.navigationController popToRootViewControllerAnimated:YES];
                break;
            default:
                [TSMessage showNotificationWithTitle:@"失败" type:TSMessageNotificationTypeWarning];
                break;
                
        }
        
    } requestFailure:^(NSString *errorString) {
        
    }];

}

@end
