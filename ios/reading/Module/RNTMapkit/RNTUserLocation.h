//
//  RNTUserLocation.h
//  reading
//
//  Created by Devin on 2021/1/28.
//

#import <BaiduMapAPI_Base/BMKUserLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTUserLocation : BMKUserLocation

- (instancetype)initWithCLLocation:(CLLocation *)cllocation;

@end

NS_ASSUME_NONNULL_END
