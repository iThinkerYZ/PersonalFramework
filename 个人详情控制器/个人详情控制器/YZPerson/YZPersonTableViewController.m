//
//  YZPersonTableViewController.m
//  个人详情控制器
//
//  Created by yz on 15/8/13.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "YZPersonTableViewController.h"

#import "YZTableView.h"
#import "UIImage+Image.h"

#define YZHeadViewH 200

#define YZHeadViewMinH 64

#define YZTabBarH 44

@interface YZPersonTableViewController ()


@property (nonatomic, assign) CGFloat lastOffsetY;

@end

@implementation YZPersonTableViewController


- (void)loadView
{
    YZTableView *tableView = [[YZTableView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    self.tableView = tableView;

    self.view = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    _lastOffsetY = -(YZHeadViewH + YZTabBarH);
    
    // 设置顶部额外滚动区域
    self.tableView.contentInset = UIEdgeInsetsMake(YZHeadViewH + YZTabBarH , 0, 0, 0);
    
    YZTableView *tableView = (YZTableView *)self.tableView;
    tableView.tabBar = _tabBar;
    

    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取当前偏移量
    CGFloat offsetY = scrollView.contentOffset.y;
    
    // 获取偏移量差值
    CGFloat delta = offsetY - _lastOffsetY;
    
    CGFloat headH = YZHeadViewH - delta;
    
    if (headH < YZHeadViewMinH) {
        headH = YZHeadViewMinH;
    }
    
    _headHCons.constant = headH;
    
    // 计算透明度，刚好拖动200 - 64 136，透明度为1
    
    CGFloat alpha = delta / (YZHeadViewH - YZHeadViewMinH);
    
    // 获取透明颜色
    UIColor *alphaColor = [UIColor colorWithWhite:0 alpha:alpha];
    [_titleLabel setTextColor:alphaColor];
    
    // 设置导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]] forBarMetrics:UIBarMetricsDefault];
    
}





@end
