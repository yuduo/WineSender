//
//  RegistViewController.m
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "RegistViewController.h"
#import "VerifiCodeViewController.h"
#import "TSMessage.h"
@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册";
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
    if (_phoneTextField.text.length<1) {
        [TSMessage showNotificationWithTitle:@"请输入您的账号" type:TSMessageNotificationTypeWarning];
        return;
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:@"2",@"type",
                   @"h2yAndroidRegister",@"mCode",
                   _phoneTextField.text,@"account",
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
            VerifiCodeViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"verifiCodeViewController"];
            verifiCodeViewController.account =_phoneTextField.text;
            [self.navigationController pushViewController:verifiCodeViewController animated:YES];
        }
       
    } requestFailure:^(NSString *errorString) {
        
    }];
}

@end
