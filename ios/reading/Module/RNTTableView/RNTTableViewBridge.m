//
//  RNTTableViewBridge.m
//  reading
//
//  Created by Devin on 2021/1/15.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(RNTTableViewManager, RCTViewManager<UITableViewDelegate>)

RCT_EXPORT_VIEW_PROPERTY(color, UIColor)
RCT_EXPORT_VIEW_PROPERTY(onClick, RCTBubblingEventBlock)
RCT_EXTERN_METHOD(color: (nonnull NSNumber *)reactTag color:(UIColor *)color)

@end
