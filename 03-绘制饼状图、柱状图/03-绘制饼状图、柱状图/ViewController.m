//
//  ViewController.m
//  03-绘制饼状图、柱状图
//
//  Created by 王鹏飞 on 16/1/3.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "ViewController.h"
#import "WPFProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet WPFProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


// 1. 监听slider value 值的变化
// 2. 将值传递给自定义view
// 3. 让自定义view进行重绘
// 4. 自定义view 根据新的value 值重新画一个扇形
- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.progressView.value = sender.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
