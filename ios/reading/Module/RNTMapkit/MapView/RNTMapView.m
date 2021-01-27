//
//  RNTMapView.m
//  reading
//
//  Created by Devin on 2021/1/25.
//

#import "RNTMapView.h"
#import "RNTCoordinate.h"

#import <React/UIView+React.h>
#import <BMKLocationKit/BMKLocationManager.h>

@implementation RNTMapView {
  NSMutableArray *_annotations;
  NSMutableSet *_markers;
  BMKUserLocation *_userLocation;
}

- (instancetype)init {
  if (self = [super init]) {
    self.delegate = self;
  }
  return self;
}

// MARK: - Setter

/// 地图比例尺级别
/// @param zoom 4~21
- (void)setZoom:(float)zoom {
  self.zoomLevel = zoom;
}

/// 设定地图View能否支持所有手势操作
- (void)setZoomGesturesEnabled:(BOOL)zoomGesturesEnabled {
  self.gesturesEnabled = zoomGesturesEnabled;
}

/// 设定地图View能否支持用户移动地图
- (void)setScrollGesturesEnabled:(BOOL)scrollGesturesEnabled {
  self.scrollEnabled = scrollGesturesEnabled;
}

/// 当前地图的中心点，改变该值时，地图的比例尺级别不会发生变化
/// @param LatLngObj 中心点经纬度
- (void)setCenterLatLng:(NSDictionary *)LatLngObj {
  double lat = [RCTConvert double:LatLngObj[@"lat"]];
  double lng = [RCTConvert double:LatLngObj[@"lng"]];
  CLLocationCoordinate2D point = CLLocationCoordinate2DMake(lat, lng);
  self.centerCoordinate = point;
}

/// 动态更新我的位置数据
/// @param locationData 当前位置
- (void)setLocationData:(NSDictionary *)locationData {
  if (!_userLocation) {
    _userLocation = [[BMKUserLocation alloc] init];
  }
  CLLocationCoordinate2D coord = [RNTCoordinate coord:locationData];
  CLLocation *location = [[CLLocation alloc] initWithLatitude:coord.latitude longitude:coord.longitude];
  _userLocation.location = location;
  [self updateLocationData:_userLocation];
}

// MARK: - BMKMapViewDelegate
- (void)mapview:(BMKMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate {
  NSDictionary *event = @{
    @"type": @"onMapDoubleClick",
    @"params": @{
            @"latitude": @(coordinate.latitude),
            @"longitude": @(coordinate.longitude)
            }
  };
  [self sendEvent:event];
}

- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate {
  NSDictionary* event = @{
                          @"type": @"onMapClick",
                          @"params": @{
                                  @"latitude": @(coordinate.latitude),
                                  @"longitude": @(coordinate.longitude)
                                  }
                          };
  [self sendEvent:event];
}

- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
  NSDictionary* event = @{
                          @"type": @"onMapLoaded",
                          @"params": @{}
                          };
  [self sendEvent:event];
}

- (void)mapView:(BMKMapView *)mapView onClickedMapPoi:(BMKMapPoi *)mapPoi {
  NSDictionary* event = @{
                          @"type": @"onMapPoiClick",
                          @"params": @{
                                  @"name": mapPoi.text,
                                  @"uid": mapPoi.uid,
                                  @"latitude": @(mapPoi.pt.latitude),
                                  @"longitude": @(mapPoi.pt.longitude)
                                  }
                          };
  [self sendEvent:event];
}

- (void)mapStatusDidChanged:(BMKMapView *)mapView {
  CLLocationCoordinate2D targetGeoPt = [mapView getMapStatus].targetGeoPt;
  BMKCoordinateRegion region = mapView.region;
  NSDictionary* event = @{
                          @"type": @"onMapStatusChange",
                          @"params": @{
                                  @"target": @{
                                          @"latitude": @(targetGeoPt.latitude),
                                          @"longitude": @(targetGeoPt.longitude)
                                          },
                                  @"latitudeDelta": @(region.span.latitudeDelta),
                                  @"longitudeDelta": @(region.span.longitudeDelta),
                                  @"zoom": @(mapView.zoomLevel),
                                  @"overlook": @""
                                  }
                          };
  [self sendEvent:event];
}

- (void)sendEvent:(NSDictionary *)parameters {
  if (!self.onChange) return;
  self.onChange(parameters);
}

// MARK: - JavaScript Method
- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex {
  if (!_markers) {
    _markers = [[NSMutableSet alloc] init];
  }
  [super insertReactSubview:subview atIndex:atIndex];
}

- (void)removeReactSubview:(UIView *)subview {
  [super removeReactSubview:subview];
}

- (void)didUpdateReactSubviews {
  [super didUpdateReactSubviews];
}

@end
