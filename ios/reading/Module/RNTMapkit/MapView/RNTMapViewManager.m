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

// property
RCT_EXPORT_VIEW_PROPERTY(mapType, BMKMapType)
RCT_EXPORT_VIEW_PROPERTY(zoom, float)
RCT_EXPORT_VIEW_PROPERTY(showsUserLocation, BOOL)
RCT_EXPORT_VIEW_PROPERTY(showMapPoi, BOOL)
RCT_EXPORT_VIEW_PROPERTY(scrollGesturesEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(zoomGesturesEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(trafficEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(baiduHeatMapEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(locationData, NSDictionary *)
RCT_EXPORT_VIEW_PROPERTY(userTrackingMode, BMKUserTrackingMode)

// events
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapLoad, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapClick, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapLongClick, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapDoubleClick, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapStatusChange, RCTBubblingEventBlock)

RCT_CUSTOM_VIEW_PROPERTY(center, CLLocationCoordinate2D, RNTMapView) {
    [view setCenterCoordinate:json ? [RCTConvert CLLocationCoordinate2D:json] : defaultView.centerCoordinate];
}

RCT_EXPORT_METHOD(setStatus:(nonnull NSNumber *)reactTag params:(NSDictionary *)params duration:(int)duration) {
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        RNTMapView *mapView = (RNTMapView *) viewRegistry[reactTag];
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

