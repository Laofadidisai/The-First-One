//
//  SoSoViewController.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "SoSoViewController.h"
#import "XYZViewController.h"
@interface SoSoViewController ()

@end

@implementation SoSoViewController

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
    [naBar setBackgroundImage:[UIImage imageNamed:@"s_bg.png"] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:naBar];
    
    UIButton * left = [[UIButton alloc]initWithFrame:CGRectMake(15, 12, 20, 20)];
    left.backgroundColor = [UIColor clearColor];
    [left setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [naBar addSubview:left];
    
    wangzhan = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 320, 30)];
    wangzhan.backgroundColor = [UIColor lightGrayColor];
    
    wangzhan.showsHorizontalScrollIndicator = NO;
    wangzhan.bounces = YES;
    
    wangzhan.contentSize = CGSizeMake(100*8, 30);
    wangzhan.delegate  = self;
    
    NSArray * wangzhi = [[NSArray alloc]initWithObjects:@"百度",@"新浪",@"智游",@"谷歌",@"网易",@"智联招聘",@"58同城",@"前程无忧", nil];
    
    for (int i=0; i<8; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100*i, 0, 100, 30)];
        btn.tag = i+101;
        btn.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
        [btn setTitle:[wangzhi objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [wangzhan addSubview:btn];
    }
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 28, 100, 2)];
    label.backgroundColor = [UIColor magentaColor];
    [wangzhan addSubview:label];
    
    [self.view addSubview:wangzhan];
    
    wangzhiArray = [[NSArray alloc]initWithObjects:@"http://www.baidu.com",@"http://www.sina.com",@"http://www.zhiyou100.com",@"http://www.google.cn",@"http://www.163.com",@"http://http://www.zhaopin.com/",@"http://http://xx.58.com/",@"http://http://www.51job.com/", nil];
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 94, 320, 386)];
    webView.scalesPageToFit = YES;
    webView.scrollView.bounces = NO;
    webView.scrollView.showsVerticalScrollIndicator = NO;
    
    //webView.delegate = self;
    urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[wangzhiArray objectAtIndex:0]]];
    [webView loadRequest:urlRequest];
    
    [self.view addSubview:webView];
}
-(void)btnClick:(UIButton*)button
{
    NSLog(@"%d",button.tag);
    if (wangzhiArray != nil && webView != nil)
    {
        urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[wangzhiArray objectAtIndex:button.tag-101]]];
        [webView loadRequest:urlRequest];
        [UILabel beginAnimations:nil context:nil];
        [UILabel setAnimationDuration:0.1];
        [UILabel setAnimationDelegate:self];
        label.frame = CGRectMake(100*(button.tag-101), 28, 100, 2);
        [UILabel commitAnimations];
    }
   
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}

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
