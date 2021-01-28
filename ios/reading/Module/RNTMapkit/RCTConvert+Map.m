//
//  RCTConvert+Map.m
//  reading
//
//  Created by Devin on 2021/1/27.
//

#import <React/RCTConvert.h>
#import <BaiduMapAPI_Map/BMKMapView.h>

@implementation RCTConvert (Map)

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
