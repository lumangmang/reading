//
//  RNTHeatMapManager.m
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import "RNTHeatMap.h"
#import <React/RCTUIManager.h>

@interface RNTHeatMapManager: RCTViewManager
@end

@implementation RNTHeatMapManager

RCT_EXPORT_MODULE(MapHeatMap)

- (UIView *)view {
    return [RNTHeatMap new];
}

RCT_EXPORT_VIEW_PROPERTY(points, BMKHeatMapNodeArray)
RCT_EXPORT_VIEW_PROPERTY(radius, int)
RCT_EXPORT_VIEW_PROPERTY(opacity, double)

@end
