//
//  rainActitvty.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-11.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "rainActitvty.h"
#import "yun.h"
@implementation rainActitvty

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        rainArray = [[NSMutableArray alloc]init];
        
        for (int i = 0; i<200; i++)
        {
            yun * rain = [[yun alloc]initWithImage:[UIImage imageNamed:@"w_rain.png"]];
            //snow.backgroundColor = [UIColor orangeColor];
            rain.frame = CGRectMake(arc4random()%283, -50, 20, 30);
            //最开始创建的雪花都在屏幕外面
            rain.isUsed = NO;
            [self addSubview:rain];
            [rainArray addObject:rain];
        }
       
        
            dnowTwoTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(windDownTwo) userInfo:nil repeats:YES];
            
            findTwoTimer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(findDnowTwo) userInfo:nil repeats:YES];
        
        
        // Initialization code
    }
    return self;
}

-(void)windDownTwo
{
    
    for (int i = 0; i<rainArray.count; i++) {
        yun * rainyun = [rainArray objectAtIndex:i];
        
        if (rainyun.isUsed == NO) {
            rainyun.isUsed = YES;
            break;
        }
        
    }
}
-(void)findDnowTwo
{
    for (int i = 0; i<rainArray.count; i++)
    {
        yun * rainyun = [rainArray objectAtIndex:i];
        if (rainyun.isUsed == YES) {
            rainyun.frame = CGRectMake(rainyun.frame.origin.x, rainyun.frame.origin.y+3, 20, 30);
            if (rainyun.frame.origin.y>300) {
                rainyun.isUsed = NO;
                rainyun.frame = CGRectMake(arc4random()%283, -50, 20, 30);
            }
        }
    }
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
