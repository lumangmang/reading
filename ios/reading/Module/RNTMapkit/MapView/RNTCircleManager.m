//
//  RNTCircleManager.m
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import "RNTCircle.h"
#import <React/RCTUIManager.h>

@interface RNTCircleManager: RCTViewManager
@end

@implementation RNTCircleManager

- (UIView *)view {
  return [RNTCircle new];
}

RCT_EXPORT_MODULE(MapCircle)


RCT_REMAP_VIEW_PROPERTY(center, circleCenter, CLLocationCoordinate2D)
RCT_EXPORT_VIEW_PROPERTY(radius, CLLocationDistance)
RCT_EXPORT_VIEW_PROPERTY(strokeWidth, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(strokeColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(fillColor, UIColor)

@end
