//
//  RNTLocationModule.m
//  reading
//
//  Created by Devin on 2021/1/15.
//

#import <React/RCTEventEmitter.h>
#import <BMKLocationKit/BMKLocationComponent.h>

@interface RNTLocationModule : NSObject<RCTBridgeModule, BMKLocationManagerDelegate, BMKLocationAuthDelegate>

@end

@implementation RNTLocationModule
{
  BMKLocationManager *_manager;
  BOOL _initialized;
  
  RCTPromiseResolveBlock _resolve;
  RCTPromiseRejectBlock _reject;
}

RCT_EXPORT_MODULE(Initializer)

RCT_REMAP_METHOD(init, key:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
  
  _resolve = resolve;
  _reject = reject;
  [[BMKLocationAuth sharedInstance] checkPermisionWithKey:key authDelegate:self];
}

- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError {
  if (iError) {
    _reject([NSString stringWithFormat:@"%ld", iError], @"", nil);
  } else {
    _resolve(@"SUCCESS");
  }
}

- (void)BMKLocationManager:(BMKLocationManager *)manager didUpdateLocation:(BMKLocation *)location orError:(NSError *)error {
  
}

@end
