//
//  RNTCalloutManager.m
//  reading
//
//  Created by Devin on 2021/2/1.
//

#import "RNTCallout.h"
#import <React/RCTUIManager.h>

@interface RNTCalloutManager: RCTViewManager
@end

@implementation RNTCalloutManager
RCT_EXPORT_MODULE(MapCallout)

- (UIView *)view {
    return [RNTCallout new];
}
@end
