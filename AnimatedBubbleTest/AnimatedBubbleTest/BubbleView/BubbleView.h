//
//  BubbleView.h
//  AnimatedBubbleTest
//
//  Created by sgcy on 15/8/23.
//  Copyright (c) 2015年 sgcy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BubbleLayer.h"

@interface BubbleView : UIView

@property (nonatomic,assign) CGPoint desPoint;
@property (nonatomic,strong) BubbleLayer *bubbleLayer;

@end


