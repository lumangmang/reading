//
//  RCTConvert+Map.m
//  reading
//
//  Created by Devin on 2021/1/27.
//

#import "RNTUserLocation.h"

#import <React/RCTConvert.h>
#import <BaiduMapAPI_Map/BMKMapView.h>

@implementation RCTConvert (Map)

+ (RNTUserLocation *)RNTUserLocation:(id)json {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(
        [json[@"latitude"] doubleValue], [json[@"longitude"] doubleValue]);
    CLLocation *cllocation = [[CLLocation alloc] initWithCoordinate:coordinate
                                                           altitude:[json[@"altitude"] doubleValue]
                                                 horizontalAccuracy:[json[@"accuracy"] doubleValue]
                                                   verticalAccuracy:0
                                                          timestamp:[NSDate new]];
    return [[RNTUserLocation alloc] initWithCLLocation:cllocation];
}

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
