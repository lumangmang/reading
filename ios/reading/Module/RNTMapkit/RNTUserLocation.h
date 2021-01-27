//
//  RNTUserLocation.h
//  reading
//
//  Created by Devin on 2021/1/26.
//

#import <BaiduMapAPI_Base/BMKBaseComponent.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTUserLocation : BMKUserLocation

- (instancetype)initWithCLLocation:(CLLocation *)cllocation;
- (void)updateWithCLLocation:(CLLocation *)cllocation;

@end

NS_ASSUME_NONNULL_END
