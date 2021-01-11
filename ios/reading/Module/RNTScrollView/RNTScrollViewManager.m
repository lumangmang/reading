//
//  RNTScrollViewManager.m
//  reading
//
//  Created by Devin on 2021/1/11.
//

#import "RNTScrollView.h"
#import <React/RCTViewManager.h>

@interface RNTScrollViewManager: RCTViewManager

@end

@implementation RNTScrollViewManager

RCT_EXPORT_MODULE(ScrollView)

RCT_EXPORT_VIEW_PROPERTY(onClick, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(autoScrollTimeInterval, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(imageURLStringsGroup, NSArray);
RCT_EXPORT_VIEW_PROPERTY(autoScroll, BOOL);

- (UIView *)view {
  return [RNTScrollView new];
}
@end
