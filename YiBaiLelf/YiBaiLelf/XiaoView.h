//
//  XiaoView.h
//  YiBaiLelf
//
//  Created by 老李 on 15-10-13.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChuanZhiDelegate<NSObject>//   重要 : 协议生成
@required
-(void)jieshouzhi:(int *)string;
@optional
@end
@interface XiaoView : UIView
{
    UIButton * btn1;
    UIButton * btn4;
    UIButton * btn3;
    UIButton * btn2;
  
}
@property(nonatomic,assign)id<ChuanZhiDelegate>delegate;//  重要 : 创建代理
@property(nonatomic,assign)int sting;//设置属性
@end
