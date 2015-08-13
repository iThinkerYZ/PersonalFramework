//
//  YZPersonTableViewController.h
//  个人详情控制器
//
//  Created by yz on 15/8/13.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZPersonTableViewController : UITableViewController

@property (nonatomic, weak)   UIView *tabBar;

@property (nonatomic, weak)  NSLayoutConstraint *headHCons;


@property (nonatomic, weak) UILabel *titleLabel;

@end
