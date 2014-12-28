//
//  MyLoveViewController.h
//  WineSender
//
//  Created by michael on 12/28/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "CommonViewController.h"
#import "ProductListModel.h"
#import "ProductListTableViewCell.h"
@interface MyLoveViewController : CommonViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSString *typeId;
@property (weak, nonatomic) IBOutlet UITableView *tableListView;
@property(nonatomic,strong)NSMutableArray *orderListArray;

@end
