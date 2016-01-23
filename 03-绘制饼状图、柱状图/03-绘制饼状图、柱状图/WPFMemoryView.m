//
//  WPFMemoryView.m
//  03-绘制饼状图、柱状图
//
//  Created by 王鹏飞 on 16/1/4.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "WPFMemoryView.h"

@implementation WPFMemoryView


#pragma mark - 内存管理
- (void)drawRect:(CGRect)rect {
    /**
     - 使用Path 对象时的内存管理问题:
     1> 凡是遇到 retain 、 copy 、 create 出的对象, 都需要进行 release
     2> 但是CGPathCreateMutable()不是 OC 方法, 所以不是调用 某个对象的 release方法
     3> CGXxxxxCreate 对应的就有 CGXxxxxRelease。
     4> 通过 CFRelease(任何类型);可以释放任何类型对象.
     */
    
    // 1. 获取图形上下文
    CGContextRef ctxRef = UIGraphicsGetCurrentContext();
    
    // 2. 创建路径对象
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 3. 添加线段
    CGPathMoveToPoint(path, NULL, 50, 50);
    
    CGPathAddLineToPoint(path, NULL, 250, 250);
    
    // 4. 添加
    CGContextAddPath(ctxRef, path);
    
    // 5. 渲染
    CGContextDrawPath(ctxRef, kCGPathStroke);
    
    // 6. 释放
    CFRelease(path);  // 可释放任意类型
    // CGPathRelease(path);
    
}


@end
