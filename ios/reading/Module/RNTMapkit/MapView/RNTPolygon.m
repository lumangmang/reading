//
//  RNTPolygon.m
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import "RNTPolygon.h"
#import "RNTCoordinate.h"
#import <BaiduMapAPI_Map/BMKPolygonView.h>

@implementation RNTPolygon {
  BMKPolygon *_polygon;
  BMKPolygonView *_polygonView;
}

- (instancetype)init {
  if (self = [super init]) {
    _polygon = [[BMKPolygon alloc] init];
    _polygonView = [[BMKPolygonView alloc] initWithPolygon:_polygon];
    _polygonView.strokeColor = UIColor.redColor;
    _polygonView.lineWidth = 1;
  }
  return self;
}

- (void)setPoints:(NSArray<RNTCoordinate *> *)points {
  CLLocationCoordinate2D coordinates[points.count];
  for (NSUInteger i = 0; i < points.count; i++) {
    coordinates[i] = points[i].coordinate;
  }
  [_polygon setPolygonWithCoordinates:coordinates count:points.count];
}

- (void)setStrokeWidth:(CGFloat)strokeWidth {
  _polygonView.lineWidth = strokeWidth;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
  _polygonView.strokeColor = strokeColor;
}

- (void)setFillColor:(UIColor *)fillColor {
    _polygonView.fillColor = fillColor;
}

- (id <BMKOverlay>)overlay {
    return _polygon;
}

- (BMKOverlayView *)overlayView {
    return _polygonView;
}

@end
