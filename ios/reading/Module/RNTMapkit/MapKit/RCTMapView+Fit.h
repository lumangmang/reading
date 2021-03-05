//
//  RCTMapView+Fit.h
//  reading
//
//  Created by Devin on 2021/2/25.
//

#import "RCTMapView.h"
#import <BaiduMapAPI_Utils/BMKGeometry.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>


@class RCTCoordinate;
NS_ASSUME_NONNULL_BEGIN

@interface RCTMapView (Fit)

/// 适配所有点在合适的视野范围内
/// @param annotations 所有点集合
- (void)mapViewFitPoints:(NSArray <RCTCoordinate *> *)points animated:(BOOL)animated;

/// 适配polyline在合适的视野范围内
/// @param polyline 适配轨迹
- (void)mapViewFitPolyline:(BMKPolyline *)polyline;

@end

NS_ASSUME_NONNULL_END
