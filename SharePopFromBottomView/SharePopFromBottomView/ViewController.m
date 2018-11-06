//
//  ViewController.m
//  SharePopFromBottomView
//
//  Created by MacOS on 2018/11/6.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "ViewController.h"
#import "PopFromBottomView/PopFromBottomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    PopFromBottomView *pop = [[PopFromBottomView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [[UIApplication sharedApplication].keyWindow addSubview:pop];
}


@end
