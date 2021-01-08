//
//  RNTOverlayEx.h
//  reading
//
//  Created by Devin on 2021/1/8.
//

#import <React/RCTConvert+CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTOverlayEx : NSObject

+ (CLLocationCoordinate2D)coorFromOption:(NSDictionary *)option;
+ (void)updateCoords:(NSArray *)points result:(CLLocationCoordinate2D *)result;

@end

NS_ASSUME_NONNULL_END
