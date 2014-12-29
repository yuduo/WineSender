//
//  MyJiuYouViewController.m
//  WineSender
//
//  Created by michael on 12/29/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "MyJiuYouViewController.h"
#import "JiuYouModel.h"
@interface MyJiuYouViewController ()
<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableListView;
@end

@implementation MyJiuYouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableListView.delegate = self;
    _tableListView.dataSource = self;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1],@"page",
                   [NSNumber numberWithInt:10],@"pagesize",
                   UserDefaultEntity.account,@"account",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"getList" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"userInfoCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
        NSArray *buildList=[RMMapper arrayOfClass:[JiuYouModel class] fromArrayOfDictionary:returnArray];
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
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    cell.textLabel.text = @"我的最爱";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(BOOL)checkWhetherLogin
{
    if (UserDefaultEntity.session_id.length) {
        return YES;
    }
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

@end
