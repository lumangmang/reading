//
//  RNTMapView.m
//  reading
//
//  Created by Devin on 2021/1/25.
//

#import "RNTMapView.h"

#import "RNTMarker.h"
#import "RNTOverlay.h"
#import "RNTHeatMap.h"
#import "RNTUserLocation.h"

#import <React/UIView+React.h>

@implementation RNTMapView {
  NSMutableDictionary *_markers;
  NSMutableDictionary *_overlays;
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

/// 设定地图View能否支持所有手势操作
- (void)setZoomGesturesEnabled:(BOOL)zoomGesturesEnabled {
  self.gesturesEnabled = zoomGesturesEnabled;
}

/// 设定地图View能否支持用户移动地图
- (void)setScrollGesturesEnabled:(BOOL)scrollGesturesEnabled {
  self.scrollEnabled = scrollGesturesEnabled;
}

/// 动态更新我的位置数据
/// @param locationData 当前位置
- (void)setLocationData:(RNTUserLocation *)locationData {
  [self updateLocationData:locationData];
}

// MARK: - BMKMapViewDelegate
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
  if (self.onBaiduMapLoad) {
    self.onBaiduMapLoad(nil);
  }
}

- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate {
  if (self.onBaiduMapClick) {
    self.onBaiduMapClick(@{
      @"latitude": @(coordinate.latitude),
      @"longitude": @(coordinate.longitude),
                         });
  }
}

- (void)mapView:(BMKMapView *)mapView onClickedMapPoi:(BMKMapPoi *)mapPoi {
  if (self.onBaiduMapClick) {
    self.onBaiduMapClick(@{
        @"latitude": @(mapPoi.pt.latitude),
        @"longitude": @(mapPoi.pt.longitude),
        @"uid": mapPoi.uid,
        @"name": mapPoi.text,
    });
  }
}

- (void)mapview:(BMKMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate {
  if (self.onBaiduMapLongClick) {
      self.onBaiduMapLongClick(@{
         @"latitude": @(coordinate.latitude),
         @"longitude": @(coordinate.longitude),
      });
  }
}

- (void)mapview:(BMKMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate {
  if (self.onBaiduMapDoubleClick) {
      self.onBaiduMapDoubleClick(@{
         @"latitude": @(coordinate.latitude),
         @"longitude": @(coordinate.longitude),
      });
  }
}

- (void)mapView:(RNTMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    if (self.onBaiduMapStatusChange) {
        self.onBaiduMapStatusChange(@{
            @"center": @{
                @"latitude": @(self.centerCoordinate.latitude),
                @"longitude": @(self.centerCoordinate.longitude),
            },
            @"region": @{
                @"latitude": @(self.region.center.latitude),
                @"longitude": @(self.region.center.longitude),
                @"latitudeDelta": @(self.region.span.latitudeDelta),
                @"longitudeDelta": @(self.region.span.longitudeDelta),
            },
            @"zoomLevel": @(self.zoomLevel),
            @"rotation": @(self.rotation),
            @"overlook": @(self.overlooking),
        });
    }
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
  if ([annotation isKindOfClass:[RNTMarker class]]) {
    RNTMarker *marker = (RNTMarker *)annotation;
    return marker.annotationView;
  }
  return nil;
}

- (BMKOverlayView *)mapView:(RNTMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay {
    RNTOverlay *o = [self getOverlay:overlay];
    return o.overlayView;
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
  RNTMarker *marker = [self getMarker:view.annotation];
  [marker bindCalloutPressHandler];
}

- (void)mapView:(BMKMapView *)mapView
 annotationView:(BMKAnnotationView *)view
didChangeDragState:(BMKAnnotationViewDragState)newState
   fromOldState:(BMKAnnotationViewDragState)oldState {
    RNTMarker *marker = [self getMarker:view.annotation];
    id coordinate = @{
        @"latitude": @(view.annotation.coordinate.latitude),
        @"longitude": @(view.annotation.coordinate.longitude),
    };

    if (newState == BMKAnnotationViewDragStateStarting && marker.onBaiduMapDragStart) {
        marker.onBaiduMapDragStart(coordinate);
    }

    if (newState == BMKAnnotationViewDragStateDragging && marker.onBaiduMapDrag) {
        marker.onBaiduMapDrag(coordinate);
    }

    if (newState == BMKAnnotationViewDragStateEnding && marker.onBaiduMapDragEnd) {
        marker.onBaiduMapDragEnd(coordinate);
    }
}

// MARK: - Event
- (RNTMarker *)getMarker:(id <BMKAnnotation>)annotation {
    return _markers[[@(annotation.hash) stringValue]];
}
- (RNTOverlay *)getOverlay:(id <BMKOverlay>)overlay {
    return _overlays[[@(overlay.hash) stringValue]];
}

// MARK: - JavaScript Method
- (void)didAddSubview:(UIView *)subview {
  if ([subview isKindOfClass:[RNTMarker class]]) {
    RNTMarker *marker = (RNTMarker *)subview;
    marker.mapView = self;
    _markers[[@(marker.hash) stringValue]] = marker;
    [self addAnnotation:marker];
  }
  if ([subview isKindOfClass:[RNTOverlay class]]) {
    RNTOverlay *overlay = (RNTOverlay *)subview;
      overlay.mapView = self;
      _overlays[[@(overlay.overlay.hash) stringValue]] = overlay;
      [self addOverlay:overlay.overlay];
  }
  if ([subview isKindOfClass:[RNTHeatMap class]]) {
    [self addHeatMap:((RNTHeatMap *)subview).heatMap];
  }
}

- (void)removeReactSubview:(UIView *)subview {
  [super removeReactSubview:(UIView *) subview];
  if ([subview isKindOfClass:[RNTMarker class]]) {
    RNTMarker *marker = (RNTMarker *) subview;
    [_markers removeObjectForKey:[@(marker.annotation.hash) stringValue]];
    [self removeAnnotation:marker];
  }
  if ([subview isKindOfClass:[RNTOverlay class]]) {
    RNTOverlay *overlay = (RNTOverlay *)subview;
    _overlays[[@(overlay.hash) stringValue]] = overlay;
    [self removeOverlay:overlay.overlay];
  }
  if ([subview isKindOfClass:[RNTHeatMap class]]) {
      [self removeHeatMap];
  }
}
@end
