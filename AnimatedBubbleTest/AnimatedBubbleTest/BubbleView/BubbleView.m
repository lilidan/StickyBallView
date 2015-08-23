//
//  BubbleView.m
//  AnimatedBubbleTest
//
//  Created by sgcy on 15/8/23.
//  Copyright (c) 2015年 sgcy. All rights reserved.
//

#import "BubbleView.h"
#import "BubbleLayer.h"
#import "KYSpringLayerAnimation.h"

@implementation BubbleView
{
    BubbleLayer *bubbleLayer;
}

- (void)initTheView
{
    bubbleLayer = [BubbleLayer layer];
    CGRect rect = self.bounds;
    [self.layer addSublayer:bubbleLayer];
    
    bubbleLayer.frame = rect;
    bubbleLayer.bubbleSize = 100;
    bubbleLayer.color = [UIColor blueColor];
    bubbleLayer.scaleRatio = 0.7;

    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tapGr];
}


-(void)tap:(UITapGestureRecognizer *)tapGr
{
    tapGr.enabled = NO;

    CGRect frame = self.frame;
    frame.origin = CGPointZero;
    
    CGPoint originalcenter = self.center;
    
    CGPoint center = self.desPoint;
    
    [bubbleLayer setDesPoint:[self.superview convertPoint:center toView:self]];
    
    CAKeyframeAnimation *anim = [[KYSpringLayerAnimation sharedAnimManager]createSpringAnima:@"position" duration:1.0 usingSpringWithDamping:0.9 initialSpringVelocity:1 fromValue:[NSValue valueWithCGPoint:originalcenter] toValue:[NSValue valueWithCGPoint:center]];
    self.layer.position= center;
    [self.layer addAnimation:anim forKey:@"move"];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initTheView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initTheView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTheView];
    }
    return self;
}


@end
