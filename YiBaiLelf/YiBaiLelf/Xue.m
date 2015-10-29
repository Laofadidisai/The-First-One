//
//  Xue.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-14.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "Xue.h"
#import "yun.h"
@implementation Xue

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
        xueArray = [[NSMutableArray alloc]init];
        xuebigArray = [[NSMutableArray alloc]init];
        xuesmArray = [[NSMutableArray alloc]init];
        
        for (int i = 0; i<150; i++)
        {
            yun * rain = [[yun alloc]initWithImage:[UIImage imageNamed:@"xuehua.png"]];
            //snow.backgroundColor = [UIColor orangeColor];
            rain.frame = CGRectMake(arc4random()%283, -50, 10, 10);
            //最开始创建的雪花都在屏幕外面
            rain.isUsed = NO;
            [self addSubview:rain];
            [xueArray addObject:rain];
            rain.alpha = 0.7;
        }
        for (int i = 0; i<20; i++)
        {
            yun * rain = [[yun alloc]initWithImage:[UIImage imageNamed:@"xuehua.png"]];
            //snow.backgroundColor = [UIColor orangeColor];
            rain.frame = CGRectMake(arc4random()%283, -50, 15, 15);
            //最开始创建的雪花都在屏幕外面
            rain.isUsed = NO;
            [self addSubview:rain];
            [xuebigArray addObject:rain];
            rain.alpha = 0.8;
        }
        for (int i = 0; i<50; i++)
        {
            yun * rain = [[yun alloc]initWithImage:[UIImage imageNamed:@"xuehua.png"]];
            //snow.backgroundColor = [UIColor orangeColor];
            rain.frame = CGRectMake(arc4random()%283, -50, 5, 5);
            //最开始创建的雪花都在屏幕外面
            rain.isUsed = NO;
            [self addSubview:rain];
            [xuesmArray addObject:rain];
            rain.alpha = 0.6;
        }


        
        dnowTwoTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(windDownTwo) userInfo:nil repeats:YES];
        
        findTwoTimer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(findDnowTwo) userInfo:nil repeats:YES];
        
        
        // Initialization code
    }
    return self;
}

-(void)windDownTwo
{
    
    for (int i = 0; i<xueArray.count; i++) {
        yun * rainyun = [xueArray objectAtIndex:i];
        
        if (rainyun.isUsed == NO) {
            rainyun.isUsed = YES;
            break;
        }
        
    }
    for (int i = 0; i<xuebigArray.count; i++) {
        yun * rainyun = [xuebigArray objectAtIndex:i];
        
        if (rainyun.isUsed == NO) {
            rainyun.isUsed = YES;
            break;
        }
        
    }
    for (int i = 0; i<xuesmArray.count; i++) {
        yun * rainyun = [xuesmArray objectAtIndex:i];
        
        if (rainyun.isUsed == NO) {
            rainyun.isUsed = YES;
            break;
        }
        
    }


}
-(void)findDnowTwo
{
    for (int i = 0; i<xueArray.count; i++)
    {
        yun * rainyun = [xueArray objectAtIndex:i];
        if (rainyun.isUsed == YES) {
            rainyun.frame = CGRectMake(rainyun.frame.origin.x, rainyun.frame.origin.y+3, 10, 10);
            if (rainyun.frame.origin.y>250) {
                rainyun.isUsed = NO;
                rainyun.frame = CGRectMake(arc4random()%283, -50, 10, 10);
            }
        }
    }
    for (int i = 0; i<xuebigArray.count; i++)
    {
        yun * rainyun = [xuebigArray objectAtIndex:i];
        if (rainyun.isUsed == YES) {
            rainyun.frame = CGRectMake(rainyun.frame.origin.x, rainyun.frame.origin.y+3, 15, 15);
            if (rainyun.frame.origin.y>300) {
                rainyun.isUsed = NO;
                rainyun.frame = CGRectMake(arc4random()%283, -50, 15, 15);
            }
        }
    }
    for (int i = 0; i<xuesmArray.count; i++)
    {
        yun * rainyun = [xuesmArray objectAtIndex:i];
        if (rainyun.isUsed == YES) {
            rainyun.frame = CGRectMake(rainyun.frame.origin.x, rainyun.frame.origin.y+3, 5, 5);
            if (rainyun.frame.origin.y>170) {
                rainyun.isUsed = NO;
                rainyun.frame = CGRectMake(arc4random()%283, -50, 5, 5);
            }
        }
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

@end
