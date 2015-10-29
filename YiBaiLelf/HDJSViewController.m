//
//  HDJSViewController.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-12.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "HDJSViewController.h"
#import "XYZViewController.h"
#import "ViewButton.h"
@interface HDJSViewController ()

@end

@implementation HDJSViewController

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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    
    for (int i = 0; i<4; i++) {
        btnBig = [[ViewButton alloc]initWithFrame:CGRectMake(30+70*i, 150, 50, 50)];
        btnBig.tag = i;
        static int num;
        if (0 == i) {
            num = arc4random()%10;
            tempNum = num;
        }
        if (1 == i) {
            num = arc4random()%10;
            for (;num == tempNum; num = arc4random()%10) {
            }
                tempNum2 = num;
          
        }
        if (2 == i) {
            num = arc4random()%10;
            for (; num == tempNum || num == tempNum2; num = arc4random()%10) {
            }
                tempNum3 = num;
            
        }
        if (3 == i) {
            num = arc4random()%10;
            for (; num == tempNum || num == tempNum2 || num == tempNum3; num = arc4random()%10) {
            }
                tempNum4 = num;
            
        }
        
        [btnBig setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"b_%d.png",num]] forState:UIControlStateNormal];
        [self.view addSubview:btnBig];
        
    }
    SuiJi = [[NSMutableArray alloc]initWithCapacity:0];
    
    [SuiJi addObject:[NSString stringWithFormat:@"%d",tempNum]];
    [SuiJi addObject:[NSString stringWithFormat:@"%d",tempNum2]];

    [SuiJi addObject:[NSString stringWithFormat:@"%d",tempNum3]];
    [SuiJi addObject:[NSString stringWithFormat:@"%d",tempNum4]];

    
    outText = [NSString stringWithFormat:@"%@",SuiJi];
    
    anniu = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i<2; i++) {
        for (int j = 0; j<5; j++) {
            btn = [[ViewButton alloc]initWithFrame:CGRectMake(20+60*j, 300+60*i, 40, 40)];
            [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"s_%d.png",j+5*i ]] forState:UIControlStateNormal];
            btn.tag = j+5*i;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
            btn.Click = NO;
            count = 0;
        
        }
    }
    
}
-(void)btnClick:(ViewButton *)button
{
    NSString * str = [NSString stringWithFormat:@"%d",button.tag];
    [anniu addObject:str];
    inputText = [NSString stringWithFormat:@"%@",anniu];
    
    if (button.Click == NO)
    {
        button.Click = YES;
        if (count == 0)
        {
            count = count + 1;
            [UIView animateWithDuration:1.0 animations:^{button.frame = CGRectMake(35, 155, 40, 40);}];
        }
        else if (count == 1)
        {
            count = count + 1;
            [UIView animateWithDuration:1.0 animations:^{button.frame = CGRectMake(105, 155, 40, 40);}];
        }
        else if (count == 2)
        {
            count = count + 1;
            [UIView animateWithDuration:1.0 animations:^{button.frame = CGRectMake(175, 155, 40, 40);}];
        }
        else if(count == 3)
        {
            count = count + 1;
            [UIView animateWithDuration:1.0 animations:^{button.frame = CGRectMake(245, 155, 40, 40);}];
            if ([inputText isEqualToString:outText])
            {
                NSLog(@"对了");
                [self performSelector:@selector(nextView) withObject:nil afterDelay:1.0];
            }
            else
            {
                NSLog(@"不对");
                button.Click = YES;
                count = 0;
                inputText = @"";
                [anniu removeAllObjects];
            }
        }
        
    }
    else if (button.Click == YES)
    {
        if (button.tag<5) {
            [UIView animateWithDuration:1.0 animations:^{
                button.frame = CGRectMake(20+60*button.tag, 300, 40, 40);
            }];
            button.Click = NO;
        }
        else if(button.tag>4)
        {
            [UIView animateWithDuration:1.0 animations:^{
                button.frame = CGRectMake(20+60*(button.tag-5), 360, 40, 40);}];
            button.Click = NO;
        }
    }
    return;
}

-(void)nextView
{
    XYZViewController * View = [[XYZViewController alloc]init];
    [self presentViewController:View animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
