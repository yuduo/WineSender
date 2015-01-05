//
//  MoreViewController.m
//  WineSender
//
//  Created by michael on 1/5/15.
//  Copyright (c) 2015 michael. All rights reserved.
//

#import "MoreViewController.h"
#import "ChangePasswordViewController.h"
#import "EditInformationViewController.h"
@interface MoreViewController ()
<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableListView;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"更多";
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
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 1;
            break;
        default:
            break;
    }
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.imageView.image = [UIImage imageNamed:@"mylove.png"];
                    cell.textLabel.text = @"个人资料";
                    break;
                case 1:
                    cell.imageView.image = [UIImage imageNamed:@"mylove.png"];
                    cell.textLabel.text = @"修改密码";
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    cell.imageView.image = [UIImage imageNamed:@"mylove.png"];
                    cell.textLabel.text = @"服务条款";
                    break;
                case 1:
                    cell.imageView.image = [UIImage imageNamed:@"mylove.png"];
                    cell.textLabel.text = @"检查更新";
                    break;
                case 2:
                    cell.imageView.image = [UIImage imageNamed:@"mylove.png"];
                    cell.textLabel.text = @"关于";
                    break;
                default:
                    break;
            }
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"mylove.png"];
            cell.textLabel.text = @"退出";
            break;
        default:
            break;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    EditInformationViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"EditInformationViewController"];
                    
                    [self.navigationController pushViewController:verifiCodeViewController animated:YES];
                }
                    break;
                case 1:
                    
                {
                    ChangePasswordViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ChangePasswordViewController"];

                    [self.navigationController pushViewController:verifiCodeViewController animated:YES];
                }
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    
                    break;
                case 1:
                    
                    break;
                case 2:
                    
                    break;
                default:
                    break;
            }
            break;
        case 2:
            
            break;
        default:
            break;
    }
}
@end
