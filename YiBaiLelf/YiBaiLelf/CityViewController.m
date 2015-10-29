//
//  CityViewController.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "CityViewController.h"
#import "XYZViewController.h"
#import "XiaoView.h"
@interface CityViewController ()

@end

@implementation CityViewController

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
    
    UINavigationBar * naBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 20, 320, 44)];
    [naBar setBackgroundImage:[UIImage imageNamed:@"c_bg.png"] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:naBar];
    
    UIButton * left = [[UIButton alloc]initWithFrame:CGRectMake(15, 12, 20, 20)];
    left.backgroundColor = [UIColor clearColor];
    [left setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [naBar addSubview:left];
    
    zhuScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 320, 416)];
    zhuScrollView.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0];
    
    zhuScrollView.showsHorizontalScrollIndicator = NO;
    zhuScrollView.bounces = YES;
    
    zhuScrollView.contentSize = CGSizeMake(320, 680);
    zhuScrollView.delegate  = self;
    [self.view addSubview:zhuScrollView];
    
    fuScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    fuScrollView.backgroundColor = [UIColor orangeColor];
    
    fuScrollView.showsHorizontalScrollIndicator = YES;
    fuScrollView.bounces = NO;
    
    fuScrollView.pagingEnabled = YES;
    fuScrollView.contentSize = CGSizeMake(320*5, 200);
    fuScrollView.delegate  = self;
    [zhuScrollView addSubview:fuScrollView];

    for (int i = 0; i<5; i++) {
        NSString * imageName = [NSString stringWithFormat:@"c_item%d.jpg",i];
        UIImageView * cityView = [[UIImageView alloc]initWithFrame:CGRectMake(320*i, 0, 320, 200)];
        cityView.image = [UIImage imageNamed:imageName];
        [fuScrollView addSubview:cityView];
    }
    
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(100, 170, 120, 20)];
    pageControl.numberOfPages = 5;
    //点默认颜色
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //滚动点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [pageControl addTarget:self action:@selector(gundong:) forControlEvents:UIControlEventValueChanged];
    pageControl.backgroundColor = [UIColor clearColor];
    [zhuScrollView addSubview:pageControl];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(jishi) userInfo:nil repeats:YES];
    a = 0;
    b = 2;
    [timer fire];
    
    //可变数组初始化后使用 不变数组不用初始化
    btntag = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (int j = 0 ; j<4; j++) {
        for (int i = 0; i<3; i++) {
        NSString * buttonImage = [NSString stringWithFormat:@"c_%d.png",j*3+i+1];
            UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(30*(i+1)+70*i, 200+30*(j+1)+70*j, 70, 70)];
            button.tag =j*3+i+1;
            [button setBackgroundImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
            //[button addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
            [zhuScrollView addSubview:button];
            //把按钮添加到数组中
            [btntag addObject:button];
        }
    }
   
    
    xiaoView = [[XiaoView alloc]initWithFrame:CGRectMake(210, 350, 90, 90)];
    [self.view addSubview:xiaoView];
    xiaoView.delegate = self;//  重要 : 协议代理
    
//    btn2 = [[UIButton alloc]initWithFrame:CGRectMake(260, 400, 40, 40)];
//    btn2.tag = 102;
//    [btn2 setBackgroundImage:[UIImage imageNamed:@"c_setting1.png"] forState:UIControlStateNormal];
//    [btn2 addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn2];
//    
//    btn3 = [[UIButton alloc]initWithFrame:CGRectMake(260, 400, 40, 40)];
//    btn3.tag = 103;
//    [btn3 setBackgroundImage:[UIImage imageNamed:@"c_setting2.png"] forState:UIControlStateNormal];
//    [btn3 addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn3];
//    
//    btn4 = [[UIButton alloc]initWithFrame:CGRectMake(260, 400, 40, 40)];
//    btn4.tag = 104;
//    [btn4 setBackgroundImage:[UIImage imageNamed:@"c_setting3.png"] forState:UIControlStateNormal];
//    [btn4 addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn4];
//    
//    btn1 = [[UIButton alloc]initWithFrame:CGRectMake(260, 400, 40, 40)];
//    btn1.tag = 101;
//    [btn1 setBackgroundImage:[UIImage imageNamed:@"c_setting0.png"] forState:UIControlStateNormal];
//    [btn1 addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn1];
}
-(void)jieshouzhi:(int *)string         //重要 : 实现方法
{
    switch (xiaoView.sting) {
        case 102:
        {
            [[btntag objectAtIndex:10] setHidden:YES];
        }
            break;
        case 103:
        {
            [[btntag objectAtIndex:11] setHidden:YES];
        }
            break;
        case 104:
        {
            [[btntag objectAtIndex:10] setHidden:NO];
            [[btntag objectAtIndex:11] setHidden:NO];
        }
            break;
        default:
            break;
    }
    NSLog(@"------%d",xiaoView.sting);
}
-(void)jishi
{
    [fuScrollView setContentOffset:CGPointMake( 320*a/2, 0) animated:YES];
    int page = fuScrollView.contentOffset.x/320;
    pageControl.currentPage = page;
    a = a + b;
    if (a==8) {
        b = -b;
        
    }
    if (a == 0) {
        b = -b;
    }

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/320;
    pageControl.currentPage = page;
}
-(void)gundong:(UIPageControl * )page
{
    int num = page.currentPage;
    [fuScrollView setContentOffset:CGPointMake(num * 320, 0) animated:YES];
}

//-(void)dianjiBtn:(UIButton *)btn
//{
//    NSLog(@"%d",btn.tag);
//    switch (btn.tag) {
//        case 101:
//        {
//            [UIView animateWithDuration:0.5 animations:^{btn2.frame = CGRectMake(260, 350, 40, 40);}];
//            [UIView animateWithDuration:0.5 animations:^{btn3.frame = CGRectMake(210, 400, 40, 40);}];
//            [UIView animateWithDuration:0.5 animations:^{btn4.frame = CGRectMake(210, 350, 40, 40);}];
//        }
//            break;
//        case 102:
//        {
//            [self guocheng];
//            //隐藏
//            [[btntag objectAtIndex:10] setHidden:YES];
//        }
//            break;
//        case 103:
//        {
//            [self guocheng];
//            //隐藏
//            [[btntag objectAtIndex:11] setHidden:YES];
//        }
//            break;
//        case 104:
//        {
//            [self guocheng];
//            //显示
//            [[btntag objectAtIndex:10] setHidden:NO];
//            [[btntag objectAtIndex:11] setHidden:NO];
//        }
//            break;
//
//        default:
//            break;
//    }
//}
//
//-(void)guocheng
//{
//    [UIView animateWithDuration:0.5 animations:^{btn2.frame = CGRectMake(260, 400, 40, 40);}];
//    [UIView animateWithDuration:0.5 animations:^{btn3.frame = CGRectMake(260, 400, 40, 40);}];
//    [UIView animateWithDuration:0.5 animations:^{btn4.frame = CGRectMake(260, 400, 40, 40);}];
//}
-(void)backClick
{
    XYZViewController * XYZVC = [[XYZViewController alloc]init];
    [self presentViewController:XYZVC animated:YES completion:nil];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
