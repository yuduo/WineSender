//
//  BuyCartViewController.m
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "BuyCartViewController.h"

@interface BuyCartViewController ()

@end

@implementation BuyCartViewController

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
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([self checkWhetherLogin]) {
        //login
    }else
    {
        
    }
}
-(BOOL)checkWhetherLogin
{
    return NO;
}
@end
