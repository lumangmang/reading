//
//  RNTGradientPolyline.h
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import <BaiduMapAPI_Map/BMKOverlay.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTGradientPolyline : UIView<BMKOverlay> {
  NSUInteger pointSpace;
  BMKMapRect boundingMapRect;
  pthread_rwlock_t rwLock;
}

- (id)initWithCenterCoordinate:(CLLocationCoordinate2D)coord;
- (id)initWithPoints:(CLLocationCoordinate2D *)_points velocity:(float *)_velocity count:(NSUInteger)_count;
- (BMKMapRect)addCoordinate:(CLLocationCoordinate2D)coord;

@property (assign) BMKMapPoint *points;
@property (readonly) NSUInteger pointCount;
@property (assign) float *velocity;

@end

NS_ASSUME_NONNULL_END
