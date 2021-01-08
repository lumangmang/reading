//
//  RNTOverlayEx.m
//  reading
//
//  Created by Devin on 2021/1/8.
//

#import "RNTOverlayEx.h"

@implementation RNTOverlayEx

+ (CLLocationCoordinate2D)coorFromOption:(NSDictionary *)option {
  double latitude = [RCTConvert double:option[@"latitude"]];
  double longitude = [RCTConvert double:option[@"longitude"]];
  return CLLocationCoordinate2DMake(latitude, longitude);
}

+ (void)updateCoords:(NSArray *)points result:(CLLocationCoordinate2D *)result {
  NSUInteger size = [points count];
  for (NSUInteger i = 0; i < size; i++) {
    CLLocationCoordinate2D coord = [self coorFromOption:points[i]];
    result[i] = coord;
  }
}

@end
