//
//  RNTMarkerManager.m
//  reading
//
//  Created by Devin on 2021/1/28.
//

#import "RNTMarker.h"
#import <React/RCTUIManager.h>

@interface RNTMarkerManager : RCTViewManager
@end

@implementation RNTMarkerManager

- (UIView *)view {
  return [RNTMarker new];
}

RCT_EXPORT_MODULE(MapviewMarker)

RCT_EXPORT_VIEW_PROPERTY(coordinate, CLLocationCoordinate2D)
RCT_EXPORT_VIEW_PROPERTY(title, NSString)
RCT_EXPORT_VIEW_PROPERTY(color, UIColor)
RCT_EXPORT_VIEW_PROPERTY(image, NSString)
RCT_EXPORT_VIEW_PROPERTY(selected, BOOL)
RCT_EXPORT_VIEW_PROPERTY(draggable, BOOL)
RCT_EXPORT_VIEW_PROPERTY(centerOffset, CGPoint)
RCT_REMAP_VIEW_PROPERTY(flat, enabled3D, BOOL)

RCT_EXPORT_VIEW_PROPERTY(onBaiduMapPress, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapCalloutPress, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapDrag, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapDragStart, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBaiduMapDragEnd, RCTBubblingEventBlock)

RCT_EXPORT_METHOD(select:(nonnull NSNumber *)reactTag) {
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
      RNTMarker *marker = (RNTMarker *) viewRegistry[reactTag];
        marker.selected = YES;
    }];
}

@end
