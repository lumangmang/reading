//
//  RNTUserLocation.m
//  reading
//
//  Created by Devin on 2021/1/28.
//

#import "RNTUserLocation.h"

@implementation RNTUserLocation

@synthesize location;

- (instancetype)initWithCLLocation:(CLLocation *)cllocation {
    self = [super init];
    location = cllocation;
    return self;
}

@end
