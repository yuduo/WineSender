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
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *baijiuButton;
@property (weak, nonatomic) IBOutlet UIButton *hongjiuButton;
@property (weak, nonatomic) IBOutlet UIButton *pijiuButton;
@property (weak, nonatomic) IBOutlet UIButton *yangjiuButton;
@property (weak, nonatomic) IBOutlet UIButton *qitaButton;
@property (weak, nonatomic) IBOutlet UIButton *rexiaoButton;
@property (weak, nonatomic) IBOutlet UIButton *baijiuHotButton;
@property (weak, nonatomic) IBOutlet UIButton *hongjiuHotButton;
@property (weak, nonatomic) IBOutlet UIButton *yangjiuHotButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end
