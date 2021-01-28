//
//  RNTPolylineManager.m
//  reading
//
//  Created by Devin on 2021/1/28.
//

#import "RNTPolyline.h"
#import <React/RCTUIManager.h>

@interface RNTPolylineManager : RCTViewManager

@end

@implementation RNTPolylineManager

RCT_EXPORT_MODULE(MapPolyline)

- (UIView *)view {
    return [RNTPolyline new];
}

RCT_EXPORT_VIEW_PROPERTY(points, RNTCoordinateArray)
RCT_EXPORT_VIEW_PROPERTY(width, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(color, UIColor)
RCT_EXPORT_VIEW_PROPERTY(colors, UIColorArray)

@end
