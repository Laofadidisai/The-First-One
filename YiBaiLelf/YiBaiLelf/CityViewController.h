//
//  CityViewController.h
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XiaoView.h"
@interface CityViewController : UIViewController<UIScrollViewDelegate,ChuanZhiDelegate>//导入协议
{
    UIScrollView * zhuScrollView;
    UIScrollView * fuScrollView;
    UIPageControl * pageControl;
    NSTimer * timer;
    int a;
    int b;
//    UIButton * btn1;
//    UIButton * btn4;
//    UIButton * btn3;
//    UIButton * btn2;
    NSMutableArray * btntag;

    XiaoView * xiaoView;//创建窗口
}

@end
