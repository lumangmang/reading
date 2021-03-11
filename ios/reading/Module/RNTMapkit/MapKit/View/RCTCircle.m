//
//  RCTCircle.m
//  reading
//
//  Created by Devin on 2021/3/10.
//

#import "RCTCircle.h"
#import <BaiduMapAPI_Map/BMKCircleView.h>

@implementation RCTCircle {
  BMKCircle *_circle;
  BMKCircleView *_circleView;
}

- (instancetype)init {
  if (self = [super init]) {
    _circle = [BMKCircle new];
    _circleView = [[BMKCircleView alloc] initWithCircle:_circle];
  }
  return self;
}

- (void)setCircleCenter:(CLLocationCoordinate2D)circleCenter {
  _circle.coordinate = circleCenter;
}

- (void)setRadius:(double)radius {
  _circle.radius = radius;
}

- (void)setStrokeWidth:(CGFloat)strokeWidth {
    _circleView.lineWidth = strokeWidth;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    _circleView.strokeColor = strokeColor;
}

- (void)setFillColor:(UIColor *)fillColor {
    _circleView.fillColor = fillColor;
}

- (id <BMKOverlay>)overlay {
    return _circle;
}

- (BMKOverlayView *)overlayView {
    return _circleView;
}

@end
