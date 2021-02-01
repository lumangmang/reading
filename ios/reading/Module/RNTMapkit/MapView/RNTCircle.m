//
//  RNTCircle.m
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import "RNTCircle.h"

#import "RNTCoordinate.h"
#import <BaiduMapAPI_Map/BMKCircleView.h>

@implementation RNTCircle {
  BMKCircle *_circle;
  BMKCircleView *_circleView;
}

- (instancetype)init {
  if (self = [super init]) {
    _circle = [BMKCircle new];
    _circleView = [[BMKCircleView alloc] initWithCircle:_circle];
    _circleView.strokeColor = UIColor.redColor;
    _circleView.lineWidth = 1;
  }
  return self;
}

- (void)setCircleCenter:(CLLocationCoordinate2D)center {
    _circle.coordinate = center;
}

- (void)setRadius:(CLLocationDistance)radius {
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
