//
//  WPFColumnView.m
//  03-绘制饼状图、柱状图
//
//  Created by 王鹏飞 on 16/1/3.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "WPFColumnView.h"

@implementation WPFColumnView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 0.数据  用1000作为基数
    NSArray *data = @[@300, @150.65, @55.3, @507.7, @95.8, @700, @650.65];
    
    // 1. 获取上下文对象
    CGContextRef ctxRef = UIGraphicsGetCurrentContext();
    
    // 2. 计算柱子宽度(使间距和宽度一样)
    CGFloat width = self.frame.size.width / (data.count * 2 - 1);
    
    // 3. 循环绘画
    for (NSInteger i = 0; i < data.count; i++) {
        CGFloat x = i * width * 2;
        CGFloat height = [data[i] floatValue] / 1000.0 * self.frame.size.height;
        CGFloat y = self.frame.size.height - height;
        
        // 创建路径对象
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
        // 设置随机色
        [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0] setFill];
        
        CGContextAddPath(ctxRef, path.CGPath);
        
        
        // 4. 渲染
        // 一定要放在循环内部，否则所有柱子都是一个颜色
        CGContextDrawPath(ctxRef, kCGPathFill);
    }
    
    
    
    
    
    
}


@end
