//
//  DiscoverViewController.m
//  WineSender
//
//  Created by michael on 12/28/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "DiscoverViewController.h"
#import "LoginViewController.h"
#import "MyLoveViewController.h"
@interface DiscoverViewController ()
<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableListView;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableListView.delegate = self;
    _tableListView.dataSource = self;
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

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = @"我的最爱";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self checkWhetherLogin]) {
        
        
        MyLoveViewController *loginViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"MyLoveViewController"];
        [self.navigationController pushViewController:loginViewController animated:YES];
    }else
    {
        LoginViewController *loginViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.navigationController pushViewController:loginViewController animated:YES];
    }
}
-(BOOL)checkWhetherLogin
{
    if (UserDefaultEntity.session_id.length) {
        return YES;
    }
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

@end
