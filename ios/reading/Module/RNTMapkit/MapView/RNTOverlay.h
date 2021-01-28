//
//  RNTOverlay.h
//  reading
//
//  Created by Devin on 2021/1/28.
//

#import "RNTMapView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RNTOverlay : UIView

@property (nonatomic, weak) RNTMapView *mapView;

- (id <BMKOverlay>)overlay;
- (BMKOverlayView *)overlayView;

@end

NS_ASSUME_NONNULL_END
