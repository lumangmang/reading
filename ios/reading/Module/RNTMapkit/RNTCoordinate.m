//
//  RNTCoordinate.m
//  reading
//
//  Created by Devin on 2021/1/27.
//

#import "RNTCoordinate.h"

@implementation RNTCoordinate

+ (CLLocationCoordinate2D)coord:(NSDictionary *)json {
  double lat = [RCTConvert double:json[@"latitude"]];
  double lng = [RCTConvert double:json[@"longitude"]];
  return CLLocationCoordinate2DMake(lat, lng);
}

+ (void)updateCoords:(NSArray *)points result:(CLLocationCoordinate2D *)result {
  NSUInteger size = [points count];
  for (NSUInteger i = 0; i < size; i++) {
      CLLocationCoordinate2D coord = [self coord:points[i]];
      result[i] = coord;
  }
}

+ (UIColor *)hexColor:(NSString *)hexString {
  CGFloat alpha, red, blue, green;
  switch ([hexString length]) {
      case 6:
          alpha = 1.0f;
          red = [self colorValue:hexString start:0 length:2];
          green = [self colorValue:hexString start:2 length:2];
          blue = [self colorValue:hexString start:4 length:2];
          break;
      case 8:
          alpha = [self colorValue:hexString start:0 length:2];
          red = [self colorValue:hexString start:2 length:2];
          green = [self colorValue:hexString start:4 length:2];
          blue = [self colorValue:hexString start:6 length:2];
          break;
      default:
          return nil;
  }
  return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)colorValue: (NSString *)hexString start:(NSUInteger)start length:(NSUInteger)length {
    NSString *value = [hexString substringWithRange: NSMakeRange(start, length)];
    unsigned hexValue;
    [[NSScanner scannerWithString: value] scanHexInt: &hexValue];
    return hexValue / 255.0;
}

@end
