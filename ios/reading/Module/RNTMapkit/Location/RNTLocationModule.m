//
//  RNTLocationModule.m
//  reading
//
//  Created by Devin on 2021/1/15.
//

#import <React/RCTEventEmitter.h>
#import <BMKLocationKit/BMKLocationComponent.h>

@interface RNTLocationModule : RCTEventEmitter<RCTBridgeModule, BMKLocationManagerDelegate, BMKLocationAuthDelegate>

@end

@implementation RNTLocationModule
{
  BMKLocationManager *_manager;
  BOOL _initialized;
  
  RCTPromiseResolveBlock _resolve;
  RCTPromiseRejectBlock _reject;
}

RCT_REMAP_METHOD(init, key:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
  
  _resolve = resolve;
  _reject = reject;
  [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"" authDelegate:self];
}

- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError {
  if (iError) {
    _reject([NSString stringWithFormat:@"%ld", iError], @"", nil);
  } else {
    _resolve(nil);
  }
}

@end
