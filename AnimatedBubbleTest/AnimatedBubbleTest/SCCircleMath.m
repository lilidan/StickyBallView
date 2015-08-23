//
//  GXCircleMath.m
//  GXArcView
//
//  Created by sgcy on 15/7/22.
//  Copyright (c) 2015年 sgcy. All rights reserved.
//

#import "SCCircleMath.h"
@implementation SCCircleMath

+ (CGFloat)caculaterRotateAngleFromCircleRadius:(CGFloat)circleRadius
                                       distance:(CGFloat)distance
{
    return asinf(distance/circleRadius);
}

+ (CGFloat)caculateYPositionFromXPoision:(CGFloat)xPosition
                            CirCleCenter:(CGPoint)center
                            cirCleRadius:(CGFloat)radius
{
    return sqrt(radius*radius - (xPosition - center.x)*(xPosition - center.x)) + center.y;
}

+ (CGFloat)caculateLineFromPointA:(CGPoint)pointA
                        andPointB:(CGPoint)pointB
                        xPosition:(CGFloat)xPosition
{
    return (pointA.y + pointB.y)/2 - ((pointB.x - pointA.x)/(pointB.y - pointA.y)) * (xPosition - (pointA.x + pointB.x)/2);
}

+ (CGPoint)caculatePointFromAngle:(CGFloat)angle
                     CirCleCenter:(CGPoint)center
                     cirCleRadius:(CGFloat)radius
{
    CGFloat x = center.x + radius * sinf(angle);
    CGFloat y = center.y - radius * cosf(angle);
    return CGPointMake(x, y);
}

@end
