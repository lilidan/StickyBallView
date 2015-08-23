//
//  GXCircleMath.h
//  GXArcView
//
//  Created by sgcy on 15/7/22.
//  Copyright (c) 2015年 sgcy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SCCircleMath : NSObject

/*!
    @brief 根据 圆弧的半径 和 弧上的点到圆垂直中线的距离 来计算弧上点所在半径与垂直线的夹角
  
    @param circleRadius 圆弧半径
  
    @param distance 弧上的点到圆垂直中线的距离
 
    @return CGFloat 弧上点所在半径与垂直线的夹角
*/
+ (CGFloat)caculaterRotateAngleFromCircleRadius:(CGFloat)circleRadius
                                       distance:(CGFloat)distance;



/*!
     @brief 已知 圆弧中心 和 圆弧半径 ，根据弧上点X坐标来计算Y坐标
   
     @param  xPosition  X坐标
   
     @param  center 圆弧中心
 
     @param  radius 圆弧半径
 
     @return CGFloat Y坐标
*/
+ (CGFloat)caculateYPositionFromXPoision:(CGFloat)xPosition
                            CirCleCenter:(CGPoint)center
                            cirCleRadius:(CGFloat)radius;




/*!
     @brief 已知 点A 和 点B，求两点中垂线
   
     @param  xPosition 中垂线的X坐标
 
     @return CGFloat 中垂线的Y坐标
*/
+ (CGFloat)caculateLineFromPointA:(CGPoint)pointA
                        andPointB:(CGPoint)pointB
                     xPosition:(CGFloat)xPosition;



+ (CGPoint)caculatePointFromAngle:(CGFloat)angle
                        CirCleCenter:(CGPoint)center
                        cirCleRadius:(CGFloat)radius;



@end
