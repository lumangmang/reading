//
//  RCTMapView.m
//  reading
//
//  Created by Devin on 2021/2/6.
//

#import "RCTMarker.h"
#import "UIColor+Ex.h"
#import "RCTMapView.h"
#import "RCTPolyline.h"
#import "RCTSportNode.h"
#import "RCTCoordinate.h"
#import "RCTMapView+Fit.h"
#import "RCTSportAnnotationView.h"

#import <React/RCTConvert.h>
#import <React/UIView+React.h>

@implementation RCTMapView {
  
  NSMutableDictionary *_overlays;
  NSMutableDictionary *_markers;
  
  BMKPointAnnotation *_annotation;
  RCTSportAnnotationView *_sportAnnotationView;
}

- (instancetype)init {
  if (self = [super init]) {
    _markers = [NSMutableDictionary new];
    _overlays = [NSMutableDictionary new];
    self.delegate = self;
  }
  return self;
}

// MARK: - Property Setter
/// 地图比例尺级别
/// @param zoom 4~21
- (void)setZoom:(float)zoom {
  self.zoomLevel = zoom;
}

/// 设定地图是否打开路况图层
- (void)setTrafficEnabled:(BOOL)trafficEnabled {
  self.trafficEnabled = trafficEnabled;
}

/// 设定地图View能否支持所有手势操作
- (void)setZoomGesturesEnabled:(BOOL)zoomGesturesEnabled {
  self.gesturesEnabled = zoomGesturesEnabled;
}

/// 设定地图View能否支持用户移动地图
- (void)setScrollGesturesEnabled:(BOOL)scrollGesturesEnabled {
  self.scrollEnabled = scrollGesturesEnabled;
}

- (void)setPoints:(NSArray <RCTCoordinate *> *)points {
  [self mapViewFitPoints:points animated:YES];
}
/// 设定地图轨迹
/// @param mapLine 轨迹点集合
- (void)setMapLine:(id)mapLine {
  RCTPolyline *polyine = [[RCTPolyline alloc] init];
  polyine.points = mapLine[@"coordinates"];
  polyine.textureIndex = mapLine[@"textureIndex"];
  polyine.colors = [UIColor Colors:mapLine[@"colors"]];
  polyine.width = [mapLine[@"width"] floatValue];
  [self addSubOverlay:polyine];
  
  [self mapViewFitPolyline:polyine.overlay];
}

// MARK: - BMKMapViewDelegate
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
  if ([annotation isKindOfClass:[RCTMarker class]]) {
    RCTMarker *marker = (RCTMarker *)annotation;
    return marker.annotationView;
  }
  return nil;
}

- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay {
  RCTOverlay *o = [self getOverlay:overlay];
  return o.overlayView;
}

- (void)mapView:(BMKMapView *)mapView clickAnnotationView:(BMKAnnotationView *)view {
  RCTMarker *marker = [self getMarker:view.annotation];
  if (marker.onClick) {
    marker.onClick(@{
      @"title": @"ssss"
                           });
  }
}

// MARK: - Export Method
- (void)startAnimation {
  if (!_annotation) {
    _annotation = [[BMKPointAnnotation alloc] init];
  }
  _annotation.title = @"轨迹回放";
  [self addAnnotation:_annotation];
  [_sportAnnotationView startAnimation];
}

- (void)stopAnimation {
  [_sportAnnotationView stopAnimation];
}

- (void)pauseAnimation {
  [_sportAnnotationView pauseAnimation];
}

// MARK: - Private Method
/// 获取覆盖物
- (RCTOverlay *)getOverlay:(id <BMKOverlay>)overlay {
    return _overlays[[@(overlay.hash) stringValue]];
}
- (RCTMarker *)getMarker:(id <BMKAnnotation>)annotation {
    return _markers[[@(annotation.hash) stringValue]];
}

/// 添加覆盖物
- (void)addSubOverlay:(UIView *)subview {
  if ([subview isKindOfClass:[RCTOverlay class]]) {
    RCTOverlay *overlay = (RCTOverlay *)subview;
    _overlays[[@(overlay.overlay.hash) stringValue]] = overlay;
    [self addOverlay:overlay.overlay];
  }
}

- (void)didAddSubview:(UIView *)subview {
  if ([subview isKindOfClass:[RCTMarker class]]) {
    RCTMarker *marker = (RCTMarker *)subview;
    _markers[[@(marker.hash) stringValue]] = marker;
    [self addAnnotation:marker];
  }
}

- (void)removeReactSubview:(UIView *)subview {
  [super removeReactSubview:subview];
  if ([subview isKindOfClass:[RCTMarker class]]) {
    RCTMarker *marker = (RCTMarker *) subview;
    [_markers removeObjectForKey:[@(marker.annotation.hash) stringValue]];
    [self removeAnnotation:marker];
  }
  
  if ([subview isKindOfClass:[RCTOverlay class]]) {
    RCTOverlay *overlay = (RCTOverlay *)subview;
    [_overlays removeObjectForKey:[@(overlay.hash) stringValue]];
    [self removeOverlay:overlay.overlay];
  }
}

@end

