//
//  RNTLocationManager.m
//  reading
//
//  Created by Devin on 2021/1/18.
//

#import <BMKLocationkit/BMKLocationComponent.h>
#import <React/RCTEventEmitter.h>

@interface RNTLocationManager : RCTEventEmitter <RCTBridgeModule, BMKLocationManagerDelegate> {
  BMKLocationManager *_manager;
}

@property (nonatomic) BOOL onLocation;
@property (nonatomic) BOOL hasListeners;
@property (nonatomic) BOOL initialized;

@end

@implementation RNTLocationManager

+ (BOOL)requiresMainQueueSetup {
  return YES;
}
- (void)dealloc
{
  [_manager stopUpdatingLocation];
  _manager = nil;
}
- (void)startObserving
{
    self.hasListeners = YES;
}

- (void)stopObserving
{
    self.hasListeners = NO;
}
- (NSArray<NSString *> *)supportedEvents {
  return @[@"currentLocation", @"onLocationUpdate"];
}

- (void)sendEvent:(NSString *)name body:(id)body {
  if (!self.hasListeners) return;
  [self sendEventWithName:name body:body];
}

RCT_EXPORT_MODULE(LocationManager)

RCT_REMAP_METHOD(init, initWithKey
                 : (NSString *)key
                 : (RCTPromiseResolveBlock)resolve
                 : (RCTPromiseRejectBlock)reject) {
  if (!self.initialized) {
    self.initialized = YES;
    dispatch_async(dispatch_get_main_queue(), ^{
      [[BMKLocationAuth sharedInstance] checkPermisionWithKey:key authDelegate:nil];
      if (!(self->_manager)) {
        self->_manager = [[BMKLocationManager alloc] init];
        self->_manager.delegate = self;
      }
      resolve(nil);
    });
  } else {
    resolve(nil);
  }
}

RCT_EXPORT_METHOD(currentLocation:(NSString *)location) {
  if (self.onLocation) return;
  self.onLocation = YES;
  dispatch_async(dispatch_get_main_queue(), ^{
    [self->_manager requestLocationWithReGeocode:YES withNetworkState:YES completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
      self.onLocation = NO;
      [self sendEvent:@"currentLocation" body:@{@"value": @"2"}];
    }];
  });
}
                 
RCT_EXPORT_METHOD(start) {
  [_manager startUpdatingLocation];
}

RCT_EXPORT_METHOD(stop) {
  [_manager stopUpdatingLocation];
}

RCT_EXPORT_METHOD(setLocatingWithReGeocode:(BOOL)value) {
  _manager.locatingWithReGeocode = value;
}

RCT_EXPORT_METHOD(setAllowsBackgroundLocationUpdates:(BOOL)value) {
  _manager.allowsBackgroundLocationUpdates = value;
}

RCT_EXPORT_METHOD(setPausesLocationUpdatesAutomatically:(BOOL)value) {
  _manager.pausesLocationUpdatesAutomatically = value;
}

RCT_EXPORT_METHOD(setDesiredAccuracy:(int)value) {
  _manager.desiredAccuracy = value;
}

RCT_EXPORT_METHOD(setDistanceFilter:(int)value) {
  _manager.distanceFilter = value;
}

RCT_EXPORT_METHOD(setReGeocodeTimeout:(int)value) {
  _manager.reGeocodeTimeout = value;
}

RCT_EXPORT_METHOD(setLocationTimeout:(int)value) {
  _manager.locationTimeout = value;
}

@end


