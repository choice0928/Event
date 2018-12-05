//
//  CustomBtn.m
//  Event
//
//  Created by 王鑫 on 2018/12/5.
//  Copyright © 2018 wangxin. All rights reserved.
//

#import "CustomBtn.h"

@implementation CustomBtn

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (!self.userInteractionEnabled || [self isHidden] || self.alpha <= 0.01) {
        return nil;
    }

    //判断当前视图是否在点击范围内
    if ([self pointInside:point withEvent:event]) {
        //遍历当前对象的子视图(倒序)
        __block UIView *hit = nil;
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //坐标转换
            CGPoint convertPoint = [self convertPoint:point toView:obj];
            //调用子视图的hitTest方法
            hit = [obj hitTest:convertPoint withEvent:event];
            //如果找到了就停止遍历
            if (hit) *stop = YES;
        }];

        //返回当前的视图对象
        return hit?hit:self;
    }else {
        return nil;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    
    CGFloat x2 = self.frame.size.width / 2;
    CGFloat y2 = self.frame.size.height / 2;
    
    //判断是否在圆形区域内
    double dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    
    if (dis <= self.frame.size.width / 2) {
        return YES;
    }
    else{
        return NO;
    }
}

@end
