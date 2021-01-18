//
//  RNTPageViewBridge.m
//  reading
//
//  Created by Devin on 2021/1/18.
//

#import <React/RCTViewManager.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNTPageViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(autoScrollTimeInterval, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(imageURLStringsGroup, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onClick, RCTBubblingEventBlock)

@end
