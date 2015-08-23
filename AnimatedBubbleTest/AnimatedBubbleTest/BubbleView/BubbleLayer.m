//
//  BubbleLayer.m
//  AnimatedBubbleTest
//
//  Created by sgcy on 15/8/23.
//  Copyright (c) 2015年 sgcy. All rights reserved.
//

#import "BubbleLayer.h"
#import "KYSpringLayerAnimation.h"
#import "SCCircleMath.h"

@interface BubbleLayer()

@property(nonatomic,assign)CGFloat angle;
@property(nonatomic,assign)CGRect currentRect;
@property(nonatomic,assign)CGPoint desPoint;

@property(nonatomic,assign)CGFloat factor1;
@property(nonatomic,assign)CGFloat factor2;


@end


@implementation BubbleLayer{
    struct CGSquare square;
}

-(id)init{
    self = [super init];
    if (self) {
        _color = [UIColor blueColor];
        _currentRect = CGRectMake(50, 50, 100, 100);
        _factor1 = 0;
        _factor2 = 0;
        _scaleRatio = 0.6;
        _bubbleSize = 100;
        _durations = @[@(0.6),@(0.8),@(0.3)];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _currentRect = CGRectMake(frame.size.width - _bubbleSize/2,frame.size.height - _bubbleSize/2, _bubbleSize, _bubbleSize);
}

- (void)setBubbleSize:(CGFloat)bubbleSize
{
    _bubbleSize = bubbleSize;
    _currentRect = CGRectMake(self.frame.size.width - _bubbleSize/2,self.frame.size.height - _bubbleSize/2, _bubbleSize, _bubbleSize);
    [self setNeedsDisplay];
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    [self setNeedsDisplay];
}

- (id)initWithLayer:(BubbleLayer *)layer{
    self = [super initWithLayer:layer];
    if (self) {
        self.currentRect = layer.currentRect;
        self.factor1 = layer.factor1;
        self.factor2 = layer.factor2;
        self.angle = layer.angle;
        self.color = layer.color;
        self.durations = layer.durations;
    }
    return self;
}

- (void)setDesPoint:(CGPoint)desPoint
{
    _desPoint = desPoint;
    
    _angle = atanf((desPoint.y - self.position.y)/(desPoint.x - self.position.x));

    [self triggleAnimation];
}

- (void)drawInContext:(CGContextRef)ctx{
    [super drawInContext:ctx];
    
    CGFloat extra1 = (self.currentRect.size.width * 2 / 5) * _factor1;

    CGFloat extra2 = (self.currentRect.size.width * 2 / 5) * _factor2;

    CGFloat radius1 = _currentRect.size.width/2 - extra1;  //短边
    CGFloat radius2 = _currentRect.size.width/2 - extra2;     //长边
    
    CGFloat offset = self.currentRect.size.width / 3.6 - extra1 / 1.8;  //设置3.6 出来的弧度最像圆形

    square.pointB = [SCCircleMath caculatePointFromAngle:_angle CirCleCenter:self.position cirCleRadius:radius1];
    square.pointC = [SCCircleMath caculatePointFromAngle:_angle + M_PI_4*2 CirCleCenter:self.position cirCleRadius:radius2];
    square.pointD = [SCCircleMath caculatePointFromAngle:_angle + M_PI_4*4 CirCleCenter:self.position cirCleRadius:radius1];
    square.pointA = [SCCircleMath caculatePointFromAngle:_angle + M_PI_4*6 CirCleCenter:self.position cirCleRadius:radius1];
    
    CGFloat sinValue = offset * sinf(_angle);
    CGFloat cosValue = offset * cosf(_angle);
    
    CGPoint c1 = CGPointMake(square.pointA.x + sinValue, square.pointA.y - cosValue);
    CGPoint c2 = CGPointMake(square.pointB.x - cosValue, square.pointB.y - sinValue);
    
    CGPoint c3 = CGPointMake(square.pointB.x + cosValue, square.pointB.y + sinValue);
    CGPoint c4 = CGPointMake(square.pointC.x + sinValue, square.pointC.y - cosValue);
    
    CGPoint c5 = CGPointMake(square.pointC.x - sinValue, square.pointC.y + cosValue);
    CGPoint c6 = CGPointMake(square.pointD.x + cosValue, square.pointD.y + sinValue);
    
    CGPoint c7 = CGPointMake(square.pointD.x - cosValue, square.pointD.y - sinValue);
    CGPoint c8 = CGPointMake(square.pointA.x - sinValue, square.pointA.y + cosValue);

    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    
    [ovalPath moveToPoint: square.pointA];
    [ovalPath addCurveToPoint:square.pointB controlPoint1:c1 controlPoint2:c2];
    [ovalPath addCurveToPoint:square.pointC controlPoint1:c3 controlPoint2:c4];
    [ovalPath addCurveToPoint:square.pointD controlPoint1:c5 controlPoint2:c6];
    [ovalPath addCurveToPoint:square.pointA controlPoint1:c7 controlPoint2:c8];
    
    [ovalPath closePath];
    
    CGContextAddPath(ctx, ovalPath.CGPath);
    CGContextSetFillColorWithColor(ctx, self.color.CGColor);
    CGContextFillPath(ctx);
}


+(BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqual:@"factor1"] || [key isEqual:@"factor2"]) {
        return  YES;
    }

    return  [super needsDisplayForKey:key];
}

-(void)triggleAnimation{
    //Spring animation
    CAKeyframeAnimation *anim = [[KYSpringLayerAnimation sharedAnimManager]createSpringAnima:@"factor1" duration:[self.durations[0] floatValue] usingSpringWithDamping:0.5 initialSpringVelocity:3 fromValue:@(0) toValue:@(1 - self.scaleRatio)];
    anim.removedOnCompletion = YES;
    self.factor1 = 1 - self.scaleRatio;
    [self addAnimation:anim forKey:@"triggleAnimation"];
    [self performSelector:@selector(roundAnimation) withObject:nil afterDelay:[self.durations[2] floatValue]];
}

-(void)roundAnimation{
    
    //Spring animation
    CAKeyframeAnimation *anim = [[KYSpringLayerAnimation sharedAnimManager]createSpringAnima:@"factor2" duration:[self.durations[1] floatValue] usingSpringWithDamping:0.5 initialSpringVelocity:2.5 fromValue:@(0) toValue:@(1 - self.scaleRatio)];
    self.factor2 = 1 - self.scaleRatio;
    [self addAnimation:anim forKey:@"restoreAnimation"];
}

@end
