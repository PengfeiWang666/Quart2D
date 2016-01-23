//
//  WPFPieView.m
//  03-绘制饼状图、柱状图
//
//  Created by 王鹏飞 on 16/1/3.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "WPFPieView.h"

@implementation WPFPieView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 1. 获取上下文对象
    CGContextRef ctxRef = UIGraphicsGetCurrentContext();
    
    // 2. 数据
    NSArray *data = @[@30, @15, @5, @17, @3, @10, @20];
    
    // 3. 起始位置
    CGFloat startA = 0;
    
    // 4. 循环开始绘图
    for (NSInteger i = 0; i < data.count; i++) {
        // 计算第 i 个元素，转换成角度
        CGFloat angle = [data[i] floatValue] / 100 * M_PI * 2;
        
        // 末位置 = 初始位置 + 角度
        CGFloat endA = startA + angle;
        
        CGPoint point = CGPointMake(150, 150);
        // 获取路径对象
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:100 startAngle:startA endAngle:endA clockwise:YES];
        
        // 重置起始位置
        startA = endA;
        
        // 向圆心连线
        [path addLineToPoint:point];
        
        // 将路径对象添加到上下文中
        CGContextAddPath(ctxRef, path.CGPath);
        
        // 设置随机色
        [[UIColor colorWithRed:arc4random_uniform(255)/256.0 green:arc4random_uniform(255)/256.0 blue:arc4random_uniform(255)/256.0 alpha:1.0] setFill];;
        
        // 渲染
        CGContextDrawPath(ctxRef, kCGPathFill);
    }
}


@end
