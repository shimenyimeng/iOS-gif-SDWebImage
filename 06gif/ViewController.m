//
//  ViewController.m
//  06gif
//
//  Created by 顾雪飞 on 16/12/6.
//  Copyright © 2016年 顾雪飞. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self method1];
    [self method2];
    
}

// SDWebImage并没有适配2x和3x，所以需要手动修改一下里面的判断
- (void)method1 {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    [self.view addSubview:imageView];
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"daka.gif" ofType:nil];
//        NSString *URLString = [NSString stringWithFormat:@"file://%@", path];
//        [imageView sd_setImageWithURL:[NSURL URLWithString:URLString]];
    UIImage *image = [UIImage sd_animatedGIFNamed:@"daka"];
    imageView.image = image;
}

// 这个方法只能加载固定的动图，SDWebImage并没有做2x和3x的适配
- (void)method2 {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    [self.view addSubview:imageView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"daka@2x.gif" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [UIImage sd_animatedGIFWithData:data];
    imageView.image = image;
}

// 不行
- (void)method3 {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"daka.gif" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
}


@end
