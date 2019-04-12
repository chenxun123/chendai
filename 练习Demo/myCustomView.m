//
//  myCustomView.m
//  练习Demo
//
//  Created by peter on 2019/2/14.
//  Copyright © 2019年 peter. All rights reserved.
//

#import "myCustomView.h"

@implementation myCustomView

- (void)drawRect:(CGRect)rect{

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (int i = 0; i < 10; i++) {
        
        CGContextBeginPath(ctx);
        CGContextAddArc(ctx, (i+1) * 25, (i+1) * 25, (i + 1) * 8, M_PI * 1.5, M_PI, 0);
        CGContextClosePath(ctx);
        CGContextSetRGBFillColor(ctx, (10 - i) * 0.1, 0, 1, 1);
        CGContextFillPath(ctx);
    }
}

@end
