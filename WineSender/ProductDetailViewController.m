//
//  ProductDetailViewController.m
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "WineModel.h"
#import "MarkModel.h"
#import "ImageViewTableViewCell.h"
#import "ImageModel.h"
@interface ProductDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    WineModel *wineModel;
    NSArray *imageUrlArray;
    NSArray *markList;
}
@property (weak, nonatomic) IBOutlet UILabel *cartCoutLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableListView;
@property(nonatomic,strong)NSMutableArray *orderListArray;
@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableListView.delegate = self;
    self.tableListView.dataSource = self;
    [self.tableListView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [self.tableListView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:@"410100000",@"zoneCode",
                   self.vid,@"vid",
                   self.gid,@"gid",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"getDetail" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"productCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSDictionary *dic2 = [dic valueForKey:@"JSON_DATA"];
        
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
//        NSDictionary *dic2 = [returnArray objectAtIndex:0];
        NSArray *tags = [returnArray valueForKey:@"tags"];
        NSDictionary *wine = [returnArray valueForKey:@"wine"];
        NSArray *imgs =[returnArray valueForKey:@"imgs"];
        wineModel = [[WineModel alloc]init];
        
        wineModel.fid =[[wine valueForKey:@"fid"]integerValue];
        wineModel.spec =[wine valueForKey:@"fid"];
        
        wineModel.member_price=[[wine valueForKey:@"member_price"]floatValue];
        wineModel.market_price=[[wine valueForKey:@"market_price"]floatValue];
        wineModel.mobile_comment=[wine valueForKey:@"mobile_comment"];
        wineModel.inventory=[[wine valueForKey:@"inventory"]floatValue] ;
        wineModel.name =[wine valueForKey:@"name"];
        wineModel.number =[wine valueForKey:@"number"];
        wineModel.furl=[wine valueForKey:@"furl"];
//        NSArray *buildList=[RMMapper objectWithClass:[WineModel class] fromDictionary:wine];
        markList=[RMMapper arrayOfClass:[MarkModel class] fromArrayOfDictionary:tags];
        
        imageUrlArray = [RMMapper arrayOfClass:[ImageModel class] fromArrayOfDictionary:imgs];
        [self.tableListView reloadData];
    } requestFailure:^(NSString *errorString) {
        
    }];

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
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return [markList count];
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        default:
            break;
    }
    return [_orderListArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    NSString *identifier = @"ImageViewTableViewCell";
                    ImageViewTableViewCell* cell   = (ImageViewTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
                    if (cell == nil) {
                        NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"ImageViewTableViewCell" owner:self options:nil];
                        for (id oneObject in nibs) {
                            if ([oneObject isKindOfClass:[ImageViewTableViewCell class]]) {
                                cell = (ImageViewTableViewCell *)oneObject;
                            }
                        }
                    }
                    [cell updateController:imageUrlArray];
                    return cell;
                }
                    
                    break;
                case 1:
                    cell.textLabel.text = [NSString stringWithFormat:@"%@  %f",wineModel.name,wineModel.member_price];
                    break;
                case 2:
                    cell.textLabel.text = [NSString stringWithFormat:@"库存:  %@",wineModel.number];
                    break;
                default:
                    break;
            }
            break;
        case 1:
        {
            MarkModel* model = [markList objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@:  %@",model.mark_n,model.mark_v];
        }
            break;
        case 2:
            cell.textLabel.text = @"商品信息";
            break;
        case 3:
            cell.textLabel.text = @"商品评价";
            break;
        default:
            break;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (IBAction)addToCartButtonClicked:(id)sender {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    NSArray *data = [NSArray arrayWithObjects:@{@"gid":self.gid,@"gcount":@1}, nil];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:UserDefaultEntity.zoneCode,@"zoneCode",
                   data,@"data",
                   UserDefaultEntity.uid ,@"uid",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"add" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"cartCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
    } requestFailure:^(NSString *errorString) {
        
    }];

}

@end
