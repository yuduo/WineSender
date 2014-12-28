//
//  ProductListViewController.h
//  WineSender
//
//  Created by michael on 12/27/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import "CommonViewController.h"
#import "ProductListModel.h"
#import "ProductListTableViewCell.h"
@interface ProductListViewController : CommonViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSString *typeId;
@property (weak, nonatomic) IBOutlet UITableView *tableListView;
@property(nonatomic,strong)NSMutableArray *orderListArray;

@end
