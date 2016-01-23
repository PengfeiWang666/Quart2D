//
//  WPFTransformView.m
//  03-绘制饼状图、柱状图
//
//  Created by 王鹏飞 on 16/1/4.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "WPFTransformView.h"

@implementation WPFTransformView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 1. 获取上下文对象
    CGContextRef ctxRef = UIGraphicsGetCurrentContext();
    
#warning 在进行图形上下文矩阵操作之前先把所有的状态信息保存起来
    CGContextSaveGState(ctxRef);
    
    // 向左上移动
    //CGContextTranslateCTM(ctxRef, -100, -100);
    
    // 1.2缩放 指定在x轴y轴的缩放比例
    /**
     以左上角为标准进行缩放
     */
    CGContextScaleCTM(ctxRef, 0.5, 0.5);
    
    // 旋转
    /**
     修改view的transform的旋转
     > 绕着view的中心点旋转
     
     图形上下文的旋转
     > 绕着左上角旋转
     
     */
    // CGContextRotateCTM(ctxRef, M_PI_4);
    
    // 2. 绘制基本图形
    // 圆形
    UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(180, 150) radius:60 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    // 矩形
    UIBezierPath *rectH = [UIBezierPath bezierPathWithRect:CGRectMake(80, 280, 200, 80)];
    
    // 直线
    UIBezierPath *line = [UIBezierPath bezierPath];
    [line moveToPoint:CGPointMake(150, 30)];
    [line addLineToPoint:CGPointMake(280, 400)];
    
    // 3. 将路径添加到上下文中
    CGContextAddPath(ctxRef, circle.CGPath);
    CGContextAddPath(ctxRef, rectH.CGPath);
    CGContextAddPath(ctxRef, line.CGPath);
    
#warning 在需要恢复图形上下文状态的时候恢复原来的状态
    CGContextRestoreGState(ctxRef);
    
    
    // 4. 渲染
    CGContextDrawPath(ctxRef, kCGPathStroke);
}


@end
