//
//  RNTCoordinate.h
//  reading
//
//  Created by Devin on 2021/1/27.
//

#import <React/RCTConvert+CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTCoordinate : NSObject

+ (CLLocationCoordinate2D)coord:(NSDictionary *)json;
+ (void)updateCoords:(NSArray *)points result:(CLLocationCoordinate2D *)result;
+ (UIColor *)hexColor:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
