//
//  RNTMapView.m
//  reading
//
//  Created by Devin on 2021/1/8.
//

#import "RNTMapView.h"

#import "RNTMarkerView.h"
#import "RNTUserLocation.h"


@implementation RNTMapView {
  NSMutableDictionary *_markers;
  NSMutableDictionary *_overlays;
}

- (instancetype)init {
  _markers = [NSMutableDictionary new];
  _overlays = [NSMutableDictionary new];
  self = [super init];
  if (self) {
    self.delegate = self;
    self.showMapScaleBar = YES;
  }
  return self;
}

- (void)setSatellite:(BOOL)satellite {
  self.mapType = satellite ? BMKMapTypeSatellite: BMKMapTypeStandard;
}
- (void)setBuildingsDisabled:(BOOL)disabled {
  self.buildingsEnabled = !disabled;
}
- (void)setRotateDisabled:(BOOL)disabled {
  self.rotateEnabled = !disabled;
}
- (void)setOverlookDisabled:(BOOL)disabled {
  self.overlookEnabled = !disabled;
}
- (void)setScrollDisabled:(BOOL)disabled {
  self.scrollEnabled = !disabled;
}
- (void)setZoomDisabled:(BOOL)disabled {
    self.zoomEnabled = !disabled;
}
- (void)setCompassDisabled:(BOOL)disabled {
    if (disabled) {
        self.compassPosition = CGPointMake(999, 0);
    } else {
        self.compassPosition = CGPointMake(5, 5);
    }
}
- (void)setScaleBarDisabled:(BOOL)disabled {
    self.showMapScaleBar = !disabled;
}
- (void)setZoom:(float)zoomLevel {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.zoomLevel = zoomLevel;
    });
}
- (void)setOverlook:(int)overlook {
    BMKMapStatus *status = [BMKMapStatus new];
    status.fOverlooking = overlook;
    [self setMapStatus:status];
}

- (void)setLocation:(RNTUserLocation *)userLocation {
  [self updateLocationData:userLocation];
}
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
  self.compassPosition = CGPointMake(5, 5);
  self.mapScaleBarPosition = CGPointMake(2, self.frame.size.height - 43);
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

- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
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
  if ([annotation isKindOfClass:[RNTMarkerView class]]) {
    RNTMarkerView *marker = (RNTMarkerView *)annotation;
    return marker.annotationView;
  }
  return nil;
}

- (void)removeReactSubview:(UIView *)subview {
  [super removeReactSubview:(UIView *) subview];
}

- (void)didAddSubview:(UIView *)subview {
  
}
@end
