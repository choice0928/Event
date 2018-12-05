//
//  ViewController.m
//  Event
//
//  Created by 王鑫 on 2018/12/5.
//  Copyright © 2018 wangxin. All rights reserved.
//

#import "ViewController.h"
#import "CustomBtn.h"

@interface ViewController () {
    CustomBtn *cornerBtn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cornerBtn = [[CustomBtn alloc] initWithFrame:CGRectMake(100, 100, 120, 120)];
    cornerBtn.backgroundColor = [UIColor orangeColor];
    [cornerBtn addTarget:self action:@selector(cornerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cornerBtn];
}

- (void)cornerBtnClick {
    NSLog(@"点击到了响应区域");
}


@end
