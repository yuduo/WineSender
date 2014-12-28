//
//  SecondViewController.m
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "SecondViewController.h"
#import "ProductListViewController.h"
@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableListView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableListView.delegate = self;
    _tableListView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"白酒";
            break;
        case 1:
            cell.textLabel.text = @"红酒";
            break;
        case 2:
            cell.textLabel.text = @"啤酒";
            break;
        case 3:
            cell.textLabel.text = @"洋酒";
            break;
        case 4:
            cell.textLabel.text = @"其它";
            break;
        case 5:
            cell.textLabel.text = @"最新资讯";
            break;
        default:
            break;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //白酒52 红酒53 啤酒54 洋酒55 其他57
    NSString *typeid;
    switch (indexPath.row) {
        case 0:
            typeid =@"52";
            break;
        case 1:
            typeid =@"53";
            break;
        case 2:
            typeid =@"54";
            break;
        case 3:
            typeid =@"55";
            break;
        case 4:
            typeid =@"57";
            break;
        case 5:
            
            break;
        default:
            break;
    }
    
    ProductListViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ProductListViewController"];
    verifiCodeViewController.typeId = typeid;
    [self.navigationController pushViewController:verifiCodeViewController animated:YES];
}

@end
