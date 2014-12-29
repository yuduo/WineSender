//
//  AdressManageViewController.m
//  WineSender
//
//  Created by michael on 12/29/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "AdressManageViewController.h"
#import "AdressModel.h"
#import "AddAdressTableViewCell.h"
#import "AdressTableViewCell.h"
#import "AddAdressTableViewCell.h"
#import "AdressTableViewCell.h"
@interface AdressManageViewController ()
<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableListView;
@property(strong,nonatomic)NSMutableArray *listArray;
@end

@implementation AdressManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableListView.delegate = self;
    _tableListView.dataSource = self;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:UserDefaultEntity.zoneCode,@"zoneCode",
                   UserDefaultEntity.uid,@"uid",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"getList" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"addressCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
        _listArray=[[NSMutableArray alloc]initWithArray: [RMMapper arrayOfClass:[AdressModel class] fromArrayOfDictionary:returnArray]];
        [_tableListView reloadData];
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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_listArray count]+1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            NSString *identifier = @"AddAdressTableViewCell";
            AddAdressTableViewCell* cell   = (AddAdressTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"AddAdressTableViewCell" owner:self options:nil];
                for (id oneObject in nibs) {
                    if ([oneObject isKindOfClass:[AddAdressTableViewCell class]]) {
                        cell = (AddAdressTableViewCell *)oneObject;
                    }
                }
            }
            [cell.addAdressButton addTarget:self action:@selector(addAdressToServer) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
            break;
          default:
        {
            NSString *identifier = @"AdressTableViewCell";
            AdressTableViewCell* cell   = (AdressTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"AdressTableViewCell" owner:self options:nil];
                for (id oneObject in nibs) {
                    if ([oneObject isKindOfClass:[AdressTableViewCell class]]) {
                        cell = (AdressTableViewCell *)oneObject;
                    }
                }
            }
            [cell updateController:[_listArray objectAtIndex:indexPath.row-1]];
            return cell;
        }
            break;
        
    }
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
-(void)addAdressToServer
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:UserDefaultEntity.zoneCode,@"zoneCode",
                   UserDefaultEntity.uid,@"uid",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"getList" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"addressCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
        _listArray=[[NSMutableArray alloc]initWithArray: [RMMapper arrayOfClass:[AdressModel class] fromArrayOfDictionary:returnArray]];
        [_tableListView reloadData];
    } requestFailure:^(NSString *errorString) {
        
    }];
}
@end
