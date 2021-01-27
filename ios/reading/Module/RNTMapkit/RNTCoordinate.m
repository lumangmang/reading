//
//  RNTCoordinate.m
//  reading
//
//  Created by Devin on 2021/1/26.
//

#import "RNTCoordinate.h"

@implementation RNTCoordinate

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    self = [super init];
    self.coordinate = coordinate;
    return self;
}

@end
