//
//  NewViewController.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "NewViewController.h"
#import "XYZViewController.h"
@interface NewViewController ()

@end

@implementation NewViewController

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
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.view.backgroundColor = [UIColor colorWithRed:27/255.0 green:64/255.0 blue:133/255.0 alpha:1.0];
    
    UIImageView * backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    backImage.image = [UIImage imageNamed:@"n_background"];
    [self.view addSubview:backImage];
    
    UIButton * toutiao = [[UIButton alloc]initWithFrame:CGRectMake(30, 50, 120, 44)];
    toutiao.backgroundColor = [UIColor clearColor];
    toutiao.tag = 101;
    [toutiao addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toutiao];
    
    buttonLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,50, 320,44)];
    buttonLabel.backgroundColor = [UIColor lightGrayColor];
    buttonLabel.alpha = 0.2;
    [self.view addSubview:buttonLabel];
    
    UIButton * yule = [[UIButton alloc]initWithFrame:CGRectMake(30, 115, 120, 44)];
    yule.backgroundColor = [UIColor clearColor];
    yule.tag = 102;
    [yule addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yule];
    
    UIButton * tiyu = [[UIButton alloc]initWithFrame:CGRectMake(30, 180, 120, 44)];
    tiyu.backgroundColor = [UIColor clearColor];
    tiyu.tag = 103;
    [tiyu addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tiyu];

    UIButton * keji = [[UIButton alloc]initWithFrame:CGRectMake(30, 245, 120, 44)];
    keji.backgroundColor = [UIColor clearColor];
    keji.tag = 104;
    [keji addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:keji];

    UIButton * caijing = [[UIButton alloc]initWithFrame:CGRectMake(30, 310, 120, 44)];
    caijing.backgroundColor = [UIColor clearColor];
    [self.view addSubview:caijing];
    caijing.tag = 105;
    [caijing addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];

    UIButton * shishang = [[UIButton alloc]initWithFrame:CGRectMake(30, 375, 120, 44)];
    shishang.backgroundColor = [UIColor clearColor];
    shishang.tag = 106;
    [shishang addTarget:self action:@selector(dianjiBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shishang];

    UIButton * back = [[UIButton alloc]initWithFrame:CGRectMake(40, 440, 20, 20)];
    [back setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    zhuScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 320, 416)];
    zhuScrollView.backgroundColor = [UIColor lightGrayColor];
    
    zhuScrollView.showsHorizontalScrollIndicator = NO;
    zhuScrollView.bounces = YES;
    
    zhuScrollView.delegate  = self;
    [self.view addSubview:zhuScrollView];

    image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
    image.image = [UIImage imageNamed:@"news_1.png"];
    [zhuScrollView addSubview:image];
    
    naBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 20, 320, 44)];
    [naBar setBackgroundImage:[UIImage imageNamed:@"n_navBar.png"] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:naBar];
    
    item = [[UINavigationItem alloc]init];
    item.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"n_menu.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(backClick)];
    [naBar pushNavigationItem:item animated:YES];
    
}
-(void)back
{
    XYZViewController * XYZVC = [[XYZViewController alloc]init];
    [self presentViewController:XYZVC animated:YES completion:nil];
}
-(void)backClick
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    zhuScrollView.frame = CGRectMake(200, 94, 320, 330);
    naBar.frame = CGRectMake(200, 50, 320, 44);
    [UIView commitAnimations];
}
-(void)dianjiBtn:(UIButton *)button
{
    switch (button.tag) {
        case 101:
        {
            item.title = @"头条";
            naBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
            [naBar setBackgroundImage:[UIImage imageNamed:@"commonNavBar"] forBarMetrics:UIBarMetricsDefault];
            item.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"n_menu.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(backClick)];
            image.image = [UIImage imageNamed:@"news_1.png"];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationDelegate:self];
            zhuScrollView.frame = CGRectMake(0, 64, 320, 416);
            naBar.frame = CGRectMake(0, 20, 320, 44);
            buttonLabel.frame = CGRectMake(0, 50, 320, 44);
            [UIView commitAnimations];
        }
            break;
        case 102:
        {
            item.title = @"娱乐";
            naBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
            [naBar setBackgroundImage:[UIImage imageNamed:@"commonNavBar"] forBarMetrics:UIBarMetricsDefault];
            item.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"n_menu.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(backClick)];
            image.image = [UIImage imageNamed:@"news_2.png"];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationDelegate:self];
            zhuScrollView.frame = CGRectMake(0, 64, 320, 416);
            naBar.frame = CGRectMake(0, 20, 320, 44);
            buttonLabel.frame = CGRectMake(0, 115, 320, 44);
            [UIView commitAnimations];
        }
            break;
        case 103:
        {
            item.title = @"体育";
            naBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
            [naBar setBackgroundImage:[UIImage imageNamed:@"commonNavBar"] forBarMetrics:UIBarMetricsDefault];
            item.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"n_menu.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(backClick)];
            image.image = [UIImage imageNamed:@"news_3.png"];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationDelegate:self];
            zhuScrollView.frame = CGRectMake(0, 64, 320, 416);
            naBar.frame = CGRectMake(0, 20, 320, 44);
            buttonLabel.frame = CGRectMake(0, 180, 320, 44);
            [UIView commitAnimations];
        }
            break;
        case 104:
        {
            item.title = @"科技";
            naBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
            [naBar setBackgroundImage:[UIImage imageNamed:@"commonNavBar"] forBarMetrics:UIBarMetricsDefault];
            item.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"n_menu.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(backClick)];
            image.image = [UIImage imageNamed:@"news_4.png"];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationDelegate:self];
            zhuScrollView.frame = CGRectMake(0, 64, 320, 416);
            naBar.frame = CGRectMake(0, 20, 320, 44);
            buttonLabel.frame = CGRectMake(0, 245, 320, 44);
            [UIView commitAnimations];
        }
            break;
        case 105:
        {
            item.title = @"财经";
            naBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
            [naBar setBackgroundImage:[UIImage imageNamed:@"commonNavBar"] forBarMetrics:UIBarMetricsDefault];
            item.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"n_menu.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(backClick)];
            image.image = [UIImage imageNamed:@"news_5.png"];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationDelegate:self];
            zhuScrollView.frame = CGRectMake(0, 64, 320, 416);
            naBar.frame = CGRectMake(0, 20, 320, 44);
            buttonLabel.frame = CGRectMake(0, 310, 320, 44);
            [UIView commitAnimations];
        }
            break;
        case 106:
        {
            item.title = @"时尚";
            naBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
            [naBar setBackgroundImage:[UIImage imageNamed:@"commonNavBar"] forBarMetrics:UIBarMetricsDefault];
            item.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"n_menu.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(backClick)];
            image.image = [UIImage imageNamed:@"news_6.png"];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationDelegate:self];
            zhuScrollView.frame = CGRectMake(0, 64, 320, 416);
            naBar.frame = CGRectMake(0, 20, 320, 44);
            buttonLabel.frame = CGRectMake(0, 375, 320, 44);
            [UIView commitAnimations];
        }
            break;
  
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
