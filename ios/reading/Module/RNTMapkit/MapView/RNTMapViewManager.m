//
//  RNTMapViewManager.m
//  reading
//
//  Created by Devin on 2021/1/25.
//

#import "RNTMapView.h"
#import <React/RCTUIManager.h>
#import <React/RCTViewManager.h>
#import <React/RCTConvert+CoreLocation.h>

@interface RNTMapViewManager: RCTViewManager
@end

@implementation RNTMapViewManager

- (UIView *)view {
  return [RNTMapView new];
}

RCT_EXPORT_MODULE(BaiduMapView)

RCT_EXPORT_VIEW_PROPERTY(mapType, int)
RCT_EXPORT_VIEW_PROPERTY(zoom, float)
RCT_EXPORT_VIEW_PROPERTY(showsUserLocation, BOOL)
RCT_EXPORT_VIEW_PROPERTY(showMapPoi, BOOL)
RCT_EXPORT_VIEW_PROPERTY(scrollGesturesEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(zoomGesturesEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(trafficEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(baiduHeatMapEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(locationData, NSDictionary *)
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)

RCT_CUSTOM_VIEW_PROPERTY(center, CLLocationCoordinate2D, RNTMapView) {
    [view setCenterCoordinate:json ? [RCTConvert CLLocationCoordinate2D:json] : defaultView.centerCoordinate];
}

@end

