//
//  RNTOverlay.m
//  reading
//
//  Created by Devin on 2021/1/26.
//

#import "RNTOverlay.h"

@implementation RNTOverlay

- (id<BMKOverlay>)overlay {
  return nil;
}

- (BMKOverlayView *)overlayView {
  return nil;
}

- (void)update {
  _mapView.centerCoordinate = _mapView.centerCoordinate;
}

@end
