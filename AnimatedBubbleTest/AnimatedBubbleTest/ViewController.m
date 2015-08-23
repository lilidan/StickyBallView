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

@property (weak, nonatomic) IBOutlet BubbleView *animatedView;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animatedView.layer.masksToBounds = NO;
    _animatedView.desPoint = CGPointMake(_animatedView.frame.size.width/2, _animatedView.frame.size.height/2);
}
@end
