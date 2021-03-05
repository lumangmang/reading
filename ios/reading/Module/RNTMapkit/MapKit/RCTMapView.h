//
//  RCTMapView.h
//  reading
//
//  Created by Devin on 2021/2/6.
//

#import <BaiduMapAPI_Map/BMKMapView.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTMapView : BMKMapView <BMKMapViewDelegate>

- (void)startAnimation;
- (void)stopAnimation;
- (void)pauseAnimation;

@end

NS_ASSUME_NONNULL_END
