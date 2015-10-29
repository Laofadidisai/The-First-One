//
//  SoSoViewController.h
//  YiBaiLelf
//
//  Created by 老李 on 15-10-9.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SoSoViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView * wangzhan;
    int a;
    int b;
    NSArray * wangzhiArray;
    
    UIWebView * webView;
    NSURLRequest * urlRequest;
    UILabel * label;
}
@end
