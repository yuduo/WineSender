//
//  HomeViewController.m
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "HomeViewController.h"
#import "ProductListViewController.h"
#import "PictureModel.h"
#import "ProductListModel.h"
#import "HotProductTableViewCell.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *whiteArray;
    NSMutableArray *redArray;
    NSMutableArray *yangArray;
}
@property (weak, nonatomic) IBOutlet UIButton *baijiuButton;
@property (weak, nonatomic) IBOutlet UIButton *hongjiuButton;
@property (weak, nonatomic) IBOutlet UIButton *pijiuButton;
@property (weak, nonatomic) IBOutlet UIButton *yangjiuButton;
@property (weak, nonatomic) IBOutlet UIButton *qitaButton;
@property (weak, nonatomic) IBOutlet UIButton *rexiaoButton;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UITableView *hotTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [[_baijiuButton layer] setBorderColor:[[UIColor grayColor] CGColor ]];
    [[_hongjiuButton layer] setBorderColor:[[UIColor grayColor] CGColor ]];
    [[_pijiuButton layer] setBorderColor:[[UIColor grayColor] CGColor ]];
    [[_yangjiuButton layer] setBorderColor:[[UIColor grayColor] CGColor ]];
    [[_qitaButton layer] setBorderColor:[[UIColor grayColor] CGColor ]];
    [[_rexiaoButton layer] setBorderColor:[[UIColor grayColor] CGColor ]];
    
    [[_baijiuButton layer] setBorderWidth:1.0];
    [[_hongjiuButton layer] setBorderWidth:1.0];
    [[_pijiuButton layer] setBorderWidth:1.0];
    [[_yangjiuButton layer] setBorderWidth:1.0];
    [[_qitaButton layer] setBorderWidth:1.0];
    [[_rexiaoButton layer] setBorderWidth:1.0];
    
    _hotTableView.delegate = self;
    _hotTableView.dataSource = self;
    
    // Do any additional setup after loading the view.
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:UserDefaultEntity.zoneCode,@"zoneCode",
                   
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"getList" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"logoPicCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        NSArray *buildList=[RMMapper arrayOfClass:[PictureModel class] fromArrayOfDictionary:returnArray];
        
        
    } requestFailure:^(NSString *errorString) {
        
    }];
    
    [self getHotList:52];
    [self getHotList:53];
    [self getHotList:55];
    _hotTableView.contentSize = CGSizeMake(self.view.frame.size.width, 400);
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 800);

}
-(void)getHotList:(int)typeID
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:3],@"pagesize",
                   [NSNumber numberWithInt:1],@"page",
                   [NSNumber numberWithInt:typeID],@"typeId",
                   UserDefaultEntity.zoneCode,@"zoneCode",
                   nil] forKey:@"POST_DATA"];
    [dic setValue:@"getList" forKey:@"METHOD_NAME"];
    [dic setValue:UserDefaultEntity.session_id forKey:@"SESSION_ID"];
    [dic setValue:@"productCommand" forKey:@"BEAN_NAME"];
    
    [self.netWorkOperation PostRequest:dic requestSuccess:^(NSString *returnObj) {
        NSLog(@"returnObj--%@",returnObj);
        NSDictionary *dic = (NSDictionary*)returnObj;
        if([dic valueForKey:@"JSON_DATA"] == nil)
        {
            return ;
        }
        NSArray *returnArray=[NSJSONSerialization JSONObjectWithData:[[dic valueForKey:@"JSON_DATA"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:nil];
        
        switch (typeID) {
            case 52:
            {
                NSArray *buildList=[RMMapper arrayOfClass:[ProductListModel class] fromArrayOfDictionary:returnArray];
                whiteArray = [[NSMutableArray alloc]initWithArray:buildList];
            }
                break;
            case 53:
            {
                NSArray *buildList=[RMMapper arrayOfClass:[ProductListModel class] fromArrayOfDictionary:returnArray];
                redArray = [[NSMutableArray alloc]initWithArray:buildList];
            }
                break;
            case 55:
            {
                NSArray *buildList=[RMMapper arrayOfClass:[ProductListModel class] fromArrayOfDictionary:returnArray];
                yangArray = [[NSMutableArray alloc]initWithArray:buildList];
            }
                break;
            default:
                break;
        }
        [_hotTableView reloadData];
        
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
- (IBAction)productListButtonClicked:(id)sender {
    UIButton *button = (UIButton*)sender;
    NSInteger tag = button.tag;
    
    //白酒52 红酒53 啤酒54 洋酒55 其他57
    NSString *typeid;
    switch (tag) {
        case 1:
            typeid =@"52";
            break;
        case 2:
            typeid =@"53";
            break;
        case 3:
            typeid =@"54";
            break;
        case 4:
            typeid =@"55";
            break;
        case 5:
            typeid =@"57";
            break;
        case 6:
            
            break;
        case 7://热销
            typeid =@"52";
            break;
        case 8:
            typeid =@"53";
            break;
        case 9:
            typeid =@"55";
            break;
        default:
            break;
    }
    
    ProductListViewController *verifiCodeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ProductListViewController"];
    verifiCodeViewController.typeId = typeid;
    [self.navigationController pushViewController:verifiCodeViewController animated:YES];

}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = @"HotProductTableViewCell";
    HotProductTableViewCell* cell   = (HotProductTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"HotProductTableViewCell" owner:self options:nil];
        for (id oneObject in nibs) {
            if ([oneObject isKindOfClass:[HotProductTableViewCell class]]) {
                cell = (HotProductTableViewCell *)oneObject;
            }
        }
    }
    switch (indexPath.section) {
        case 0:
            [cell updateController:whiteArray];
            break;
        case 1:
            [cell updateController:redArray];
            break;
        case 2:
            [cell updateController:yangArray];
            break;
        default:
            break;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

@end
