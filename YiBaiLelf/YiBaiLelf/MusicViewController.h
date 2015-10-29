//
//  MusicViewController.h
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface MusicViewController : UIViewController<UIScrollViewDelegate>
{
    UIView * backView;
    UIView * backgoundView;
    UIImageView * backImage;
    UIView * titImageView;
    UIButton * right;
    
    AVAudioPlayer * music;
    UILabel * yinliang ;
    UILabel * songName;
    UISlider * sound;
    UIProgressView * timeProgress;
    UIImageView * photoView;
    UIButton * kuaitui;
    UIButton * zanting;
    UIButton * start;
    UIButton * kuaijin;
    NSTimer * xuanzhuan;
    float  jiaodu;
    BOOL  pauseBool;
    int  second;
    
    UIScrollView * geciView ;
    UILabel * geciLabel;
    
    UIScrollView * songNameView;
}
@property(nonatomic,assign)float number;
@end
