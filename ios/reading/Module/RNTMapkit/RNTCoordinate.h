//
//  RNTCoordinate.h
//  reading
//
//  Created by Devin on 2021/1/26.
//

#import <React/RCTConvert+CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTCoordinate : NSObject

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end

NS_ASSUME_NONNULL_END
