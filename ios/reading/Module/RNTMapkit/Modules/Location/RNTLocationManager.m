//
//  RNTLocationManager.m
//  reading
//
//  Created by Devin on 2021/1/18.
//

#import <React/RCTEventEmitter.h>
#import <BMKLocationkit/BMKLocationComponent.h>

static NSString *const ONCURRENTLOCATION      =   @"ON_CURRENT_LOCATION";
static NSString *const ONLOCATIONUPDATE       =   @"ON_LOCATION_UPDATE";

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
  return @[ONCURRENTLOCATION, ONLOCATIONUPDATE];
}

- (void)sendEvent:(NSString *)name body:(id)body {
  if (!self.hasListeners) return;
  [self sendEventWithName:name body:body];
}

- (id)json:(BMKLocation *)location error:(NSError *)error {
  if (!error) {
    return @{
      @"latitude" : @(location.location.coordinate.latitude),
      @"longitude" : @(location.location.coordinate.longitude),
      @"address" : location.rgcData.locationDescribe ? location.rgcData.locationDescribe
                                              : @"",
      @"country" : location.rgcData.country ? location.rgcData.country : @"",
      @"province" : location.rgcData.province ? location.rgcData.province : @"",
      @"city" : location.rgcData.city ? location.rgcData.city : @"",
      @"cityCode" : location.rgcData.cityCode ? location.rgcData.cityCode : @"",
      @"district" : location.rgcData.district ? location.rgcData.district : @"",
      @"street" : location.rgcData.street ? location.rgcData.street : @"",
      @"streetNumber" : location.rgcData.streetNumber ? location.rgcData.streetNumber : @"",
      @"adCode" : location.rgcData.adCode ? location.rgcData.adCode : @"",
    };
  }
  return @{
      @"errorCode" : @(error.code),
      @"errorMessage": error.localizedDescription,
      @"latitude" : @(location.location.coordinate.latitude),
      @"longitude" : @(location.location.coordinate.longitude),
    };
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
      resolve(@"Location Init Success");
    });
  } else {
    resolve(@"Location has been init");
  }
}

RCT_EXPORT_METHOD(currentLocation) {
  if (self.onLocation) return;
  self.onLocation = YES;
  dispatch_async(dispatch_get_main_queue(), ^{
    [self->_manager requestLocationWithReGeocode:YES withNetworkState:YES completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
      self.onLocation = NO;
      id body = [self json:location error:error];
      [self sendEvent:ONCURRENTLOCATION body:body];
    }];
  });
}
                 
RCT_EXPORT_METHOD(start) {
  if (self.onLocation) return;
  self.onLocation = YES;
  [_manager startUpdatingLocation];
}

RCT_EXPORT_METHOD(stop) {
  self.onLocation = NO;
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

// MARK: - BMKLocationManagerDelegate
- (void)BMKLocationManager:(BMKLocationManager *)manager didUpdateLocation:(BMKLocation *)location orError:(NSError *)error {
  id json = [self json:location error:error];
  [self sendEvent:ONLOCATIONUPDATE body:json];
}
- (void)BMKLocationManager:(BMKLocationManager *)manager didFailWithError:(NSError *)error {
  id json = [self json:nil error:error];
  [self sendEvent:ONLOCATIONUPDATE body:json];
}
@end


