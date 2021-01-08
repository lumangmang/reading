//
//  RNTMapViewManager.m
//  reading
//
//  Created by Devin on 2021/1/8.
//

#import "RNTMapView.h"
#import <React/RCTUIManager.h>

@interface RNTMapViewManager: RCTViewManager
@end

@implementation RNTMapViewManager

- (UIView *)view {
  return [[RNTMapView alloc] init];
}

RCT_EXPORT_MODULE(BaiduMapView);

RCT_REMAP_VIEW_PROPERTY(center, centerCoordinate, CLLocationCoordinate2D)
RCT_REMAP_VIEW_PROPERTY(zoomLevel, zoom, float)
RCT_EXPORT_VIEW_PROPERTY(overlook, int)
RCT_EXPORT_VIEW_PROPERTY(rotation, int)

RCT_EXPORT_VIEW_PROPERTY(minZoomLevel, float)
RCT_EXPORT_VIEW_PROPERTY(maxZoomLevel, float)
RCT_EXPORT_VIEW_PROPERTY(location, RCTUserLocation)
RCT_REMAP_VIEW_PROPERTY(locationMode, userTrackingMode, BMKUserTrackingMode)

// layers
RCT_EXPORT_VIEW_PROPERTY(satellite, BOOL)
RCT_EXPORT_VIEW_PROPERTY(baiduHeatMapEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(trafficEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(buildingsDisabled, BOOL)
RCT_REMAP_VIEW_PROPERTY(indoorEnabled, baseIndoorMapEnabled, BOOL)
RCT_REMAP_VIEW_PROPERTY(locationEnabled, showsUserLocation, BOOL)

// gestures
RCT_EXPORT_VIEW_PROPERTY(overlookDisabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(scrollDisabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(rotateDisabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(zoomDisabled, BOOL)

// controls
RCT_EXPORT_VIEW_PROPERTY(compassDisabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(scaleBarDisabled, BOOL)
// events
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapLoad, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapClick, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapLongClick, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapDoubleClick, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapStatusChange, RCTBubblingEventBlock)

RCT_EXPORT_METHOD(setStatus:(NSNumber *)reactTag params:(NSDictionary *)params duration:(int)duration) {
  [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
    RNTMapView *mapView = (RNTMapView *)viewRegistry[reactTag];
    BMKMapStatus *mapStatus = [BMKMapStatus new];
    if (params[@"zoomLevel"]) {
      mapStatus.fLevel = [params[@"zoomLevel"] floatValue];
    }
    
    if (params[@"center"]) {
        NSDictionary *coordinate = params[@"center"];
        mapStatus.targetGeoPt = CLLocationCoordinate2DMake(
            [coordinate[@"latitude"] doubleValue], [coordinate[@"longitude"] doubleValue]);
    }
    
    if (params[@"overlook"]) {
        mapStatus.fOverlooking = [params[@"overlook"] floatValue];
    }
    
    if (params[@"rotation"]) {
        mapStatus.fRotation = [params[@"rotation"] floatValue];
    }
    [mapView setMapStatus:mapStatus withAnimation:true withAnimationTime:duration];
  }];
}

@end
