//
//  RCTConvert+MapKit.m
//  reading
//
//  Created by Devin on 2021/2/6.
//

#import "RCTCoordinate.h"
#import <React/RCTConvert.h>

@implementation RCTConvert (MapKit)

+ (RCTCoordinate *)RCTCoordinate:(id)json {
    return [[RCTCoordinate alloc] initWithCoordinate:[self CLLocationCoordinate2D:json]];
}

RCT_ARRAY_CONVERTER(RCTCoordinate)

@end
