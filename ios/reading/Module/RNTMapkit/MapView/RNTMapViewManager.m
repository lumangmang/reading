//
//  RNTMapViewManager.m
//  reading
//
//  Created by Devin on 2021/1/25.
//

#import "RNTMapView.h"
#import <React/RCTUIManager.h>
#import <React/RCTViewManager.h>

@interface RNTMapViewManager: RCTViewManager
@end

@implementation RNTMapViewManager

- (UIView *)view {
  return [RNTMapView new];
}

RCT_EXPORT_MODULE(BaiduMapView)

@end

