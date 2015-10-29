//
//  Round.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-12.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "Round.h"
#import "MusicViewController.h"
@implementation Round

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UISlider * sound = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        sound.backgroundColor = [UIColor clearColor];
        sound.minimumTrackTintColor = [UIColor blueColor];
        sound.maximumTrackTintColor = [UIColor lightGrayColor];
        
        [sound addTarget:self action:@selector(soundChange:) forControlEvents:UIControlEventValueChanged];
        sound.minimumValue = 0.0;
        sound.maximumValue = 1.0;
        musicVC = [[MusicViewController alloc]init];
        sound.value = musicVC.number;
        sound.transform = CGAffineTransformMakeRotation(M_PI_2);//旋转90度
        
        [self addSubview:sound];
        
        
        // Initialization code
    }
    return self;
}
-(void)soundChange:(UISlider*)temslied
{
    musicVC.number = temslied.value;
    
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
