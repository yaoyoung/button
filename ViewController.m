//
//  ViewController.m
//  button
//
//  Created by yangyao on 15/9/17.
//  Copyright (c) 2015年 yangyao. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Service.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor redColor].CGColor;
    [button MyButtonWithFrame:CGRectMake(100, 200, 100, 100) textString:@"这是主题" subString:@"这是描述语句" imageUrl:@"2"];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


#pragma mark -- 自定义点击事件
- (void)buttonPressed:(UIButton *)sender{
    NSLog(@"ss");
}

@end
