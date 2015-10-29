//
//  MusicViewController.m
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "MusicViewController.h"
#import "XYZViewController.h"
@interface MusicViewController ()

@end

@implementation MusicViewController
@synthesize number;
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
    
    backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 320, 416)];
    backImage.image = [UIImage imageNamed:@"屏幕快照 2015-09-21 下午7.28.26.png"];
    [self.view addSubview:backImage];
    
    backgoundView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 460)];
    backgoundView.backgroundColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0];
    backgoundView.alpha = 0.4;
    [self.view addSubview:backgoundView];
    
    backView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 460)];
    backView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backView];
    
    titImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    titImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"commonNavBar.png"]];
    [backView addSubview:titImageView];
    
    UIButton * lefto = [[UIButton alloc]initWithFrame:CGRectMake(15, 12, 20, 20)];
    lefto.backgroundColor = [UIColor clearColor];
    [lefto setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [lefto addTarget:self action:@selector(bcak) forControlEvents:UIControlEventTouchUpInside];
    [titImageView addSubview:lefto];
    
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(130, 12, 60, 20)];
    title.backgroundColor = [UIColor clearColor];
    title.text = @"音 乐";
    title.font = [UIFont boldSystemFontOfSize:19.0];
    //title.font = [UIFont italicSystemFontOfSize:20.0];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    [titImageView addSubview:title];
    
    right = [[UIButton alloc]initWithFrame:CGRectMake(275, 6, 30, 30)];
    right.backgroundColor = [UIColor clearColor];
    [right setBackgroundImage:[UIImage imageNamed:@"555.png"] forState:UIControlStateNormal];
    [right addTarget:self action:@selector(soundNum) forControlEvents:UIControlEventTouchUpInside];
    [titImageView addSubview:right];
    
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"十年" ofType:@"mp3"];//
    NSURL * fileUrl = [[NSURL alloc]initFileURLWithPath:filePath];    //
    music = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:nil];   //
    //[music play];
    

    
    sound = [[UISlider alloc]initWithFrame:CGRectMake(240, 100, 100, 20)];
    sound.backgroundColor = [UIColor clearColor];
    sound.minimumTrackTintColor = [UIColor blueColor];
    sound.maximumTrackTintColor = [UIColor lightGrayColor];
    
    [sound addTarget:self action:@selector(soundChange:) forControlEvents:UIControlEventValueChanged];
    sound.minimumValue = 0.0;
    sound.maximumValue = 1.0;
    sound.value = music.volume;
    
    sound.transform = CGAffineTransformMakeRotation(M_PI_2);//旋转90度
   
    [sound setHidden:YES];

    [backView addSubview:sound];
    //UIProgressView 进度条
    timeProgress = [[UIProgressView alloc]initWithFrame:CGRectMake(50, 432, 220, 20)];
    timeProgress.progressViewStyle = UIProgressViewStyleDefault;
    timeProgress.progressTintColor = [UIColor greenColor];
    [backView addSubview:timeProgress];
    
    UIButton * list = [[UIButton alloc]initWithFrame:CGRectMake(285, 440, 20, 20)];
    list.backgroundColor = [UIColor clearColor];
    [list setBackgroundImage:[UIImage imageNamed:@"n_menu.png"] forState:UIControlStateNormal];
    [list addTarget:self action:@selector(listBiao) forControlEvents:UIControlEventTouchUpInside];
    pauseBool = YES;
    [self.view addSubview:list];
    
    

    yinliang = [[UILabel alloc]initWithFrame:CGRectMake(50, 93, 220, 30)];
    yinliang.backgroundColor = [UIColor clearColor];
    yinliang.text = @"陈奕迅";
    yinliang.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:yinliang];
    
    songName = [[UILabel alloc]initWithFrame:CGRectMake(50, 60, 220, 30)];
    songName.backgroundColor = [UIColor clearColor];
    songName.text = @"十年";
    songName.font = [UIFont systemFontOfSize:35.0];
    songName.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:songName];
    
    photoView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 128, 200, 200)];
    photoView.image = [UIImage imageNamed:@"10"];
    [backView addSubview:photoView];
    
    geciView = [[UIScrollView alloc]initWithFrame:CGRectMake(60, 240, 200, 120)];
    geciView.backgroundColor = [UIColor clearColor];
    //geciView.clipsToBounds = YES;
    geciView.showsHorizontalScrollIndicator = YES;
    geciView.bounces = NO;
    
    geciView.pagingEnabled = YES;
    //geciView.contentSize = CGSizeMake(200, 1000);
    geciView.delegate  = self;
    [backView addSubview:geciView];
    [self.view addSubview:geciView];
    
    geciLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 180, 1100)];
    geciLabel.text = @"\n十年\n演唱：陈奕迅\n如果那两个字没有颤抖\n我不会发现 我难受\n怎么说出口\n也不过是分手\n如果对于明天没有要求\n牵牵手就像旅游\n成千上万个门口\n总有一个人要先走\n怀抱既然不能逗留\n何不在离开的时候\n一边享受\n一边泪流\n十年之前\n我不认识你 你不属于我\n我们还是一样\n陪在一个陌生人左右\n走过渐渐熟悉的街头\n十年之后\n我们是朋友 还可以问候\n只是那种温柔\n再也找不到拥抱的理由\n情人最后难免沦为朋友\n\n\n\n\n\n怀抱既然不能逗留\n何不在离开的时候\n一边享受\n一边泪流\n十年之前\n我不认识你 你不属于我\n我们还是一样\n陪在一个陌生人左右\n走过渐渐熟悉的街头\n十年之后\n我们是朋友 还可以问候\n只是那种温柔\n再也找不到拥抱的理由\n情人最后难免沦为朋友\n\n直到和你做了多年朋友\n才明白我的眼泪\n不是为你而流\n也为别人而流\n\n\n\n\n\n\n\n...\n...\n...\n...";
    geciLabel.textColor = [UIColor orangeColor];
    geciLabel.backgroundColor = [UIColor clearColor];
    geciLabel.textAlignment = YES;
    geciLabel.numberOfLines = 0;//自动调节行数
    [geciView addSubview:geciLabel];

    songNameView = [[UIScrollView alloc]initWithFrame:CGRectMake(230, 310, 80, 120)];
    songNameView.backgroundColor = [UIColor lightGrayColor];
    songNameView.layer.cornerRadius = 10;
    songNameView.showsHorizontalScrollIndicator = YES;
    songNameView.bounces = NO;
    songNameView.pagingEnabled = YES;
    songNameView.hidden = YES;
    songNameView.delegate = self;
    songNameView.alpha = 0.8;
    [self.view addSubview:songNameView];
    
    kuaitui = [[UIButton alloc]initWithFrame:CGRectMake(50, 347, 70, 70)];
    [kuaitui setBackgroundImage:[UIImage imageNamed:@"tui1.png"] forState:UIControlStateNormal];
    [backView addSubview:kuaitui];
    
    zanting = [[UIButton alloc]initWithFrame:CGRectMake(120, 342,80, 80)];
    [zanting setBackgroundImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
    [zanting addTarget:self action:@selector(zanting) forControlEvents:UIControlEventTouchUpInside];
    [zanting setHidden:YES];

    start = [[UIButton alloc]initWithFrame:CGRectMake(120, 342,80, 80)];
    [start setBackgroundImage:[UIImage imageNamed:@"ple.png"] forState:UIControlStateNormal];
    [start addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:start];

    xuanzhuan = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(rotate) userInfo:nil repeats:YES];
    second = 1025;
    [xuanzhuan setFireDate:[NSDate distantFuture]];

    [backView addSubview:zanting];
    
    kuaijin = [[UIButton alloc]initWithFrame:CGRectMake(200, 347, 70, 70)];
    [kuaijin setBackgroundImage:[UIImage imageNamed:@"jin1.png"] forState:UIControlStateNormal];
    [backView addSubview:kuaijin];
    
    
    //[xuanzhuan fire];
    
    
    
    //return YES;
}

-(void)soundChange:(UISlider*)temslied
{
    music.volume = temslied.value;
    
}
-(void)zanting
{
    [music stop];
    [xuanzhuan setFireDate:[NSDate distantFuture]];
    [zanting setHidden:YES];
    [start setHidden:NO];
    
//    if (pauseBool == NO) {
//       pauseBool = YES;
//        [music play];
//        [xuanzhuan setFireDate:[NSDate distantPast]];
//      }
//    else
//      {
//        pauseBool = NO;
//        [music stop];
//        [xuanzhuan setFireDate:[NSDate distantFuture]];
//        
//      }
    
    
}
-(void)startClick
{
    [music play];
    [xuanzhuan setFireDate:[NSDate distantPast]];
    [start setHidden:YES];
    [zanting setHidden:NO];
    
}
-(void)listBiao
{
    if (pauseBool == YES) {
        pauseBool = NO;
         songNameView.hidden = NO;
    }
   else
   {
       pauseBool = YES;
       songNameView.hidden = YES;
   }
    
}
-(void)rotate
{
    second = second - 1;
    jiaodu = jiaodu + 1;
    photoView.transform = CGAffineTransformMakeRotation(jiaodu/180 * M_PI);
    timeProgress.progress += 0.2/music.duration;
    NSLog(@"时间:%d",second);
    if (second == 0) {
        pauseBool = NO;
        [xuanzhuan invalidate];
    }
    //int a = second;
    
    
    geciLabel.frame = CGRectMake(10, geciLabel.frame.origin.y-1.12, 180, 1100);
    

}
-(void)soundNum
{
    if (pauseBool == YES) {
        pauseBool = NO;
        [sound setHidden:YES];
    }else
    {
        pauseBool = YES;
        [sound setHidden:NO];
        
    }
}

-(void)bcak
{
    XYZViewController * XYZVC = [[XYZViewController alloc]init];
    [self presentViewController:XYZVC animated:YES completion:nil];
    [music pause];
    [backView removeFromSuperview];
    [xuanzhuan invalidate];
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
