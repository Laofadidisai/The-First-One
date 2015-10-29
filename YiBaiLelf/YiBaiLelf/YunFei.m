//
//  YunFei.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-14.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "YunFei.h"
#import "yun.h"
@implementation YunFei

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
        windArray = [[NSMutableArray alloc]init];
        
        for (int i = 0; i<15; i++)
        {
            yun * wind = [[yun alloc]initWithImage:[UIImage imageNamed:@"w_cloud.png"]];
            //snow.backgroundColor = [UIColor orangeColor];
            wind.frame = CGRectMake(arc4random()%220-40, -50, 120, 50);
            //最开始创建的雪花都在屏幕外面
            wind.isUsed = NO;
            [self addSubview:wind];
            [windArray addObject:wind];
        }
        
        dnowTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(windDown) userInfo:nil repeats:YES];
        
        findTimer = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(findDnow) userInfo:nil repeats:YES];
        
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
    
 
}
-(void)findDnow
{
    for (int i = 0; i<windArray.count; i++)
    {
        yun * windyun = [windArray objectAtIndex:i];
        if (windyun.isUsed == YES)
        {
            windyun.frame = CGRectMake(windyun.frame.origin.x+2, windyun.frame.origin.y+5, windyun.frame.size.width-2.4, windyun.frame.size.height - 1);
            if (windyun.frame.origin.x>241)
            {
                windyun.isUsed = NO;
                windyun.frame = CGRectMake(arc4random()%220-40, -50, 120, 50);
              
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
