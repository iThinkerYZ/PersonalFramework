//
//  YZTableView.m
//  个人详情控制器
//
//  Created by yz on 15/8/13.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "YZTableView.h"
#define YZClickBtnObjcKey @"clickBtnObjc"
#define YZClickBtnNote @"clickBtn"

@interface YZTableView ()



@end

@implementation YZTableView


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    
    
    for (UIView *tabBarChildView in _tabBar.subviews) {
        
        CGPoint childP = [self convertPoint:curP toView:tabBarChildView];
        
        if ([tabBarChildView pointInside:childP withEvent:event]) {
            // 点击了按钮
            
            // 通知个人控制器切换内容视图
            [[NSNotificationCenter defaultCenter] postNotificationName:YZClickBtnNote object:nil userInfo:@{YZClickBtnObjcKey: tabBarChildView}];
            
            // 处理完事件，结束当前事件处理
            return;
            
        }
    }
    
    // 如果没有处理事件，就调用系统自带的处理方式
    [super touchesBegan:touches withEvent:event];

   
}


@end
