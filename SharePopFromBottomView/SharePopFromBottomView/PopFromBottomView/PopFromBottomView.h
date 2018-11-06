//
//  PopFromBottomView.h
//  gylm
//
//  Created by MacOS on 2018/11/5.
//  Copyright © 2018年 shangfang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FONT(font_size) [UIFont systemFontOfSize:font_size]
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define MakeColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

typedef void(^PopFromBottomViewBlockAction)(NSString *title);

@interface PopFromBottomView : UIView

//点击事件 对外
@property(nonatomic,copy) PopFromBottomViewBlockAction popFromBottomViewBlockAction;

@end
