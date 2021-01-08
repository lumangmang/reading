//
//  RNTUserLocation.h
//  reading
//
//  Created by Devin on 2021/1/8.
//

#import <BaiduMapAPI_Base/BMKUserLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTUserLocation : BMKUserLocation

- (instancetype)initWithLocation:(CLLocation *)location;
- (void)updateLocation:(CLLocation *)location;
- (id)json;

@end

NS_ASSUME_NONNULL_END
