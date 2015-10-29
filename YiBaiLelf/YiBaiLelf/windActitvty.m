//
//  windActitvty.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-11.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "windActitvty.h"
#import "yun.h"
@implementation windActitvty

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        windArray = [[NSMutableArray alloc]init];
        
        for (int i = 0; i<3; i++)
        {
            yun * wind = [[yun alloc]initWithImage:[UIImage imageNamed:@"w_cloud.png"]];
            //snow.backgroundColor = [UIColor orangeColor];
            wind.frame = CGRectMake(330, arc4random()%110 + 25, 120, 50);
            //最开始创建的雪花都在屏幕外面
            wind.isUsed = NO;
            [self addSubview:wind];
            [windArray addObject:wind];
        }
        wind1Array = [[NSMutableArray alloc]init];
        
        for (int i = 0; i<2; i++)
        {
            yun * wind = [[yun alloc]initWithImage:[UIImage imageNamed:@"w_cloud.png"]];
            //snow.backgroundColor = [UIColor orangeColor];
            wind.frame = CGRectMake(350, arc4random()%110 + 25, 120, 50);
            //最开始创建的雪花都在屏幕外面
            wind.isUsed = NO;
            [self addSubview:wind];
            [wind1Array addObject:wind];
        }

      
            dnowTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(windDown) userInfo:nil repeats:YES];
            
            findTimer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(findDnow) userInfo:nil repeats:YES];
            dnowTimer1 = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(windDown1) userInfo:nil repeats:YES];
        
            findTimer1 = [NSTimer scheduledTimerWithTimeInterval:0.075 target:self selector:@selector(findDnow1) userInfo:nil repeats:YES];
        
        
        
        // Initialization code
    }
    return self;
}
-(void)windDown
{
    
    for (int i = 0; i<windArray.count; i++)
    {
        yun * windyun = [windArray objectAtIndex:i];
        
        if (windyun.isUsed == NO)
        {
            windyun.isUsed = YES;
            break;
        }
        
    }
    
    for (int i = 0; i<wind1Array.count; i++)
    {
        yun * windyun1 = [wind1Array objectAtIndex:i];
        
        if (windyun1.isUsed == NO)
        {
            windyun1.isUsed = YES;
            break;
        }
        
    }
}
-(void)findDnow
{
    for (int i = 0; i<windArray.count; i++)
    {
        yun * windyun = [windArray objectAtIndex:i];
        if (windyun.isUsed == YES)
        {
            windyun.frame = CGRectMake(windyun.frame.origin.x-3, windyun.frame.origin.y, 120, 50);
            if (windyun.frame.origin.x<-200)
            {
                windyun.isUsed = NO;
                windyun.frame = CGRectMake(330, arc4random()%120 + 10, 120, 50);
            }
        }
    }
    for (int i = 0; i<wind1Array.count; i++)
    {
        yun * windyun1 = [wind1Array objectAtIndex:i];
        if (windyun1.isUsed == YES)
        {
            windyun1.frame = CGRectMake(windyun1.frame.origin.x-3, windyun1.frame.origin.y, 120, 50);
            if (windyun1.frame.origin.x<-200)
            {
                windyun1.isUsed = NO;
                windyun1.frame = CGRectMake(330, arc4random()%120 + 10, 120, 50);
            }
        }
    }

}
-(void)windDown1
{
    for (int i = 0; i<wind1Array.count; i++)
    {
        yun * windyun1 = [wind1Array objectAtIndex:i];
        
        if (windyun1.isUsed == NO)
        {
            windyun1.isUsed = YES;
            break;
        }
        
    }
}
-(void)findDnow1
{
    for (int i = 0; i<wind1Array.count; i++)
    {
        yun * windyun1 = [wind1Array objectAtIndex:i];
        if (windyun1.isUsed == YES)
        {
            windyun1.frame = CGRectMake(windyun1.frame.origin.x-1, windyun1.frame.origin.y, 120, 50);
            if (windyun1.frame.origin.x<-200)
            {
                windyun1.isUsed = NO;
                windyun1.frame = CGRectMake(330, arc4random()%120 + 10, 120, 50);
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
