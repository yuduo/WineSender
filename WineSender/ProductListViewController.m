//
//  ProductListViewController.m
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductDetailViewController.h"
@interface ProductListViewController ()

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"列表";
    // Do any additional setup after loading the view.
    _tableListView.delegate = self;
    _tableListView.dataSource = self;
    [_tableListView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [_tableListView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:@"410100000",@"zoneCode",
                   _typeId,@"typeId",
                   [NSNumber numberWithInt:10],@"pagesize",
                   [NSNumber numberWithInt:1],@"page",
                   @"",@"keyWord",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"getList" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"productCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        NSArray *buildList=[RMMapper arrayOfClass:[ProductListModel class] fromArrayOfDictionary:returnArray];
        _orderListArray = [[NSMutableArray alloc]initWithArray:buildList];
        [_tableListView reloadData];
    } requestFailure:^(NSString *errorString) {
        
    }];

}
-(void)headerRereshing{
    
}

-(void)footerRereshing{
    
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
    
    return [_orderListArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductListModel *model = [_orderListArray objectAtIndex:indexPath.row];
    NSString *identifier = @"ProductListTableViewCell";
    ProductListTableViewCell* cell   = (ProductListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"ProductListTableViewCell" owner:self options:nil];
        for (id oneObject in nibs) {
            if ([oneObject isKindOfClass:[ProductListTableViewCell class]]) {
                cell = (ProductListTableViewCell *)oneObject;
            }
        }
    }
    [cell updateController:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductListModel *model = [_orderListArray objectAtIndex:indexPath.row];
    ProductDetailViewController *loginViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
    loginViewController.gid = model.id;
    loginViewController.vid = model.version;
    [self.navigationController pushViewController:loginViewController animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
@end
