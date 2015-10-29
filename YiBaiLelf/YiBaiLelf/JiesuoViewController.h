//
//  JiesuoViewController.h
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JiesuoViewController : UIViewController<UIAlertViewDelegate>
{
    UIButton * shuBtn;
    
    UILabel * mimaLabel1;
    UILabel * mimaLabel2;
    UILabel * mimaLabel3;
    UILabel * mimaLabel4;
    int second;
    NSTimer* time;
    UIView * mimaqu;
    UILabel * daojishiLabel;
    int cishu;
    int a;
    int b;
    int c;
    int d;
}


@end
