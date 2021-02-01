//
//  RNTGradientPolylineRenderer.m
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import <pthread.h>

#import "RNTGradientPolyline.h"
#import "RNTGradientPolylineRenderer.h"

#define V_MAX 40
#define V_MIN 5.0
#define H_MAX 0.33
#define H_MIN 0.13

@implementation RNTGradientPolylineRenderer {
  float *_hues;
  pthread_rwlock_t _rwLock;
  RNTGradientPolyline *_polyline;
}

- (instancetype)initWithOverlay:(id<BMKOverlay>)overlay {
  if (self = [super initWithOverlay:overlay]) {
    pthread_rwlock_init(&_rwLock, NULL);
    _polyline = ((RNTGradientPolyline *)self.overlay);
    float *velocity = _polyline.velocity;
    int count = (int)_polyline.pointCount;
    [self velocity:velocity ToHue:&_hues count:count];
    [self createPath];
  }
  return self;
}

/// 转换颜色
///  H(v) = Hmax, (v > Vmax)
///     = Hmin + ((v-Vmin)*(Hmax-Hmin))/(Vmax-Vmin), (Vmin <= v <= Vmax)
///     = Hmin, (v < Vmin)
/// @param velocity Velocity list.
/// @param count count of velocity list.
- (void)velocity:(float*)velocity ToHue:(float**)_hue count:(int)count {
  *_hue = malloc(sizeof(float) * count);
  for (int i = 0; i < count; i++) {
    float curVelo = velocity[i];
    if (curVelo > 0.) {
      curVelo = ((curVelo < V_MIN) ? V_MIN : (curVelo  > V_MAX) ? V_MAX : curVelo);
      (*_hue)[i] = H_MIN + ((curVelo-V_MIN)*(H_MAX-H_MIN))/(V_MAX-V_MIN);
    } else {
      // 暂停颜色
      (*_hue)[i] = 0.;
    }
  }
}

- (void)createPath {
  CGMutablePathRef path = CGPathCreateMutable();
  BOOL pathIsEmpty = YES;
  for (int i = 0; i < _polyline.pointCount; i++) {
    CGPoint point = [self pointForMapPoint:_polyline.points[i]];
    if (pathIsEmpty) {
      CGPathMoveToPoint(path, nil, point.x, point.y);
      pathIsEmpty = NO;
    } else {
      CGPathAddLineToPoint(path, nil, point.x, point.y);
    }
  }
  pthread_rwlock_wrlock(&_rwLock);
  self.path = path;
  pthread_rwlock_unlock(&_rwLock);
}

- (void)drawMapRect:(BMKMapRect)mapRect zoomScale:(BMKZoomScale)zoomScale inContext:(CGContextRef)context {
  CGContextSetLineCap(context, kCGLineCapRound);
  CGContextSetLineJoin(context, kCGLineJoinRound);
  UIColor *pcolor, *ccolor;
  for (int i = 0; i < _polyline.pointCount; i++) {
    CGPoint point = [self pointForMapPoint:_polyline.points[i]];
    CGMutablePathRef path = CGPathCreateMutable();
    if (_hues[i] == 0.) {
      if (i == 0) {
        CGPathMoveToPoint(path, nil, point.x, point.y);
      } else {
        CGContextSetRGBStrokeColor(context, 153.0 / 255.0, 153.0 / 255.0, 153.0 / 255.0, 1.0);
        CGFloat lineWidth = CGContextConvertSizeToUserSpace(context, (CGSize){self.lineWidth,self.lineWidth}).width;
        CGContextSetLineWidth(context, lineWidth);
        CGFloat lengths[] = {lineWidth * 2, lineWidth * 2};
        CGContextSetLineDash(context, lineWidth, lengths, 2);
        CGPoint prevPoint = [self pointForMapPoint:_polyline.points[i - 1]];
        CGPathMoveToPoint(path, nil, prevPoint.x, prevPoint.y);
        CGPathAddLineToPoint(path, nil, point.x, point.y);
        CGContextAddPath(context, path);
        CGContextStrokePath(context);
      }
    } else {
      ccolor = [UIColor colorWithHue:_hues[i] saturation:1.0f brightness:1.0f alpha:1.0f];
      if (i == 0) {
        CGPathMoveToPoint(path, nil, point.x, point.y);
      } else {
        CGPoint prevPoint = [self pointForMapPoint:_polyline.points[i - 1]];
        CGPathMoveToPoint(path, nil, prevPoint.x, prevPoint.y);
        CGPathAddLineToPoint(path, nil, point.x, point.y);
        CGFloat pc_r,pc_g,pc_b,pc_a,
        cc_r,cc_g,cc_b,cc_a;
        [pcolor getRed:&pc_r green:&pc_g blue:&pc_b alpha:&pc_a];
        [ccolor getRed:&cc_r green:&cc_g blue:&cc_b alpha:&cc_a];
        CGFloat gradientColors[8] = {pc_r,pc_g,pc_b,pc_a,
            cc_r,cc_g,cc_b,cc_a};
        CGFloat gradientLocation[2] = {0,1};
        CGContextSaveGState(context);
        CGFloat lineWidth = CGContextConvertSizeToUserSpace(context, (CGSize){self.lineWidth,self.lineWidth}).width;
        CGPathRef pathToFill = CGPathCreateCopyByStrokingPath(path, NULL, lineWidth, self.lineCap, self.lineJoin, self.miterLimit);
        CGContextAddPath(context, pathToFill);
        CGContextClip(context);
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, gradientColors, gradientLocation, 2);
        CGColorSpaceRelease(colorSpace);
        CGPoint gradientStart = prevPoint;
        CGPoint gradientEnd = point;
        CGContextDrawLinearGradient(context, gradient, gradientStart, gradientEnd, kCGGradientDrawsAfterEndLocation);
        CGGradientRelease(gradient);
        CGContextRestoreGState(context);
        pcolor = [UIColor colorWithCGColor:ccolor.CGColor];
      }
    }
  }
}

@end
