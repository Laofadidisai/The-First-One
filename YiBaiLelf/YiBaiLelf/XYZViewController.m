//
//  XYZViewController.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "XYZViewController.h"
#import "RoundButton.h"
#import "WatherViewController.h"
#import "SoSoViewController.h"
#import "CityViewController.h"
#import "NewViewController.h"
#import "MusicViewController.h"
@interface XYZViewController ()

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //设置状态栏的风格
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //设置背景图片
    UIImageView * backgroundView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, 320, 500)];
    backgroundView.image = [UIImage imageNamed:@"bg2.jpg"];
    [self.view addSubview:backgroundView];
    //
    roundArray = [[NSMutableArray alloc]initWithCapacity:0];
    //创建旋转按钮
    for (int i = 0; i<5; i++)
    {
        roundBtn = [[RoundButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        
        //roundBtn.backgroundColor = [UIColor orangeColor];
        [roundBtn setBackgroundImage:[UIImage imageNamed:@"music_beamed.png"] forState:UIControlStateNormal];
        
        //设置按钮旋转后的位置
        //让按钮按照一定的位置旋转
        float x = 160 + 100 * cos(72*i*M_PI/180);
        float y = 240 + 100 * sin(72*i*M_PI/180);
        roundBtn.tag = i + 101;
        roundBtn.layer.cornerRadius = 20;
        roundBtn.layer.borderWidth = 6;
        roundBtn.layer.borderColor =(__bridge CGColorRef)([UIColor cyanColor]);
        roundBtn.angle = 72 * i;
        [roundBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:roundBtn];
        
        //修改按钮坐标
        roundBtn.center = CGPointMake(x, y);
        
        [roundArray addObject:roundBtn];
        //给按钮添加图片
        if (i == 0) {
            [roundBtn setBackgroundImage:[UIImage imageNamed:@"m_item1.png"] forState:UIControlStateNormal];
        }
        else if (i == 1)
        {
            [roundBtn setBackgroundImage:[UIImage imageNamed:@"m_item2.png"] forState:UIControlStateNormal];
        }
        else if (i == 2)
        {
            [roundBtn setBackgroundImage:[UIImage imageNamed:@"m_item3.png"] forState:UIControlStateNormal];
        }
        else if (i == 3)
        {
            [roundBtn setBackgroundImage:[UIImage imageNamed:@"m_item4.png"] forState:UIControlStateNormal];
        }
    }
    
}

-(void)btnClick:(RoundButton *)roundbyn
{
    NSLog(@"按钮%d",roundbyn.tag);
    NSLog(@"%d",roundbyn.angle);
    if (roundbyn.angle % 360==270)
    {
        //设置按钮跳转到不同的界面
        switch (roundbyn.tag ) {
            case 101:
            {
                WatherViewController * watherVC = [[WatherViewController alloc]init];
                [self presentViewController:watherVC animated:YES completion:nil];
            }
                break;
            case 102:
            {
                SoSoViewController * sosoVC = [[SoSoViewController alloc]init];
                [self presentViewController:sosoVC animated:YES completion:nil];
            }
                break;
            case 103:
            {
                CityViewController * cityVC = [[CityViewController alloc]init];
                [self presentViewController:cityVC animated:YES completion:nil];
            }
                break;
            case 104:
            {
                NewViewController * newVC = [[NewViewController alloc]init];
                [self presentViewController:newVC animated:YES completion:nil];
            }
                break;
            case 105:
            {
                MusicViewController * musicVC = [[MusicViewController alloc]init];
                [self presentViewController:musicVC animated:YES completion:nil];
            }
                break;

            default:
                break;
        }
    }
    else
    {
        if (roundTimer == nil) {
            roundTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(xuanzhuan:) userInfo:roundbyn repeats:YES];
        }
    }
}
-(void)xuanzhuan:(NSTimer *)timer
{
    RoundButton * dianjiBtn = (RoundButton *)timer.userInfo; //userinfo:用户信息
    
    for (int i = 0; i<roundArray.count; i++) {
        RoundButton * linshiBtn = [roundArray objectAtIndex:i];
        linshiBtn.angle = linshiBtn.angle + 18;
        
        float x = 160 + 100 * cos(linshiBtn.angle*M_PI/180);
        float y = 240 + 100 * sin(linshiBtn.angle*M_PI/180);
        
        linshiBtn.center = CGPointMake(x, y);
    }
    
    if (dianjiBtn.angle % 360 == 270) {
        
        [roundTimer invalidate];
        roundTimer = nil;
        
        [self btnClick:dianjiBtn];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
