//
//  PeopleViewController.m
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "PeopleViewController.h"
#import "LoginViewController.h"
#import "ListTableViewCell.h"
#import "OrderListViewController.h"
#import "MyJiuYouViewController.h"
#import "CheckInViewController.h"
#import "AdressManageViewController.h"
@interface PeopleViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableListView;

@end

@implementation PeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的酒运达";
    _tableListView.delegate = self;
    _tableListView.dataSource = self;
//    UserDefaultEntity.session_id =@"0880bc2e-996f-4833-bd31-6793afc90c60";
//    UserDefaultEntity.uid = @"123";
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


#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
            break;
        default:
            break;
    }
    return 6;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"ListTableViewCell";
    ListTableViewCell* cell   = (ListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"ListTableViewCell" owner:self options:nil];
        for (id oneObject in nibs) {
            if ([oneObject isKindOfClass:[ListTableViewCell class]]) {
                cell = (ListTableViewCell *)oneObject;
            }
        }
    }
    switch (indexPath.section) {
        case 0:
            cell.iconImageView.image = [UIImage imageNamed:@"android_personel_quickly_order.png"];
            cell.titleLabel.text = @"订单查询";
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                    cell.iconImageView.image = [UIImage imageNamed:@"j_friend.png"];
                    cell.titleLabel.text = @"我的J友";
                    break;
                case 1:
                    cell.iconImageView.image = [UIImage imageNamed:@"android_my_jd_wallet.png"];
                    cell.titleLabel.text = @"签到领豆";
                    break;
            }
        }
            break;
        case 2:
            cell.iconImageView.image = [UIImage imageNamed:@"android_my_jd_easy_mananger.png"];
            cell.titleLabel.text = @"地址管理";
            break;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            OrderListViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"OrderListViewController"];
            [self.navigationController pushViewController:verifiCodeViewController animated:YES];
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    MyJiuYouViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"MyJiuYouViewController"];
                    [self.navigationController pushViewController:verifiCodeViewController animated:YES];
                }
                    break;
                case 1:
                {
                    CheckInViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"CheckInViewController"];
                    [self.navigationController pushViewController:verifiCodeViewController animated:YES];
                }
                    break;
            }
        }
            break;
        case 2:
        {
            AdressManageViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"AdressManageViewController"];
            [self.navigationController pushViewController:verifiCodeViewController animated:YES];
        }
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (IBAction)moreButtonClicked:(id)sender {
    
}

@end
