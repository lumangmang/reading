//
//  RCTMapViewManager.m
//  reading
//
//  Created by Devin on 2021/2/6.
//

#import "RCTMapView.h"
#import <React/RCTUIManager.h>
#import <React/RCTViewManager.h>
#import <React/RCTConvert+CoreLocation.h>

@interface RCTMapViewManager: RCTViewManager

@end

@implementation RCTMapViewManager

RCT_EXPORT_MODULE(RCTMapView)

- (UIView *)view {
  return [RCTMapView new];
}

// property
RCT_EXPORT_VIEW_PROPERTY(mapType, int)
RCT_EXPORT_VIEW_PROPERTY(zoom, float)
RCT_EXPORT_VIEW_PROPERTY(trafficEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(scrollGesturesEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(zoomGesturesEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(points, RCTCoordinateArray)
RCT_EXPORT_VIEW_PROPERTY(mapLine, id)


RCT_CUSTOM_VIEW_PROPERTY(center, CLLocationCoordinate2D, RCTMapView) {
    [view setCenterCoordinate:json ? [RCTConvert CLLocationCoordinate2D:json] : defaultView.centerCoordinate];
}

RCT_EXPORT_METHOD(startAnimation:(nonnull NSNumber *)reactTag) {
  [self execute:reactTag action:^(RCTMapView *mapView) {
    [mapView startAnimation];
  }];
}

RCT_EXPORT_METHOD(stopAnimation:(nonnull NSNumber *)reactTag) {
  [self execute:reactTag action:^(RCTMapView *mapView) {
    [mapView stopAnimation];
  }];
}

RCT_EXPORT_METHOD(pauseAnimation:(nonnull NSNumber *)reactTag) {
  [self execute:reactTag action:^(RCTMapView *mapView) {
    [mapView pauseAnimation];
  }];
}

RCT_EXPORT_METHOD(zoomOut:(nonnull NSNumber *)reactTag) {
  [self execute:reactTag action:^(RCTMapView *mapView) {
    [mapView zoomOut];
  }];
}

RCT_EXPORT_METHOD(zoomIn:(nonnull NSNumber *)reactTag) {
  [self execute:reactTag action:^(RCTMapView *mapView) {
    [mapView zoomIn];
  }];
}

- (void)execute:(nonnull NSNumber *)reactTag action:(void(^)(RCTMapView *))action {
  [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
    RCTMapView *mapView = (RCTMapView *)viewRegistry[reactTag];
    action(mapView);
  }];
}

@end
