//
//  RNTMapView.m
//  reading
//
//  Created by Devin on 2021/1/25.
//

#import "RNTMapView.h"
#import "RNTCoordinate.h"
#import "RNTUserLocation.h"
#import <BMKLocationKit/BMKLocation.h>

@implementation RNTMapView {
  NSMutableDictionary *_markers;
  NSMutableDictionary *_overlays;
  
  BMKUserLocation *_userLocation;
}

- (instancetype)init {
  if (self = [super init]) {
    _markers = [NSMutableDictionary new];
    _overlays = [NSMutableDictionary new];
    self.delegate = self;
  }
  return self;
}

// MARK: - Setter
- (void)setSatellite:(BOOL)satellite {
  self.mapType = satellite ? BMKMapTypeSatellite : BMKMapTypeStandard;
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


// MARK: - BMKMapViewDelegate
- (void)mapViewDidFinishLoading:(RNTMapView *)mapView {
    if (self.onBaiduMapLoad) {
        self.onBaiduMapLoad(nil);
    }
}

- (void)mapView:(RNTMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate {
    if (self.onBaiduMapClick) {
        self.onBaiduMapClick(@{
            @"latitude": @(coordinate.latitude),
            @"longitude": @(coordinate.longitude),
        });
    }
}

- (void)mapView:(RNTMapView *)mapView onClickedMapPoi:(BMKMapPoi *)mapPoi {
    if (self.onBaiduMapClick) {
        self.onBaiduMapClick(@{
            @"latitude": @(mapPoi.pt.latitude),
            @"longitude": @(mapPoi.pt.longitude),
            @"uid": mapPoi.uid,
            @"name": mapPoi.text,
        });
    }
}

- (void)mapview:(RNTMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate {
    if (self.onBaiduMapLongClick) {
        self.onBaiduMapLongClick(@{
           @"latitude": @(coordinate.latitude),
           @"longitude": @(coordinate.longitude),
        });
    }
}

- (void)mapview:(RNTMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate {
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
@end
