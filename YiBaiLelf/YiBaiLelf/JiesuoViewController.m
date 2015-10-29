//
//  JiesuoViewController.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "JiesuoViewController.h"
#import "XYZViewController.h"
@interface JiesuoViewController ()

@end

@implementation JiesuoViewController

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
    
    self.view.backgroundColor = [UIColor colorWithRed:70.0/255.0 green:60.0/255.0 blue:54.0/255.0 alpha:1.0];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    for (int i = 0; i<3; i++)
    {
        for (int j = 0; j<3; j++)
        {
            shuBtn = [[UIButton alloc]initWithFrame:CGRectMake(40+i*90, 130+j*80, 60, 60)];
            shuBtn.tag = (i+1)*1+j*3;
            NSLog(@"%ld",(long)shuBtn.tag);
            [shuBtn setTitle:[NSString stringWithFormat:@"%ld",(long)shuBtn.tag ] forState:UIControlStateNormal];
            [shuBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
            shuBtn.backgroundColor = [UIColor clearColor];
            shuBtn.layer.cornerRadius = 30;
            shuBtn.layer.borderWidth = 2;
            shuBtn.layer.borderColor = [[UIColor colorWithRed:39/255.0 green:24/255.0 blue:24/255.0 alpha:1.0]CGColor];
            
            [shuBtn addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:shuBtn];
        }
    }
    
    UIButton * shuBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(130, 370, 60, 60)];
    shuBtn1.backgroundColor = [UIColor clearColor];
    shuBtn1.tag = 0;
    [shuBtn1 setTitle:[NSString stringWithFormat:@"%ld",(long)shuBtn1.tag ] forState:UIControlStateNormal];
    [shuBtn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    NSLog(@"tag是%d",shuBtn1.tag );
    shuBtn1.layer.cornerRadius = 30;
    shuBtn1.layer.borderWidth = 2;
    shuBtn1.layer.borderColor = [[UIColor colorWithRed:39/255.0 green:24/255.0 blue:24/255.0 alpha:1.0]CGColor];
    [shuBtn1 addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shuBtn1];
    
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(40, 25, 240, 50)];
    title.backgroundColor = [UIColor clearColor];
    title.text = @"Touch ID";
    title.textColor = [UIColor colorWithRed:39/255.0 green:24/255.0 blue:24/255.0 alpha:1.0];
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:30.0];
    [self.view addSubview:title];
    
    
    daojishiLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 75, 240, 15)];
    daojishiLabel.backgroundColor = [UIColor clearColor];
    daojishiLabel.text = @"还有3次机会";
    daojishiLabel.textColor = [UIColor colorWithRed:39/255.0 green:24/255.0 blue:24/255.0 alpha:1.0];
    daojishiLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:daojishiLabel];
    
    mimaqu = [[UIView alloc]initWithFrame:CGRectMake(110, 100, 100, 15)];
    mimaqu.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mimaqu];
    
    mimaLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    mimaLabel1.backgroundColor = [UIColor clearColor];
    mimaLabel1.layer.cornerRadius = 15/2;
    mimaLabel1.layer.borderWidth = 2;
    mimaLabel1.layer.borderColor = [[UIColor colorWithRed:39/255.0 green:24/255.0 blue:24/255.0 alpha:1.0]CGColor];
    mimaLabel1.textColor = [UIColor  clearColor];
    [mimaqu addSubview:mimaLabel1];
    
    mimaLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 15, 15)];
    mimaLabel2.backgroundColor = [UIColor clearColor];
    mimaLabel2.layer.cornerRadius = 15/2;
    mimaLabel2.layer.borderWidth = 2;
    mimaLabel2.layer.borderColor = [[UIColor colorWithRed:39/255.0 green:24/255.0 blue:24/255.0 alpha:1.0]CGColor];
    
    mimaLabel2.textColor = [UIColor  clearColor];
    [mimaqu addSubview:mimaLabel2];
    
    mimaLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, 15, 15)];
    mimaLabel3.backgroundColor = [UIColor clearColor];
    mimaLabel3.layer.cornerRadius = 15/2;
    mimaLabel3.layer.borderWidth = 2;
    mimaLabel3.layer.borderColor = [[UIColor colorWithRed:39/255.0 green:24/255.0 blue:24/255.0 alpha:1.0]CGColor];
    
    mimaLabel3.textColor = [UIColor  clearColor];
    [mimaqu addSubview:mimaLabel3];
    
    mimaLabel4 = [[UILabel alloc]initWithFrame:CGRectMake(90, 0, 15, 15)];
    mimaLabel4.backgroundColor = [UIColor clearColor];
    mimaLabel4.layer.cornerRadius = 15/2;
    mimaLabel4.layer.borderWidth = 2;
    mimaLabel4.layer.borderColor = [[UIColor colorWithRed:39/255.0 green:24/255.0 blue:24/255.0 alpha:1.0]CGColor];
    
    mimaLabel4.textColor = [UIColor  clearColor];
    [mimaqu addSubview:mimaLabel4];
    
    UIButton * clean = [[UIButton alloc]initWithFrame:CGRectMake(230, 400, 40, 20)];
    clean.backgroundColor = [UIColor clearColor];
    [clean setTitle:@"取消" forState:UIControlStateNormal];
    [clean setTitleColor:[UIColor colorWithRed:39/255.0 green:24/255.0 blue:24/255.0 alpha:1.0] forState:UIControlStateNormal];
    [clean addTarget:self action:@selector(cleanClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clean];
    
    a = arc4random()%10;
    b = arc4random()%10;
    c = arc4random()%10;
    d = arc4random()%10;
    NSLog(@"%d,%d,%d,%d",a ,b,c,d);
    
    cishu = 4;
    
}
-(void)touchButton:(UIButton*)tempbtn
{
    
    
    
    NSString * str = [NSString stringWithFormat:@"%ld",(long)tempbtn.tag];
    if (mimaLabel1.text == NULL)
    {
        mimaLabel1.text = str;
        mimaLabel1.layer.borderColor = [[UIColor whiteColor]CGColor];
    }
    else if (mimaLabel2.text == NULL)
    {
        mimaLabel2.text = str;
        mimaLabel2.layer.borderColor = [[UIColor whiteColor]CGColor];
    }
    else if (mimaLabel3.text == NULL)
    {
        mimaLabel3.text = str;
        mimaLabel3.layer.borderColor = [[UIColor whiteColor]CGColor];
    }
    else
    {
        mimaLabel4.text = str;
        mimaLabel4.layer.borderColor = [[UIColor whiteColor]CGColor];
        if ([mimaLabel1.text intValue]==a && [mimaLabel2.text intValue]==b && [mimaLabel3.text intValue]==c && [mimaLabel4.text intValue]==d)
        {
            XYZViewController * nextVC = [[XYZViewController alloc]init];
            [self presentViewController:nextVC animated:YES completion:nil];
        }
        else
        {
            cishu = cishu-1;
            daojishiLabel.text = [NSString stringWithFormat: @"还有%d次机会",cishu];
            if (cishu == 0) {
                self.view.userInteractionEnabled = NO;
                [self tishi];
            }
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration:0.1];
            [UIView setAnimationRepeatCount:1.0];
            mimaqu.frame = CGRectMake(100, 100, 100, 15);
            [UIView setAnimationDidStopSelector:@selector(next)];
            [UIView commitAnimations];
            
            
        }
        
        
        
    }
    
}
-(void)tishi
{
    UIAlertView * tishikuang = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您输入的次数超过四次,请10秒后重新输入" delegate:self cancelButtonTitle:nil otherButtonTitles:@"是的", nil];
    [tishikuang show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(daojishi) userInfo:nil repeats:YES];
    second = 11;
    [time fire];
    
    
}
-(void)daojishi
{
    second--;
    NSLog(@"倒计时:%d",second);
    daojishiLabel.text =[NSString stringWithFormat:@"倒计时%d秒",second];
    if (second==0)
    {
        
        [time invalidate];
        self.view.userInteractionEnabled = YES;
        daojishiLabel.text = @"还有4次机会";
        cishu = 4;
        
        
    }
    
    
}
-(void)cleanClick
{
    
    mimaLabel1.text = NULL;
    mimaLabel1.layer.borderColor = [[UIColor blackColor]CGColor];
    mimaLabel2.text = NULL;
    mimaLabel2.layer.borderColor = [[UIColor blackColor]CGColor];
    mimaLabel3.text = NULL;
    mimaLabel3.layer.borderColor = [[UIColor blackColor]CGColor];
    mimaLabel4.text = NULL;
    mimaLabel4.layer.borderColor = [[UIColor blackColor]CGColor];
    
    
    
}
-(void)next
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationRepeatCount:1.0];
    mimaqu.frame = CGRectMake(120, 100, 100, 15);
    [UIView setAnimationDidStopSelector:@selector(next2)];
    [UIView commitAnimations];
    
    
    
}
-(void)next2
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationRepeatCount:1.0];
    mimaqu.frame = CGRectMake(100, 100, 100, 15);
    [UIView setAnimationDidStopSelector:@selector(next3)];
    [UIView commitAnimations];
    
    
}
-(void)next3
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationRepeatCount:1.0];
    mimaqu.frame = CGRectMake(110, 100, 100, 15);
    [UIView commitAnimations];
    
}









- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
