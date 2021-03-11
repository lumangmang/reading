//
//  RCTMapView.m
//  reading
//
//  Created by Devin on 2021/2/6.
//

#import "RCTCircle.h"
#import "RCTMarker.h"
#import "UIColor+Ex.h"
#import "RCTMapView.h"
#import "RCTPolyline.h"
#import "RCTCoordinate.h"
#import "RCTMapView+Fit.h"

#import <React/RCTConvert.h>
#import <React/UIView+React.h>

@implementation RCTMapView {
  
  NSMutableDictionary *_overlays;
  NSMutableDictionary *_markers;
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

/// 所有点适配在合适
/// @param points 点集合
- (void)setPoints:(NSArray <RCTCoordinate *> *)points {
  [self mapViewFitPoints:points animated:YES];
}

/// 原生点标记
/// @param markers 标记点集合
- (void)setMarkers:(NSArray <NSDictionary *> *)markers {
  NSMutableArray<RCTMarker *> *annotations = [NSMutableArray array];
  [markers enumerateObjectsUsingBlock:^(NSDictionary *object, NSUInteger idx, BOOL *stop) {
    RCTMarker *marker = [[RCTMarker alloc] init];
    marker.coordinate = [RCTConvert CLLocationCoordinate2D:object];
    marker.imageURLString = object[@"image"];
    marker.markerId = [object[@"id"] intValue];
    _markers[[@(marker.hash) stringValue]] = marker;
    [annotations addObject:marker];
  }];
  [self addAnnotations:annotations];
}

/// 设定地图轨迹
/// @param mapLine 轨迹点集合
- (void)setMapLine:(NSDictionary *)mapLine {
  RCTPolyline *polyine = [[RCTPolyline alloc] init];
  polyine.points = mapLine[@"coordinates"];
  polyine.textureIndex = mapLine[@"textureIndex"];
  polyine.colors = [UIColor Colors:mapLine[@"colors"]];
  polyine.width = [mapLine[@"width"] floatValue];
  [self addSubOverlay:polyine];
  
  [self mapViewFitPolyline:polyine.overlay];
}

/// 根据中心点和半径生成圆
- (void)setDrawCircle:(NSDictionary *)circle {
  RCTCircle *_circle = [[RCTCircle alloc] init];
  _circle.circleCenter = [RCTConvert CLLocationCoordinate2D:circle];
  _circle.radius = [circle[@"radius"] doubleValue];
  _circle.strokeWidth = [circle[@"strokeWidth"] floatValue];
  _circle.strokeColor = [UIColor HexColor:circle[@"strokeColor"]];
  _circle.fillColor = [UIColor HexColor:circle[@"color"]];
  [self addSubOverlay:_circle];
}

// MARK: - BMKMapViewDelegate
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
  RCTMarker *marker = [self getMarker:annotation];
  return marker.annotationView;
}

- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay {
  RCTOverlay *o = [self getOverlay:overlay];
  return o.overlayView;
}

- (void)mapView:(BMKMapView *)mapView clickAnnotationView:(BMKAnnotationView *)view {
  RCTMarker *marker = [self getMarker:view.annotation];
  if (self.onClick) { self.onClick(@{@"id": @(marker.markerId)}); }
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

@end

