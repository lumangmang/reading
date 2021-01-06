//
//  NativeViewManager.m
//  reading
//
//  Created by Devin on 2021/1/6.
//


#import "NativeView.h"
#import "NativeViewManager.h"
#import <React/RCTUIManager.h>

@implementation NativeViewManager

RCT_EXPORT_MODULE(NativeView)
RCT_EXPORT_VIEW_PROPERTY(title,NSString)
RCT_EXPORT_VIEW_PROPERTY(onClick, RCTBubblingEventBlock)

- (UIView *)view {
  NativeView *nativeView = [[NativeView alloc] init];
  return nativeView;
}

RCT_EXPORT_METHOD(nativeFunc:(nonnull NSNumber *)reactTag obj:(NSDictionary *)obj) {
  [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,NativeView *> *viewRegistry) {
    NativeView *view = viewRegistry[reactTag];
    if (![view isKindOfClass:[NativeView class]]) {
      RCTLogError(@"Invalid view returned from registry, expecting TestNativeView, got: %@", view);
    } else {
      dispatch_async(dispatch_get_main_queue(), ^{
              NativeView *bannerView = (NativeView *)viewRegistry[reactTag];
              [bannerView nativeMethod:obj];
      });
    }
  }];
}

@end
