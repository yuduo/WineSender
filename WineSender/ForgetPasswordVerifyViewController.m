//
//  ForgetPasswordVerifyViewController.m
//  WineSender
//
//  Created by michael on 12/30/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "ForgetPasswordVerifyViewController.h"
#import "ForgetPasswordViewController.h"
#import "TSMessage.h"
@interface ForgetPasswordVerifyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation ForgetPasswordVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"获取验证码";
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
- (IBAction)nextStepButtonClicked:(id)sender {
    if (self.phoneTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入您的账号" type:TSMessageNotificationTypeWarning];
        return;
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:@"2",@"type",
                   @"h2yAndroidRegister",@"mCode",
                   self.phoneTextField.text,@"account",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"mobileCode" forKey:@"METHOD_NAME"];
    [dic setValue:@"" forKey:@"SESSION_ID"];
    [dic setValue:@"loginCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSDictionary *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        NSInteger res = [[returnArray valueForKey:@"result"]integerValue];
        if (res) {
            ForgetPasswordViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ForgetPasswordViewController"];
            verifiCodeViewController.account =self.phoneTextField.text;
            [self.navigationController pushViewController:verifiCodeViewController animated:YES];
        }
        
    } requestFailure:^(NSString *errorString) {
        
    }];
}

@end
