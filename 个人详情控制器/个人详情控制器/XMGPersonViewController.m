//
//  XMGPersonViewController.m
//  个人详情控制器
//
//  Created by yz on 15/8/13.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "XMGPersonViewController.h"
#import "YZWeiBoTableViewController.h"
#import "XMGPersonTableViewController.h"

@interface XMGPersonViewController ()

@end

#pragma mark - XMGPersonViewController继承YZPersonViewController，是它的子类

@implementation XMGPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置个人头像
    self.personIconImage = [UIImage imageNamed:@"timo"];
    
    // 设置个人明信片
    self.personCardImage = [UIImage imageNamed:@"lol"];

    // 设置导航条标题
    self.title = @"小码哥教育";
    
    
    // 添加子控制器，需要显示几个子控制器的tableView就添加几个，跟UITabBarController用法一样。
    // tabBar上按钮的标题 = 子控制器的标题
    // 个人
    XMGPersonTableViewController *personVC = [[XMGPersonTableViewController alloc] init];
    
    personVC.title = @"个人";
    
    [self addChildViewController:personVC];
    
    // 微博
    YZWeiBoTableViewController *weiboVC = [[YZWeiBoTableViewController alloc] init];
    
    weiboVC.title = @"微博";
    
    [self addChildViewController:weiboVC];
    
}
@end
