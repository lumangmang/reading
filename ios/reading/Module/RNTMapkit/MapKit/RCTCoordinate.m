//
//  RCTCoordinate.m
//  reading
//
//  Created by Devin on 2021/2/6.
//

#import "RCTCoordinate.h"

@implementation RCTCoordinate

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
  self = [super init];
  self.coordinate = coordinate;
  return self;
}
@end
