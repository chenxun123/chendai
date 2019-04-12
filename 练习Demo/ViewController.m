//
//  ViewController.m
//  练习Demo
//
//  Created by peter on 2019/1/11.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "ViewController.h"
#import "myCustomView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
   
    [self setCustomView];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - 自定义view实现绘图绘制图形
- (void)setCustomView{
    
    myCustomView * vi = [[myCustomView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:vi];
}
#pragma mark - 通过设置滑动条的完成部分与未完成部分的背景图片实现评星控件（感觉不太好）
- (void)setStartView{
    
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(30, 100, 410, 100)];
    [slider setMinimumTrackImage:[[UIImage imageNamed:@"img_star"] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile] forState:UIControlStateNormal];
    [slider setMaximumTrackImage:[[UIImage imageNamed:@"img_star_empty"] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile] forState:UIControlStateNormal];
    slider.thumbTintColor = [UIColor clearColor];
    [self.view addSubview:slider];
}

@end
