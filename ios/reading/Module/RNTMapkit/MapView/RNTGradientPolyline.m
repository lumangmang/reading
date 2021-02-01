//
//  RNTGradientPolyline.m
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import <pthread.h>

#import "RNTGradientPolyline.h"
#import <BaiduMapAPI_Utils/BMKGeometry.h>

#define INITIAL_POINT_SPACE 1000
#define MINIMUM_DELTA_METERS 10.0

@implementation RNTGradientPolyline

@synthesize points, pointCount, velocity;

- (id)initWithCenterCoordinate:(CLLocationCoordinate2D)coord {
  if (self = [super init]) {
    pointSpace = INITIAL_POINT_SPACE;
    points = malloc(sizeof(BMKMapPoint)*pointSpace);
    points[0] = BMKMapPointForCoordinate(coord);
    pointCount = 1;
    BMKMapPoint origin = points[0];
    origin.x -= BMKMapSizeWorld.width / 8.0;
    origin.y -= BMKMapSizeWorld.height / 8.0;
    BMKMapSize size = BMKMapSizeWorld;
    size.width /= 4.0;
    size.height /= 4.0;
    boundingMapRect = (BMKMapRect) {origin, size};
    BMKMapRect worldRect = BMKMapRectMake(0, 0, BMKMapSizeWorld.width, BMKMapSizeWorld.height);
    boundingMapRect = BMKMapRectIntersection(boundingMapRect, worldRect);
    // 用于绘图和更新的读写锁
    pthread_rwlock_init(&rwLock,NULL);
  }
  return self;
}

- (id)initWithPoints:(CLLocationCoordinate2D *)_points velocity:(float *)_velocity count:(NSUInteger)_count {
  if (self = [super init]) {
    pointCount = _count;
    self.points = malloc(sizeof(BMKMapPoint) * pointCount);
    for (int i = 0; i < _count; i++){
      self.points[i] = BMKMapPointForCoordinate(_points[i]);
    }
    self.velocity = malloc(sizeof(float) * pointCount);
    for (int i = 0; i < _count; i++){
      self.velocity[i] = _velocity[i];
    }
    BMKMapPoint origin = points[0];
    origin.x -= BMKMapSizeWorld.width / 8.0;
    origin.y -= BMKMapSizeWorld.height / 8.0;
    BMKMapSize size = BMKMapSizeWorld;
    size.width /= 4.0;
    size.height /= 4.0;
    boundingMapRect = (BMKMapRect) {origin, size};
    BMKMapRect worldRect = BMKMapRectMake(0, 0, BMKMapSizeWorld.width, BMKMapSizeWorld.height);
    boundingMapRect = BMKMapRectIntersection(boundingMapRect, worldRect);
    pthread_rwlock_init(&rwLock,NULL);
  }
  return self;
}

- (BMKMapRect)addCoordinate:(CLLocationCoordinate2D)coord {
  pthread_rwlock_wrlock(&rwLock);
  BMKMapPoint newPoint = BMKMapPointForCoordinate(coord);
  BMKMapPoint prevPoint = points[pointCount - 1];
  CLLocationDistance metersApart = BMKMetersBetweenMapPoints(newPoint, prevPoint);
  BMKMapRect updateRect = BMKMapRectNull;
  if (metersApart > MINIMUM_DELTA_METERS) {
    if (pointSpace == pointCount) {
      pointSpace *= 2;
      points = realloc(points, sizeof(BMKMapPoint) * pointSpace);
    }
    points[pointCount] = newPoint;
    pointCount++;
    double minX = MIN(newPoint.x,prevPoint.x);
    double minY = MIN(newPoint.y,prevPoint.y);
    double maxX = MAX(newPoint.x, prevPoint.x);
    double maxY = MAX(newPoint.y, prevPoint.y);
    updateRect = BMKMapRectMake(minX, minY, maxX - minX, maxY - minY);
  }
  pthread_rwlock_unlock(&rwLock);
  return updateRect;
}

- (CLLocationCoordinate2D)coordinate {
    return BMKCoordinateForMapPoint(points[0]);
}

- (BMKMapRect)boundingMapRect {
  return boundingMapRect;
}

- (void)dealloc {
    free(points);
    free(velocity);
    pthread_rwlock_destroy(&rwLock);
}

@end
