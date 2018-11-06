//
//  PopFromBottomView.m
//  gylm
//
//  Created by MacOS on 2018/11/5.
//  Copyright © 2018年 shangfang. All rights reserved.
//

#import "PopFromBottomView.h"

@interface PopFromBottomView ()

//底部容器
@property(nonatomic,strong)UIView *bottomView;
//保存图片、微信、朋友圈。 自定义按钮View
@property(nonatomic,strong)UIView *buttonView;

@end

@implementation PopFromBottomView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //设置背景颜色及透明度
        self.backgroundColor = [UIColor colorWithRed:50 / 255 green:50 / 255 blue:50 / 255 alpha:0.5f];
        
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    self.userInteractionEnabled = YES;
    //添加事件 移除视图
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAction)];
    [self addGestureRecognizer:tap];
    
    //底部白色容器
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 225)];
    [self addSubview:bottomView];
    self.bottomView = bottomView;
    
    bottomView.backgroundColor = [UIColor colorWithRed:248 / 255 green:248 / 255 blue:248 / 255 alpha:1];;
    bottomView.layer.masksToBounds = YES;
    bottomView.layer.cornerRadius = 5;
    
    //分享方式
    UILabel *shareTitileLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    [bottomView addSubview:shareTitileLable];
    
    shareTitileLable.text = @"分享方式";
    shareTitileLable.font = FONT(14);
    shareTitileLable.textAlignment = NSTextAlignmentCenter;
    shareTitileLable.textColor = MakeColor(50, 50, 50);
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenWidth, 1)];
    line.backgroundColor = MakeColor(230, 230, 230);
    [bottomView addSubview:line];
    
    //*注 文字
    UILabel *remarkFrontLable = [[UILabel alloc] initWithFrame:CGRectMake(20,40 + 11, 20,11)];
    [bottomView addSubview:remarkFrontLable];
    
    remarkFrontLable.text = @"*注:";
    remarkFrontLable.font = FONT(11);
    remarkFrontLable.textColor = MakeColor(255, 37, 38);
    remarkFrontLable.textAlignment = NSTextAlignmentLeft;
    
    //注remark
    UILabel *remarkLable = [[UILabel alloc] initWithFrame:CGRectMake(40,40 + 10, ScreenWidth - 20 - 40, 25)];
    [bottomView addSubview:remarkLable];
    
    remarkLable.text = @"由于新版微信调整了分享策略，如遇到多图无法分享至朋友圈，请先保存图片再打开微信分享。";

    remarkLable.numberOfLines = 2;
    remarkLable.font = FONT(11);
    remarkLable.textColor = MakeColor(255, 37, 38);
    remarkLable.textAlignment = NSTextAlignmentLeft;

    
    
    //保存图片、微信、朋友圈。 自定义按钮View
    float distance = (ScreenWidth - 20 * 2 - 60 * 3) / 2;
    
    NSArray *imageArray = @[@"51_bank_jiaot",@"51_bank_mins",@"51_bank_pinga"];
    NSArray *nameArray = @[@"保存图片",@"微信",@"朋友圈"];
    
    for (int i = 0; i < nameArray.count; i++) {
        
        UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(20 + (distance + 60) * i, remarkLable.frame.origin.y + 30 + 22, 60, (14 + 16 + 60))];
        [bottomView addSubview:buttonView];
        //buttonView.backgroundColor = [UIColor redColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((60 - 50) / 2, 0,  50, 50)];
        [buttonView addSubview:imageView];
        //imageView.backgroundColor = [UIColor blueColor];
        
        imageView.image = [UIImage imageNamed:imageArray[i]];
        
        UILabel *nameLable = [[UILabel alloc] initWithFrame:CGRectMake(0,50 + 12, 60, 15)];
        [buttonView addSubview:nameLable];
        //nameLable.backgroundColor = [UIColor orangeColor];
        
        nameLable.textAlignment = NSTextAlignmentCenter;
        nameLable.textColor = MakeColor(50, 50, 50);
        nameLable.font = FONT(14);
        nameLable.text = nameArray[i];
        
        //tag
        buttonView.tag = 10000 + i;
        
        //添加事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [buttonView addGestureRecognizer:tap];
    }
    
    //弹出视图 动画
    [UIView animateWithDuration:0.4 animations:^{
        
        bottomView.frame = CGRectMake(0, ScreenHeight - 225, ScreenWidth, 225);
    }];
    
    
}

//视图收回 并移除
- (void)hideAction{
    
    __weak __typeof__(self) weakSelf = self;
    //弹出视图 动画
    [UIView animateWithDuration:0.4 animations:^{
        
        weakSelf.bottomView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 225);
    }];
    
    [self performSelector:@selector(removeView) withObject:nil afterDelay:0.4];
}

//移除
- (void)removeView{
    
    [self removeFromSuperview];
}

//对外传出标题
- (void)tapAction:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    NSString *str ;
    
    if (tapGestureRecognizer.view.tag - 10000 == 0) {
        
        str = @"保存图片";
    }else if(tapGestureRecognizer.view.tag - 10000 == 1){
        
        str = @"微信";
    }else if(tapGestureRecognizer.view.tag - 10000 == 2){
        
        str = @"朋友圈";
    }else{
        
        str = @"";
    }
    
    NSLog(@"-----%@-------",str);
    
    if (self.popFromBottomViewBlockAction) {
        self.popFromBottomViewBlockAction(str);
    }
}

@end
