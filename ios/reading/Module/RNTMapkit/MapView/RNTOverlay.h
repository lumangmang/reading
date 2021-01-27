//
//  RNTOverlay.h
//  reading
//
//  Created by Devin on 2021/1/26.
//

#import "RNTMapView.h"
#import <BaiduMapAPI_Map/BMKOverlayView.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTOverlay : UIView

@property (nonatomic, weak) RNTMapView *mapView;

- (id <BMKOverlay>)overlay;
- (BMKOverlayView *)overlayView;
- (void)update;

@end

NS_ASSUME_NONNULL_END
