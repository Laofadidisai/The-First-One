//
//  XiaoView.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-13.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "XiaoView.h"

@implementation XiaoView
@synthesize sting;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        btn2 = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 40, 40)];
        btn2.tag = 102;
        [btn2 setBackgroundImage:[UIImage imageNamed:@"c_setting1.png"] forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn2];
        
        btn3 = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 40, 40)];
        btn3.tag = 103;
        [btn3 setBackgroundImage:[UIImage imageNamed:@"c_setting2.png"] forState:UIControlStateNormal];
        [btn3 addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn3];
        
        btn4 = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 40, 40)];
        btn4.tag = 104;
        [btn4 setBackgroundImage:[UIImage imageNamed:@"c_setting3.png"] forState:UIControlStateNormal];
        [btn4 addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn4];
        
        btn1 = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 40, 40)];
        btn1.tag = 101;
        [btn1 setBackgroundImage:[UIImage imageNamed:@"c_setting0.png"] forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn1];
        
        
        
        
        
        
        // Initialization code
    }
    return self;
}
-(void)dianjiBtn:(UIButton *)btn
{
    self.sting = btn.tag;
    NSLog(@"%d",self.sting);
    if ([self.delegate respondsToSelector:@selector(jieshouzhi:)])// 重要 : 判断 
    {
        //假如说代理响应了,再让代理去做
        [self.delegate jieshouzhi:&(sting)];
    }

    switch (sting) {
        case 101:
        {
            [UIView animateWithDuration:0.5 animations:^{btn2.frame = CGRectMake(50, 0, 40, 40);}];
            [UIView animateWithDuration:0.5 animations:^{btn3.frame = CGRectMake(0, 50, 40, 40);}];
            [UIView animateWithDuration:0.5 animations:^{btn4.frame = CGRectMake(0, 0, 40, 40);}];
        }
            break;
        case 102:
        {
            [self guocheng];
            
        }
            break;
        case 103:
        {
            [self guocheng];
            
        }
            break;
        case 104:
        {
            [self guocheng];
        }
            break;
            
        default:
            break;
    }
}
-(void)guocheng
{
    [UIView animateWithDuration:0.5 animations:^{btn2.frame = CGRectMake(50, 50, 40, 40);}];
    [UIView animateWithDuration:0.5 animations:^{btn3.frame = CGRectMake(50, 50, 40, 40);}];
    [UIView animateWithDuration:0.5 animations:^{btn4.frame = CGRectMake(50, 50, 40, 40);}];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
