//
//  RCTMarkerManager.m
//  reading
//
//  Created by Devin on 2021/3/5.
//

#import "RCTMarker.h"

@interface RCTMarkerManager : RCTViewManager
@end

@implementation RCTMarkerManager

- (UIView *)view {
  return [RCTMarker new];
}

RCT_EXPORT_MODULE(Marker)

RCT_EXPORT_VIEW_PROPERTY(coordinate, CLLocationCoordinate2D)

@end
