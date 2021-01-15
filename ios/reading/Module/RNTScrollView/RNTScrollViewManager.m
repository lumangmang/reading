//
//  RNTScrollViewManager.m
//  reading
//
//  Created by Devin on 2021/1/11.
//

#import "RNTScrollView.h"
#import <React/RCTUIManager.h>

@interface RNTScrollViewManager: RCTViewManager

@end

@implementation RNTScrollViewManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(onClick, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(autoScrollTimeInterval, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(imageURLStringsGroup, NSArray);
RCT_EXPORT_VIEW_PROPERTY(autoScroll, BOOL);

- (UIView *)view {
  return [RNTScrollView new];
}

RCT_EXPORT_METHOD(setStatus:(nonnull NSNumber *)reactTag params:(NSDictionary *)params duration:(int)duration) {
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
    NSLog(@"%@", params);
  }];
}
@end
