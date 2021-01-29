//
//  RNTPolyline.m
//  reading
//
//  Created by Devin on 2021/1/28.
//

#import "RNTPolyline.h"

#import "RNTCoordinate.h"
#import <BaiduMapAPI_Utils/BMKGeometry.h>
#import <BaiduMapAPI_Map/BMKPolylineView.h>

@implementation RNTPolyline {
  BMKPolyline *_polyline;
  BMKPolylineView *_polylineView;
}

- (instancetype)init {
  if (self = [super init]) {
    _polyline = [BMKPolyline new];
    _polylineView = [[BMKPolylineView alloc] initWithPolyline:_polyline];
    _polylineView.strokeColor = UIColor.redColor;
    _polylineView.lineWidth = 1;
  }
  return self;
}

- (void)setPoints:(NSArray<RNTCoordinate *> *)points {
  if (!points.count) return;
  CLLocationCoordinate2D coordinates[points.count];
  for (NSUInteger i = 0; i < points.count; i++) {
    coordinates[i] = points[i].coordinate;
  }
  [_polyline setPolylineWithCoordinates:coordinates count:points.count];
}

- (void)setWidth:(CGFloat)width {
    _polylineView.lineWidth = width;
}

- (void)setColor:(UIColor *)color {
    _polylineView.strokeColor = color;
}

- (void)setColors:(NSArray<UIColor *> *)colors {
    _polylineView.colors = colors;
}

- (id <BMKOverlay>)overlay {
    return _polyline;
}

- (BMKOverlayView *)overlayView {
    if (!_polylineView) {
        _polyline = [BMKPolyline new];
        _polylineView = [[BMKPolylineView alloc] initWithPolyline:_polyline];
        _polylineView.strokeColor = UIColor.redColor;
        _polylineView.lineWidth = 1;
    }
    return _polylineView;
}

@end
