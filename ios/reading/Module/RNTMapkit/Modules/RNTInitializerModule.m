//
//  RNTInitializerModule.m
//  reading
//
//  Created by Devin on 2021/1/25.
//

#import <React/RCTBridgeModule.h>
#import <BMKLocationkit/BMKLocationComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface RNTInitializerModule: NSObject<RCTBridgeModule, BMKGeneralDelegate>

@end

@implementation RNTInitializerModule {
  BMKMapManager *_manager;
  RCTPromiseResolveBlock _resolve;
  RCTPromiseRejectBlock _reject;
}

RCT_EXPORT_MODULE(MapInitializer)

RCT_REMAP_METHOD(init, key:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
  if (!_manager) {
    _manager = [[BMKMapManager alloc] init];
  }
  
  _reject = reject;
  _resolve = resolve;
  [_manager start:key generalDelegate:self];
}

- (void)onGetPermissionState:(int)error {
  if (error) {
    _reject([NSString stringWithFormat:@"%d", error], @"MapView Init Failed", nil);
  } else {
    _resolve(@"MapView Init Success");
  }
}

@end



