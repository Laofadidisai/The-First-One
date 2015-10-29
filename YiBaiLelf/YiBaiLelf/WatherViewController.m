//
//  WatherViewController.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "WatherViewController.h"
#import "XYZViewController.h"
#import "rainActitvty.h"
#import "windActitvty.h"
#import "Xue.h"
#import "YunFei.h"
#import "FanYun.h"
@interface WatherViewController ()

@end

@implementation WatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    backView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 460)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];

    UIImageView * backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    backgoundView.image = [UIImage imageNamed:@"w_bg.png"];
    [backView addSubview:backgoundView];
    
    
    [self heiye];
    [self baiyian];
    
    weedent = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 375, 320, 75)];
    //weedent.backgroundColor = [UIColor orangeColor];
    
    weedent.showsVerticalScrollIndicator = YES;
    weedent.bounces = YES;
    //weedent.pagingEnabled = YES;
    weedent.contentSize = CGSizeMake(140*7, 70);

    NSArray * weed = [[NSArray alloc]initWithObjects:@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日", nil];
    
    image = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 100, 12)];//140*i
    image.backgroundColor = [UIColor clearColor];
    
    [weedent addSubview:image];

    for (int i = 0; i<7; i++)
    {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(20+140*i, 12, 100, 60)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = i;
        btn.layer.cornerRadius = 10;
        [btn setTitle:[weed objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageNamed:@"w_xq1"] forState:UIControlStateSelected];
        [weedent addSubview:btn];
        btn.selected = NO;//YES是显示点击后的状态
        
    }
    [backView addSubview:weedent];
}
-(void)heiye
{
    titImageViewo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    titImageViewo.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"w_bg2.png"]];
    [backView addSubview:titImageViewo];
    
    UIButton * lefto = [[UIButton alloc]initWithFrame:CGRectMake(15, 12, 20, 20)];
    lefto.backgroundColor = [UIColor clearColor];
    [lefto setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [lefto addTarget:self action:@selector(bcak) forControlEvents:UIControlEventTouchUpInside];
    [titImageViewo addSubview:lefto];
    
    righto = [[UIButton alloc]initWithFrame:CGRectMake(265, 12, 40, 20)];
    righto.backgroundColor = [UIColor clearColor];
    [righto setTitle:@"黑夜" forState:UIControlStateNormal];
    [righto addTarget:self action:@selector(changeBtno) forControlEvents:UIControlEventTouchUpInside];
    [titImageViewo addSubview:righto];
    
    zhanshiViewo = [[UIScrollView alloc]initWithFrame:CGRectMake(19, 80, 282, 277)];
    zhanshiViewo.backgroundColor = [UIColor cyanColor];
    
    zhanshiViewo.showsHorizontalScrollIndicator = NO;
    zhanshiViewo.bounces = NO;
    zhanshiViewo.delegate = self;
    [backView addSubview:zhanshiViewo];
    
    onedayo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
    onedayo.backgroundColor = [UIColor orangeColor];
    onedayo.image = [UIImage imageNamed:@"w_night.png"];
    
    UIImageView * sun = [[UIImageView alloc]initWithFrame:CGRectMake(150, 50, 100, 100)];
    sun.animationDuration = 0.5;
    sun.animationImages = @[[UIImage imageNamed:@"w_moon1.png"],[UIImage imageNamed:@"w_moon2.png"]];
    [sun startAnimating];
    [onedayo addSubview:sun];
    
    for (int n = 0; n < 25; n++) {
        starView = [[UIImageView alloc]initWithFrame:CGRectMake(arc4random()%250, arc4random()%200+20, 20, 20)];
        starView.animationDuration = 0.5;
        starView.animationImages = @[[UIImage imageNamed:@"xx1.png"],[UIImage imageNamed:@"xx2.png"]];
        [starView startAnimating];
        [onedayo addSubview:starView];
    }

    [zhanshiViewo addSubview:onedayo];
    

}
-(void)baiyian
{
    titImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    titImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"w_bg2.png"]];
    [backView addSubview:titImageView];
    
    UIButton * left = [[UIButton alloc]initWithFrame:CGRectMake(15, 12, 20, 20)];
    left.backgroundColor = [UIColor clearColor];
    [left setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(bcak) forControlEvents:UIControlEventTouchUpInside];
    [titImageView addSubview:left];
    
    right = [[UIButton alloc]initWithFrame:CGRectMake(265, 12, 40, 20)];
    right.backgroundColor = [UIColor clearColor];
    [right setTitle:@"白天" forState:UIControlStateNormal];
    [right addTarget:self action:@selector(changeBtn) forControlEvents:UIControlEventTouchUpInside];
    [titImageView addSubview:right];
    
    zhanshiView = [[UIScrollView alloc]initWithFrame:CGRectMake(19, 80, 282, 277)];
    zhanshiView.backgroundColor = [UIColor cyanColor];
    
    zhanshiView.showsHorizontalScrollIndicator = NO;
    zhanshiView.bounces = NO;
    zhanshiView.delegate = self;
    [backView addSubview:zhanshiView];
    
    oneday = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
    oneday.backgroundColor = [UIColor orangeColor];
    oneday.image = [UIImage imageNamed:@"w_qing.png"];
    [zhanshiView addSubview:oneday];

}

-(void)btnClick:(UIButton*)button
{
    for (id btns in weedent.subviews)
    {
        if ([btns isKindOfClass:[UIButton class]])//判断
        {
            UIButton *  temBtn = btns;
            temBtn.selected = NO;
        }
    }
   button.selected = YES;
    
    NSLog(@"%d",button.tag);
    
    switch (button.tag) {
        case 0:
        {
            image.frame = CGRectMake(20, 0, 100, 12);
            image.image = [UIImage imageNamed:@"w_tip.png"];
            [zhanshiView addSubview:oneday];
            
            UIImageView * sun = [[UIImageView alloc]initWithFrame:CGRectMake(150, 50, 100, 100)];
            sun.animationDuration = 0.5;
            sun.animationImages = @[[UIImage imageNamed:@"w_sun1.png"],[UIImage imageNamed:@"w_sun2.png"]];
            [sun startAnimating];
            [zhanshiView addSubview:sun];
            
            [windView removeFromSuperview];
            [threeView removeFromSuperview];
            [rainView removeFromSuperview];
        }
            break;
        case 1:
        {
            image.frame = CGRectMake(160, 0, 100, 12);
            image.image = [UIImage imageNamed:@"w_tip.png"];
            UIImageView * twoday = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            twoday.backgroundColor = [UIColor orangeColor];
            twoday.image = [UIImage imageNamed:@"w_duoyun.png"];
            [zhanshiView addSubview:twoday];
            UIImageView * sun = [[UIImageView alloc]initWithFrame:CGRectMake(150, 50, 100, 100)];
            sun.animationDuration = 0.5;
            sun.animationImages = @[[UIImage imageNamed:@"w_sun1.png"],[UIImage imageNamed:@"w_sun2.png"]];
            [sun startAnimating];
            [zhanshiView addSubview:sun];
            windActitvty * wind = [[windActitvty alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            [zhanshiView addSubview:wind];
            
            windView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            windView.backgroundColor = [UIColor clearColor];
            windView.showsHorizontalScrollIndicator = NO;
            windView.bounces = NO;
            windView.delegate = self;
            [zhanshiViewo addSubview:windView];
            
            windActitvty * windye = [[windActitvty alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            [windView addSubview:windye];
            
            [threeView removeFromSuperview];
            [rainView removeFromSuperview];
        }
            break;
        case 2:
        {
            image.frame = CGRectMake(20+140*2, 0, 100, 12);
            image.image = [UIImage imageNamed:@"w_tip.png"];
            UIImageView * threeday = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            threeday.backgroundColor = [UIColor orangeColor];
            threeday.image = [UIImage imageNamed:@"w_yin.png"];
            [zhanshiView addSubview:threeday];
            
            threeView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            threeView.backgroundColor = [UIColor clearColor];
            threeView.showsHorizontalScrollIndicator = NO;
            threeView.bounces = NO;
            threeView.delegate = self;
            [zhanshiViewo addSubview:threeView];

            UIImageView * threeye = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            threeye.backgroundColor = [UIColor orangeColor];
            threeye.image = [UIImage imageNamed:@"w_night.png"];
            [threeView addSubview:threeye];
            
            [windView removeFromSuperview];
            [rainView removeFromSuperview];
        }
            break;
        case 3:
        {
            image.frame = CGRectMake(20+140*3, 0, 100, 12);
            image.image = [UIImage imageNamed:@"w_tip.png"];
            UIImageView * fourday = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            fourday.backgroundColor = [UIColor orangeColor];
            fourday.image = [UIImage imageNamed:@"w_yu.png"];
            [zhanshiView addSubview:fourday];
            rainActitvty * rain = [[rainActitvty alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            [zhanshiView addSubview:rain];
            
            rainView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            rainView.backgroundColor = [UIColor clearColor];
            rainView.showsHorizontalScrollIndicator = NO;
            rainView.bounces = NO;
            rainView.delegate = self;
            [zhanshiViewo addSubview:rainView];

            UIImageView * fourye = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            fourye.backgroundColor = [UIColor orangeColor];
            fourye.image = [UIImage imageNamed:@"w_night.png"];
            [rainView addSubview:fourye];
            rainActitvty * rainye = [[rainActitvty alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            [rainView addSubview:rainye];
            
            [windView removeFromSuperview];
            [threeView removeFromSuperview];
        }
            break;
        case 4:
        {
            image.frame = CGRectMake(160+140*3, 0, 100, 12);
            image.image = [UIImage imageNamed:@"w_tip.png"];
            [zhanshiView addSubview:oneday];

            FanYun * fanyun = [[FanYun alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            [zhanshiView addSubview:fanyun];

            [windView removeFromSuperview];
            [threeView removeFromSuperview];
            [rainView removeFromSuperview];
        }
            break;
        case 5:
        {
            image.frame = CGRectMake(160+140*4, 0, 100, 12);
            image.image = [UIImage imageNamed:@"w_tip.png"];
            UIImageView * sixday = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            sixday.backgroundColor = [UIColor orangeColor];
            sixday.image = [UIImage imageNamed:@"xue01.jpg"];
            [zhanshiView addSubview:sixday];
            
            Xue * xueView = [[Xue alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            [zhanshiView addSubview:xueView];
            
            [windView removeFromSuperview];
            [threeView removeFromSuperview];
            [rainView removeFromSuperview];
        }
            break;
        case 6:
        {
            image.frame = CGRectMake(160+140*5, 0, 100, 12);
            image.image = [UIImage imageNamed:@"w_tip.png"];
            [zhanshiView addSubview:oneday];

            YunFei * yunfei = [[YunFei alloc]initWithFrame:CGRectMake(0, 0, 282, 277)];
            [zhanshiView addSubview:yunfei];
            
            [windView removeFromSuperview];
            [threeView removeFromSuperview];
            [rainView removeFromSuperview];
        }
        default:
            break;
    }
}



-(void)changeBtn
{
    [zhanshiView setHidden:YES];
    [titImageView setHidden:YES];
    
}
-(void)bcak
{
    XYZViewController * XYZVC = [[XYZViewController alloc]init];
    [self presentViewController:XYZVC animated:YES completion:nil];
}
-(void)changeBtno
{
    [zhanshiView setHidden:NO];
    [titImageView setHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
