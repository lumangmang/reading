//
//  RCTMapView+Fit.m
//  reading
//
//  Created by Devin on 2021/2/25.
//

#import "RCTCoordinate.h"
#import "RCTMapView+Fit.h"

@implementation RCTMapView (Fit)

- (void)mapViewFitPoints:(NSArray <RCTCoordinate *> *)points animated:(BOOL)animated {
  if (points.count == 1) {
    RCTCoordinate *coordinate = points.firstObject;
    [self setCenterCoordinate:coordinate.coordinate animated:animated];
    return;
  }
  double left = DBL_MAX;
  double right = DBL_MIN;
  double top = DBL_MAX;
  double bottom = DBL_MIN;
  for (RCTCoordinate *coordinate in points) {
      BMKMapPoint point = BMKMapPointForCoordinate(coordinate.coordinate);
      left = fmin(left, point.x);
      right = fmax(right, point.x);
      top = fmin(top, point.y);
      bottom = fmax(bottom, point.y);
  }
  double x = left;
  double y = top;
  double width = right - left;
  double height = bottom - top;
  if (width > 0 && height > 0) {
      BMKMapRect newRect = BMKMapRectMake(x, y, width, height);
      if (newRect.size.width == 0) {
          newRect.size.width = 1;
      }
      if (newRect.size.height == 0) {
          newRect.size.height = 1;
      }
      [self fitVisibleMapRect:newRect edgePadding:UIEdgeInsetsMake(30, 30, 30, 30) withAnimated:YES];
  }
}

/// 适配polyline在合适的视野范围内
- (void)mapViewFitPolyline:(BMKPolyline *)polyline {
  if (polyline.pointCount < 1) return;
  double ltX, ltY, rbX, rbY;
  BMKMapPoint pt = polyline.points[0];
  ltX = pt.x;
  ltY = pt.y;
  rbX = pt.x;
  rbY = pt.y;
  for (int i = 1; i < polyline.pointCount; i++) {
      BMKMapPoint point = polyline.points[i];
      if (point.x < ltX) {
          ltX = point.x;
      }
      if (point.x > rbX) {
          rbX = point.x;
      }
      if (point.y < ltY) {
          ltY = point.y;
      }
      if (point.y > rbY) {
          rbY = point.y;
      }
  }
  BMKMapRect rect;
  rect.origin = BMKMapPointMake(ltX, ltY);
  rect.size = BMKMapSizeMake(rbX - ltX, rbY - ltY);
  [self fitVisibleMapRect:rect edgePadding:UIEdgeInsetsMake(30, 30, 30, 30) withAnimated:YES];
}
@end
