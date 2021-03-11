//
//  RCTPolyline.m
//  reading
//
//  Created by Devin on 2021/3/3.
//

#import "RCTPolyline.h"
#import <React/RCTConvert+CoreLocation.h>
#import <BaiduMapAPI_Map/BMKPolylineView.h>

@implementation RCTPolyline {
  BMKPolyline *_polyline;
  BMKPolylineView *_polylineView;
}

- (instancetype)init {
  if (self = [super init]) {
    _polyline = [BMKPolyline new];
    _polylineView = [[BMKPolylineView alloc] initWithPolyline:_polyline];
  }
  return self;
}

// MARK: - Setter & Getter
- (void)setPoints:(NSArray *)points {
  CLLocationCoordinate2D coordinates[points.count];
  for (NSUInteger i = 0; i < points.count; i++) {
    CLLocationCoordinate2D coordinate = [RCTConvert CLLocationCoordinate2D:points[i]];
    coordinates[i] = coordinate;
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

- (void)setTextureIndex:(NSArray<NSNumber *> *)textureIndex {
  _polyline.textureIndex = textureIndex;
}

- (id <BMKOverlay>)overlay {
    return _polyline;
}

- (BMKOverlayView *)overlayView {
    return _polylineView;
}
@end
