//
//  ViewController.m
//  iOS-AutoLayout(代码实现)
//
//  Created by zero on 15/11/5.
//  Copyright © 2015年 zerorobot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 H:[cancelButton(72)]-12-[acceptButton(50)]
 canelButton宽72，acceptButton宽50，它们之间间距12
 
 H:[wideView(>=60@700)]
 wideView宽度大于等于60point，该约束条件优先级为700（优先级最大值为1000，优先级越高的约束越先被满足）
 
 V:[redBox]-[yellowBox(==redBox)]
 竖直方向上，先有一个redBox，其下方紧接一个高度等于redBox高度的yellowBox
 
 H:|-10-[Find]-[FindNext]-[FindField(>=20)]-|
 水平方向上，Find距离父view左边缘默认间隔宽度，之后是FindNext距离Find间隔默认宽度；再之后是宽度不小于20的FindField，它和FindNext以及父view右边缘的间距都是默认宽度。（竖线“|” 表示superview的边缘）

 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *blueView = [[UIView alloc]init];
    [blueView setBackgroundColor:[UIColor blueColor]];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    
    UIView *redView = [[UIView alloc]init];
    [redView setBackgroundColor:[UIColor redColor]];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    // VFL
    NSString *VFL1 = @"H:|-margin-[blueView]-margin-[redView(==blueView)]-margin-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView, redView);;
    NSDictionary *metrics = @{@"margin":@20};
    NSArray *conts1 = [NSLayoutConstraint constraintsWithVisualFormat:VFL1 options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:metrics views:views];
    
    NSString *VFL2 = @"V:[blueView(==blueHeight)]-margin-|";
    NSArray *conts2 = [NSLayoutConstraint constraintsWithVisualFormat:VFL2 options:0 metrics:@{@"blueHeight" : @40, @"margin" : @20} views:views];
    
    [self.view addConstraints:conts1];
    [self.view addConstraints:conts2];
    
    
    }
/**
 *  测试NSLayoutConstraint
 */
-(void)test
{
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    // 自动布局
    redView.translatesAutoresizingMaskIntoConstraints = NO; // 关闭AutoSize
    
    // 创建NSLayoutContrainst对象
    // 高度
    NSLayoutConstraint *contsraintHeight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    [self.view addConstraint:contsraintHeight];
    
    // 顶部
    NSLayoutConstraint *contsraintTop = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0  constant:100];
    [self.view addConstraint:contsraintTop];
    // 左边
    NSLayoutConstraint *contsraintLeft = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0  constant:20];
    [self.view addConstraint:contsraintLeft];
    // 右边
    NSLayoutConstraint *contsraintRight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0  constant:-20];
    [self.view addConstraint:contsraintRight];

}





@end



