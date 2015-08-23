//
//  BubbleLayer.h
//  AnimatedBubbleTest
//
//  Created by sgcy on 15/8/23.
//  Copyright (c) 2015年 sgcy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

struct CGSquare{
    CGPoint pointA;
    CGPoint pointB;
    CGPoint pointC;
    CGPoint pointD;
};

@interface BubbleLayer : CALayer

@property(nonatomic,strong)UIColor *color;

@property(nonatomic,assign)CGFloat bubbleSize;

@property(nonatomic,assign)CGFloat scaleRatio;

- (void)setDesPoint:(CGPoint)desPoint;

@end
