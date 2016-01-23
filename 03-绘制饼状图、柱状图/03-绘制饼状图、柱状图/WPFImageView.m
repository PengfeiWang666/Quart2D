//
//  WPFImageView.m
//  03-绘制饼状图、柱状图
//
//  Created by 王鹏飞 on 16/1/4.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "WPFImageView.h"

@implementation WPFImageView


- (void)drawRect:(CGRect)rect {
    
    // 1. 加载一张图片
    UIImage *img = [UIImage imageNamed:@"me"];
    
    // 2. 从某个点开始绘制
    //[img drawAtPoint:CGPointMake(20, 20)];
    
    // 3. 在指定区域内绘制
    [img drawInRect:rect];
    
    // 4. 在一个矩形框里平铺重叠显示
    //[img drawAsPatternInRect:rect];
    
    #pragma mark - 文字的绘制
    // 1. 文字内容
    NSString *text = @"今天是个好日子";
    
    // 2. 设置格式
    NSDictionary *dict = @{
                           NSFontAttributeName: [UIFont systemFontOfSize:20],
                           NSForegroundColorAttributeName: [UIColor redColor]
                           };
    
#warning 以下两种绘制方法可以同时使用
    
    // 3. 从某个点开始绘制
    [text drawAtPoint:CGPointMake(100, 200) withAttributes:dict];
    
    // 4. 在某个区域开始绘制
    [text drawInRect:rect withAttributes:dict];
    
}


@end
