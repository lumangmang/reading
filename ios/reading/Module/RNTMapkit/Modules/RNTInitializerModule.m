//
//  RNTInitializerModule.m
//  reading
//
//  Created by Devin on 2021/1/8.
//

#import <React/RCTBridgeModule.h>
#import <BaiduMapAPI_Base/BMKMapManager.h>

@interface RNTInitializerModule: NSObject <RCTBridgeModule, BMKGeneralDelegate>

@end

@implementation RNTInitializerModule {
  BMKMapManager *_manager;
  RCTPromiseResolveBlock _resolve;
  RCTPromiseRejectBlock _reject;
}

RCT_EXPORT_MODULE(BaiduMapInitializer);

RCT_REMAP_METHOD(init, key:(NSString *)key resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
  if (!_manager) {
    _manager = [BMKMapManager new];
  }
  _resolve = resolve;
  _reject = reject;
  [_manager start:key generalDelegate:self];
}

- (void)onGetPermissionState:(int)iError {
  if (iError) {
    _reject([NSString stringWithFormat:@"%d", iError], @"Permission Error", nil);
  } else {
    _resolve(@"BaiduMap Init Success");
  }
}
@end
