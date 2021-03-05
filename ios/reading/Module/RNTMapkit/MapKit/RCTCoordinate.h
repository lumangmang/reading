//
//  RCTCoordinate.h
//  reading
//
//  Created by Devin on 2021/2/6.
//

#import <React/RCTConvert+CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTCoordinate : NSObject

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end

NS_ASSUME_NONNULL_END
