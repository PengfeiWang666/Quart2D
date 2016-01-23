//
//  WPFProgressView.m
//  03-绘制饼状图、柱状图
//
//  Created by 王鹏飞 on 16/1/4.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "WPFProgressView.h"

@implementation WPFProgressView

// 重写value 的set 方法
- (void)setValue:(CGFloat)value {
    _value = value;
    
    // 内部进行重绘
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 1. 获取上下文
    CGContextRef ctxRef = UIGraphicsGetCurrentContext();
    
    // 2. 获取路径，进行绘图
    //    获取中心点
    CGFloat centerX = self.frame.size.width / 2;
    CGFloat centerY = self.frame.size.height / 2;
    CGPoint center = CGPointMake(centerX, centerY);
    
    CGFloat endA = self.value * M_PI * 2 - M_PI_2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:-M_PI_2 endAngle:endA clockwise:YES];
    
    // 连线
    [path addLineToPoint:center];
    
    // 3. 将路径对象添加到上下文中
    CGContextAddPath(ctxRef, path.CGPath);
    
    // 4. 渲染
    [[UIColor redColor] setFill];
    CGContextDrawPath(ctxRef, kCGPathFill);
    
    
    
}


@end
