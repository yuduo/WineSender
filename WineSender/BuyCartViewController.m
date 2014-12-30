//
//  BuyCartViewController.m
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "BuyCartViewController.h"
#import "LoginViewController.h"
#import "BuyCartTableViewCell.h"
#import "BuyCardListModel.h"
@interface BuyCartViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableListView;
@property(nonatomic,strong)NSMutableArray *orderListArray;
@property (weak, nonatomic) IBOutlet UILabel *totoalLabel;
@end

@implementation BuyCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    // Do any additional setup after loading the view.
    _tableListView.delegate = self;
    _tableListView.dataSource = self;
    [_tableListView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [_tableListView addFooterWithTarget:self action:@selector(footerRereshing)];
    

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:UserDefaultEntity.zoneCode,@"zoneCode",
                   UserDefaultEntity.uid,@"uid",
                   
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"getList" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"cartCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        NSArray *buildList=[RMMapper arrayOfClass:[BuyCardListModel class] fromArrayOfDictionary:returnArray];
        _orderListArray = [[NSMutableArray alloc]initWithArray:buildList];
        [_tableListView reloadData];
        float price = 0;
        for (int i = 0; i < [_orderListArray count]; i ++) {
            BuyCardListModel *model = [_orderListArray objectAtIndex:i];
            price += (float)model.count*model.memberPrice;
        }
        _totoalLabel.text = [NSString stringWithFormat:@"%f",price] ;
    } requestFailure:^(NSString *errorString) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)headerRereshing{
    
}

-(void)footerRereshing{
    
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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_orderListArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BuyCardListModel *model = [_orderListArray objectAtIndex:indexPath.row];
    NSString *identifier = @"BuyCartTableViewCell";
    BuyCartTableViewCell* cell   = (BuyCartTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"BuyCartTableViewCell" owner:self options:nil];
        for (id oneObject in nibs) {
            if ([oneObject isKindOfClass:[BuyCartTableViewCell class]]) {
                cell = (BuyCartTableViewCell *)oneObject;
            }
        }
    }
    [cell updateController:model];
    cell.addButton.tag = indexPath.row;
    cell.cutButton.tag = indexPath.row;
    [cell.addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.cutButton addTarget:self action:@selector(cutButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)addButtonClicked:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (_orderListArray.count > button.tag) {
        BuyCardListModel *model =  [_orderListArray objectAtIndex:button.tag];
        model.count=model.count+1;
        [_orderListArray replaceObjectAtIndex:button.tag withObject:model];
    }
    [_tableListView reloadData];
}
-(void)cutButtonClicked:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (_orderListArray.count > button.tag) {
        BuyCardListModel *model =  [_orderListArray objectAtIndex:button.tag];
        if (model.count==0) {
            return;
        }
        model.count=model.count-1;
        [_orderListArray replaceObjectAtIndex:button.tag withObject:model];
    }
    [_tableListView reloadData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (IBAction)goToPayClicked:(id)sender {
}

@end
