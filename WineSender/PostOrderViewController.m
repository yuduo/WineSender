//
//  PostOrderViewController.m
//  WineSender
//
//  Created by michael on 1/5/15.
//  Copyright (c) 2015 michael. All rights reserved.
//

#import "PostOrderViewController.h"
#import "BuyCardListModel.h"
#import "PostCartTableViewCell.h"
@interface PostOrderViewController ()
<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableListView;

@end

@implementation PostOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_orderListArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BuyCardListModel *model = [_orderListArray objectAtIndex:indexPath.row];
    NSString *identifier = @"PostCartTableViewCell";
    PostCartTableViewCell* cell   = (PostCartTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSArray* nibs = [[NSBundle mainBundle] loadNibNamed:@"PostCartTableViewCell" owner:self options:nil];
        for (id oneObject in nibs) {
            if ([oneObject isKindOfClass:[PostCartTableViewCell class]]) {
                cell = (PostCartTableViewCell *)oneObject;
            }
        }
    }
    [cell updateController:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ProductListModel *model = [_orderListArray objectAtIndex:indexPath.row];
//    ProductDetailViewController *loginViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailViewController"];
//    loginViewController.gid = model.id;
//    loginViewController.vid = model.version;
//    [self.navigationController pushViewController:loginViewController animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (IBAction)postOrderButtonClicked:(id)sender {
    
}
@end
