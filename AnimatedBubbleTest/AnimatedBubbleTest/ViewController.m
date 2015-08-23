//
//  ViewController.m
//  AnimatedBubbleTest
//
//  Created by sgcy on 15/8/22.
//  Copyright (c) 2015年 sgcy. All rights reserved.
//

#import "ViewController.h"
#import "BubbleView.h"

@interface ViewController ()

@property (strong, nonatomic)BubbleView *animatedView;
@property (weak, nonatomic) IBOutlet UISlider *slider1;
@property (weak, nonatomic) IBOutlet UISlider *slider2;
@property (weak, nonatomic) IBOutlet UISlider *slider3;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animatedView = [[BubbleView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 200, self.view.frame.size.height - 200, 200, 200)];
    [self.view addSubview:self.animatedView];
    
    _animatedView.layer.masksToBounds = NO;
    _animatedView.desPoint = CGPointMake(_animatedView.frame.size.width/2, _animatedView.frame.size.height/2);
}
- (IBAction)reset:(id)sender {
    [_animatedView removeFromSuperview];

    _animatedView = [[BubbleView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 200, self.view.frame.size.height - 200, 200, 200)];
    [self.view addSubview:self.animatedView];
    _animatedView.desPoint = CGPointMake(_animatedView.frame.size.width/2, _animatedView.frame.size.height/2);
    _animatedView.bubbleLayer.durations = @[@(self.slider1.value),@(self.slider2.value),@(self.slider3.value)];
}
- (IBAction)sliderDidSlider1:(id)sender {
    [self.labels enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UILabel *label = (UILabel *)obj;
        UISlider *slider = @[self.slider1,self.slider2,self.slider3][idx];
        label.text = [NSString stringWithFormat:@"%.2f",slider.value];
    }];
}
@end
