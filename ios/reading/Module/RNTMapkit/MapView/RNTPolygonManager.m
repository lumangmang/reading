//
//  RNTPolygonManager.m
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import "RNTPolygon.h"
#import <React/RCTUIManager.h>

@interface RNTPolygonManager : RCTViewManager

@end

@implementation RNTPolygonManager

RCT_EXPORT_MODULE(MapPolygon)

- (UIView *)view {
  return [RNTPolygon new];
}

RCT_EXPORT_VIEW_PROPERTY(points, RNTCoordinateArray)
RCT_EXPORT_VIEW_PROPERTY(strokeWidth, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(strokeColor, UIColor)
RCT_EXPORT_VIEW_PROPERTY(fillColor, UIColor)

@end
