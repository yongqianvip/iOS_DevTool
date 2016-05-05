//
//  BaseViewController.m
//  iOS_DevTool
//
//  Created by YYQ on 15/5/5.
//  Copyright © 2015年 YYQ. All rights reserved.
//

#import "BaseViewController.h"
#import "CommonAlert.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *arr = @[@"1类",@"2类",@"3类",@"4类"];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(10, 100 + idx * (44 + 20), 100, 44)];
        [btn setTag:idx + 1000];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn setTitle:arr[idx] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }];
}
- (void)btnClick:(UIButton *)btn{
    NSInteger index = btn.tag - 1000;
    switch (index) {
        case 0:
            [CommonAlert alertWithContent:@"只指定内容，不需要回调" viewController:self];
            break;
        case 1:
            [CommonAlert alertWithContent:@"指定内容和确定按钮的标题，附带回调" viewController:self confirmStr:@"我确定" confirmCb:^{
                NSLog(@"确定的回调");
            }];
            break;
        case 2:
            [CommonAlert alertWithContent:@"指定内容、确定按钮标题、取消按钮标题，附带对应回调" viewController:self confirmStr:@"确定按钮标题" confirmCb:^{
                NSLog(@"确定按钮的回调");
            } cancelStr:@"取消的标题" cancelCb:^{
                NSLog(@"取消的回调");
            }];
            break;
        case 3:
            [CommonAlert alertWithCancel:@"只指定内容，无回调" viewController:self];
            break;
        default:
            break;
    }
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

@end
