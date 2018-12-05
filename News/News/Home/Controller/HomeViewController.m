//
//  HomeViewController.m
//  News
//
//  Created by tupservice on 2018/11/30.
//  Copyright © 2018年 huawei. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "MJChiBaoZiHeader.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "Person.h"
#import "FindPageViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,HomeCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong)NSArray *resultArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    // Do any additional setup after loading the view.
}

- (void)clickCell:(UITableViewCell *)cell WithType:(int)type
{
    NSIndexPath *index = [self.tableview indexPathForCell:cell];
    Person *p =  [self.dataArray objectAtIndex:index.row];
    switch (type) {
        case 1:
        {
          
            [p save];
            [SVProgressHUD showSuccessWithStatus:@"新增成功"];
        }
            break;
        case 2:
        {
           
            [p deleteObject];
            [SVProgressHUD showSuccessWithStatus:@"删除成功"];
        }
            break;
        case 3:
        {
            p.age = @"30";
            [p update];
            [SVProgressHUD showSuccessWithStatus:@"修改成功"];
        }
            break;
        case 4:
        {
            self.resultArray = [Person findAll] ;
            [SVProgressHUD showSuccessWithStatus:@"查询成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                FindPageViewController *controller = [[FindPageViewController alloc] init];
                controller.dataArray = self.resultArray;
                [self.navigationController pushViewController:controller animated:YES];
            });
        }
            break;
            
        default:
            break;
    }
}

- (void)setUpUI
{
    self.tableview.tableFooterView = [UIView new];
    MJChiBaoZiHeader *head = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    head.lastUpdatedTimeLabel.hidden = YES;
    head.stateLabel.hidden = YES;
    self.tableview.mj_header = head;
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    self.resultArray = @[];
    [self.tableview.mj_header beginRefreshing];
    
    UINib *nib = [UINib nibWithNibName:@"HomeCell" bundle:[NSBundle mainBundle]];
    
    [self.tableview registerNib:nib forCellReuseIdentifier:@"cell"];
}

- (void)loadMore
{
    
    Person *p = [[Person alloc] init];
    p.name = [NSString stringWithFormat:@"小火苗几号回家%d",1];
//    p.age = @"";
    p.favorite = @"喜欢吃饼";
    [self.dataArray addObject:p];
    
    Person *p1 = [[Person alloc] init];
    p1.name = [NSString stringWithFormat:@"小火苗几号回家%d",2];
    p1.age = @"27";
//    p1.favorite = @"";
    [self.dataArray addObject:p1];
    
    Person *p2 = [[Person alloc] init];
    p2.name = [NSString stringWithFormat:@"小火苗几号回家%d",3];
    p2.age = @"27";
    p2.favorite = @"喜欢吃饼";
    [self.dataArray addObject:p2];
    
    Person *p3 = [[Person alloc] init];
    p3.name = [NSString stringWithFormat:@"小火苗几号回家%d",4];
    p3.age = @"27";
    p3.favorite = @"喜欢吃饼";
    [self.dataArray addObject:p3];
    
    Person *p4 = [[Person alloc] init];
    p4.name = [NSString stringWithFormat:@"小火苗几号回家%d",5];
    p4.age = @"27";
    p4.favorite = @"喜欢吃饼";
    [self.dataArray addObject:p4];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableview.mj_header endRefreshing];
        [self.tableview reloadData];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.delegate = self;
    cell.p = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"cell" configuration:^(id cell) {
        ((HomeCell *)cell).p = self.dataArray[indexPath.row];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"1");
}




@end
