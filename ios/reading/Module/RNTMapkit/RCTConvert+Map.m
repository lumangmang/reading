//
//  RCTConvert+Map.m
//  reading
//
//  Created by Devin on 2021/1/27.
//

#import "RNTCoordinate.h"
#import "RNTUserLocation.h"

#import <React/RCTConvert.h>
#import <BaiduMapAPI_Map/BMKMapView.h>

@implementation RCTConvert (Map)

+ (RNTCoordinate *)RNTCoordinate:(id)json {
    return [[RNTCoordinate alloc] initWithCoordinate:[self CLLocationCoordinate2D:json]];
}

+ (RNTUserLocation *)RNTUserLocation:(id)json {
    CLLocation *cllocation = [[CLLocation alloc] initWithLatitude:[json[@"latitude"] doubleValue] longitude:[json[@"longitude"] doubleValue]];
    return [[RNTUserLocation alloc] initWithCLLocation:cllocation];
}

+ (BMKHeatMapNode *)BMKHeatMapNode:(id)json {
    BMKHeatMapNode *node = [BMKHeatMapNode new];
    node.intensity = [json[@"intensity"] doubleValue];
    node.pt = [self CLLocationCoordinate2D:json];
    return node;
}

RCT_ARRAY_CONVERTER(RNTCoordinate)
RCT_ARRAY_CONVERTER(BMKHeatMapNode)

RCT_ENUM_CONVERTER(BMKUserTrackingMode, (@{
     @"normal": @(BMKUserTrackingModeHeading),
     @"compass": @(BMKUserTrackingModeFollowWithHeading),
     @"follow": @(BMKUserTrackingModeFollow),
}), BMKUserTrackingModeHeading, intValue)

RCT_ENUM_CONVERTER(BMKMapType, (@{
  @"none": @(BMKMapTypeNone),
  @"standard": @(BMKMapTypeStandard),
  @"satellite": @(BMKMapTypeSatellite)
}), BMKMapTypeStandard, intValue)

@end
